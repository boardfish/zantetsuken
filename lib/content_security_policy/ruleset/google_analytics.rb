# frozen_string_literal: true

module ContentSecurityPolicy
  module Ruleset
    # Used to drive analytics, including for example pageviews, via Google.
    class GoogleAnalytics < Base
      def initialize(**attributes)
        super
        self.script_src  ||= ['https://www.google-analytics.com', 'https://ssl.google-analytics.com']
        self.img_src     ||= 'https://www.google-analytics.com'
        self.connect_src ||= 'https://www.google-analytics.com'
      end
    end
  end
end
