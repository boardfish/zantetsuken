# frozen_string_literal: true

module ContentSecurityPolicy
  # Contains definitions for sets of rules that should be applied as part of the
  # content security policy.
  module Ruleset
    class << self
      def load(base_policy = ActionDispatch::ContentSecurityPolicy.new)
        load_all_rulesets_in(self).to_actiondispatch_csp(base_policy)
      end

      private

      def load_all_rulesets_in(mod, base_policy = self::Base.new)
        mod.constants(false).reduce(base_policy) do |policy, ruleset_class|
          klass = mod.const_get(ruleset_class)
          if klass <= Base
            klass.new.load? ? policy.add(klass.new) : policy
          else
            load_all_rulesets_in(klass, policy)
          end
        end
      end
    end
  end
end
