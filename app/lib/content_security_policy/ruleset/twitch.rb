# frozen_string_literal: true

module ContentSecurityPolicy
  module Ruleset
    # Used in the Twitch player embed at the LIVE page.
    class Twitch < Base
      def default_src
        # TODO: don't include HTTPS in prod?
        ['http://player.twitch.tv', 'https://player.twitch.tv']
      end

      def script_src
        'https://embed.twitch.tv'
      end

      def frame_src
        ['https://player.twitch.tv',
         'http://player.twitch.tv']
      end
    end
  end
end
