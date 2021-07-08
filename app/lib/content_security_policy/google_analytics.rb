# frozen_string_literal: true

module ContentSecurityPolicy
  module Ruleset
    # Used to drive analytics, including for example pageviews, via Google.
    class GoogleAnalytics < Base
      def script_src
        ['https://www.google-analytics.com', 'https://ssl.google-analytics.com']
      end

      def img_src
        'https://www.google-analytics.com'
      end

      def connect_src
        'https://www.google-analytics.com'
      end
    end
  end
end
