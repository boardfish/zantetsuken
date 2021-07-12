# frozen_string_literal: true

module Zantetsuken
  # A set of rules that comprises a Content Security Policy.
  module Ruleset
    # Base class for rulesets. Defines the rules to be applied and the behavior
    # for composing these rulesets into a single instance of
    # ActionDispatch::ContentSecurityPolicy.
    class Base
      include ActiveModel::AttributeAssignment

      attr_accessor :base_uri, :default_src, :font_src, :img_src, :object_src, :script_src, :frame_src, :connect_src,
                    :style_src, :child_src, :form_action, :media_src, :report_uri

      def initialize(**attributes)
        assign_attributes(attributes)
      end

      def add(ruleset)
        tap do
          assign_attributes(
            to_h.merge(ruleset.to_h) do |_, existing_rules, new_rules|
              Array.wrap(existing_rules) | Array.wrap(new_rules)
            end
          )
        end
      end

      def to_h
        instance_values.symbolize_keys
      end

      def to_actiondispatch_csp(policy)
        instance_values.each do |rule_name, attribute|
          policy.public_send(rule_name, *attribute)
        end
      end

      def load?
        true
      end
    end
  end
end
