# frozen_string_literal: true

module ContentSecurityPolicy
  module Ruleset
    class Base
      include ActiveModel::Attributes
      include ActiveModel::AttributeAssignment

      attr_accessor :base_uri, :default_src, :font_src, :img_src, :object_src, :script_src, :frame_src, :connect_src,
                    :style_src, :report_uri

      def initialize(**attributes)
        assign_attributes(attributes)
      end

      def add(ruleset)
        tap do
          assign_attributes(
            to_h.merge(ruleset.to_h) { |_, existing_rules, new_rules| Array.wrap(existing_rules) | Array.wrap(new_rules) }
          )
        end
      end

      def to_h
        instance_values.symbolize_keys
      end

      def to_actiondispatch_csp
        ActionDispatch::ContentSecurityPolicy.new do |policy|
          instance_values.each do |rule_name, attribute|
            policy.public_send(rule_name, *attribute)
          end
        end
      end

      def load?
        true
      end
    end
  end
end
