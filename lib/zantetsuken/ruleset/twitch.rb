# frozen_string_literal: true

module Zantetsuken
  module Ruleset
    # Used in the Twitch player embed at the LIVE page.
    class Twitch < Base
      def initialize(**attributes)
        super
        # TODO: don't include HTTPS in prod?
        self.default_src ||= ['http://player.twitch.tv', 'https://player.twitch.tv']
        self.script_src ||= 'https://embed.twitch.tv'
        self.frame_src ||= ['https://player.twitch.tv',
                            'http://player.twitch.tv']
      end
    end
  end
end
