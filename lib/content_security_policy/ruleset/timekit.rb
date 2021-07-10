# frozen_string_literal: true

module ContentSecurityPolicy
  module Ruleset
    # Used in the Twitch player embed at the LIVE page.
    class TimeKit < Base
      def initialize(**attributes) # rubocop:disable Metrics/CyclomaticComplexity
        super
        self.connect_src ||= %w[https://api.timekit.io]
      end
    end
  end
end
