# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ContentSecurityPolicy::Builder do
  let(:base_ruleset) { described_class.new(**existing_rules) }
  let(:existing_rules) { {} }
  let(:new_rules) do
    {
      base_uri: Faker::Internet.url,
      default_src: Faker::Internet.url,
      font_src: Faker::Internet.url,
      img_src: Faker::Internet.url,
      object_src: Faker::Internet.url,
      script_src: Faker::Internet.url,
      frame_src: Faker::Internet.url,
      connect_src: Faker::Internet.url,
      style_src: Faker::Internet.url
    }
  end

  describe '#new' do
    subject { base_ruleset }

    context 'when no rules are passed' do
      it { is_expected.to have_attributes existing_rules }
    end

    context 'when rules are passed' do
      let(:existing_rules) { new_rules }

      it { is_expected.to have_attributes new_rules }
    end
  end

  describe '#add' do
    subject { base_ruleset.add(new_rules) }

    it { is_expected.to be_a described_class }

    context 'when no rules already exist' do
      it { is_expected.to have_attributes new_rules }
    end

    context 'when rules already exist' do
      let(:existing_rules) do
        {
          base_uri: 'ruleset 1', # copes with a singular attribute
          default_src: ['ruleset 1:1', 'ruleset 1:2'],
          font_src: nil, # copes with a nil/empty attribute
          img_src: ['ruleset 1:1', 'ruleset 1:2'],
          object_src: ['ruleset 1:1', 'ruleset 1:2'],
          script_src: ['ruleset 1:1', 'ruleset 1:2'],
          frame_src: ['ruleset 1:1', 'ruleset 1:2'],
          connect_src: ['ruleset 1:1', 'ruleset 1:2'],
          style_src: ['ruleset 1:1', 'ruleset 1:2']
        }
      end

      let(:new_rules) do
        {
          base_uri: 'ruleset 2',
          default_src: ['ruleset 2:1', 'ruleset 2:2'],
          font_src: ['ruleset 2:1', 'ruleset 2:2'],
          img_src: ['ruleset 2:1', 'ruleset 2:2'],
          object_src: ['ruleset 2:1', 'ruleset 2:2'],
          script_src: ['ruleset 2:1', 'ruleset 2:2'],
          frame_src: ['ruleset 2:1', 'ruleset 2:2'],
          connect_src: ['ruleset 2:1', 'ruleset 2:2'],
          style_src: ['ruleset 2:1', 'ruleset 2:2']
        }
      end

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
end
