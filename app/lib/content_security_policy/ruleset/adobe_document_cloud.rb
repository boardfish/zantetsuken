# frozen_string_literal: true

module ContentSecurityPolicy
  module Ruleset
    # Supports Adobe's Document Cloud PDF Embed API.
    class AdobeDocumentCloud
      def script_src
        'https://documentcloud.adobe.com/view-sdk/'
      end

      def frame_src
        'https://documentcloud.adobe.com/view-sdk/'
      end
    end
  end
end
