# frozen_string_literal: true

require 'zantetsuken'
require 'faker'
require_relative '../../../support/mock_ruleset'
require_relative '../../../support/mock_ruleset_2'

RSpec.describe Zantetsuken::Ruleset::Base do
  let(:base_ruleset) { MockRuleset.new }
  let(:existing_rules) { {} }

  describe '#new' do
    subject { base_ruleset }

    it {
      is_expected.to have_attributes({
                                       base_uri: :self,
                                       default_src: [:self, :https, :unsafe_eval, 'http://example.com'],
                                       img_src: [:self, :https, :data, 'http://example.com'],
                                       object_src: :none,
                                       script_src: [:strict_dynamic, :self, :https, :unsafe_inline, 'http://example.com'],
                                       frame_src: 'http://example.com',
                                       connect_src: [:self, :https, 'http://example.com'],
                                       style_src: %i[self https unsafe_inline]
                                     })
    }
  end

  describe '#add' do
    subject { base_ruleset.add(new_ruleset) }

    let(:new_ruleset) { MockRulesetAdd2.new }

    it { is_expected.to be_a described_class }

    context 'when no rules already exist' do
      let(:base_ruleset) { described_class.new }

      it { is_expected.to have_attributes new_ruleset.instance_values }
    end

    context 'when rules already exist' do
      let(:base_ruleset) { MockRulesetAdd1.new }

      let(:target_ruleset_contents) do
        {
          base_uri: ['ruleset 1', 'ruleset 2'],
          default_src: ['ruleset 1:1', 'ruleset 1:2', 'ruleset 2:1', 'ruleset 2:2'],
          font_src: ['ruleset 2:1', 'ruleset 2:2'],
          img_src: ['ruleset 1:1', 'ruleset 1:2', 'ruleset 2:1', 'ruleset 2:2'],
          object_src: ['ruleset 1:1', 'ruleset 1:2', 'ruleset 2:1', 'ruleset 2:2'],
          script_src: ['ruleset 1:1', 'ruleset 1:2', 'ruleset 2:1', 'ruleset 2:2'],
          frame_src: ['ruleset 1:1', 'ruleset 1:2', 'ruleset 2:1', 'ruleset 2:2'],
          connect_src: ['ruleset 1:1', 'ruleset 1:2', 'ruleset 2:1', 'ruleset 2:2'],
          style_src: ['ruleset 1:1', 'ruleset 1:2', 'ruleset 2:1', 'ruleset 2:2']
        }
      end

      it { is_expected.to have_attributes(target_ruleset_contents) }
    end
  end

  describe '#to_actiondispatch_csp' do
    subject do
      ActionDispatch::ContentSecurityPolicy.new do |policy|
        base_ruleset.to_actiondispatch_csp(policy)
      end.instance_variable_get(:@directives)
    end

    let(:expectation) do
      {
        'base-uri' => ["'self'"],
        'default-src' => ["'self'", 'https:', "'unsafe-eval'", 'http://example.com'],
        'font-src' => ["'self'", 'https:', 'data:'],
        'img-src' => ["'self'", 'https:', 'data:', 'http://example.com'],
        'object-src' => ["'none'"],
        'script-src' => ["'strict-dynamic'", "'self'", 'https:', "'unsafe-inline'", 'http://example.com'],
        'frame-src' => ['http://example.com'],
        'connect-src' => ["'self'", 'https:', 'http://example.com'],
        'style-src' => ["'self'", 'https:', "'unsafe-inline'"]
      }
    end

    it { is_expected.to eq(expectation) }
  end
end
