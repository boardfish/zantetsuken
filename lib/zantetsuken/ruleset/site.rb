# frozen_string_literal: true

module Zantetsuken
  module Ruleset
    # Used in the Twitch player embed at the LIVE page.
    class Site < Base
      ruleset do
        self.base_uri    = :self
        self.default_src = :self, :https
        self.font_src    = :self, :https, :data
        self.img_src     = :self, :https, :data
        self.object_src  = :none
        self.script_src  = :strict_dynamic, :self, :https, :unsafe_inline
        self.style_src   = :self, :https, :unsafe_inline
        self.connect_src = :self
      end
    end
  end
end
