# frozen_string_literal: true

module ContentSecurityPolicy
  module Ruleset
    # Used in the Twitch player embed at the LIVE page.
    class Site < Base
      def initialize(**attributes) # rubocop:disable Metrics/CyclomaticComplexity
        super
        self.base_uri    ||= [:self]
        self.default_src ||= %i[self https]
        self.font_src    ||= %i[self https data]
        self.img_src     ||= %i[self https data]
        self.object_src  ||= [:none]
        self.script_src  ||= %i[strict_dynamic self https unsafe_inline]
        self.style_src   ||= %i[self https unsafe_inline]
        self.connect_src ||= %i[self]
      end
    end
  end
end
