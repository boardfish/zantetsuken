# frozen_string_literal: true

# A policy that defines sources from which content should be able to load in the
# browser when you visit Raise.dev.
module ContentSecurityPolicy
  class << self
    def load(base_policy = ActionDispatch::ContentSecurityPolicy.new)
      self::Ruleset.load(base_policy)
    end
  end
end
