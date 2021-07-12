# frozen_string_literal: true

module Zantetsuken
  module Ruleset
    # Used in the Twitch player embed at the LIVE page.
    class WebpackDevServer < Base
      def initialize(**attributes)
        super
        self.connect_src ||= [
          'http://localhost:3035',
          'ws://localhost:3035'
        ]
      end

      def load?
        Rails.env.development?
      end
    end
  end
end
