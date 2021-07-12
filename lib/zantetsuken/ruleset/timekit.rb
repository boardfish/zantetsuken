# frozen_string_literal: true

module Zantetsuken
  module Ruleset
    # Used in the Twitch player embed at the LIVE page.
    class TimeKit < Base
      ruleset do
        self.connect_src = 'https://api.timekit.io'
      end
    end
  end
end
