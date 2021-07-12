# frozen_string_literal: true

module Zantetsuken
  module Ruleset
    # A locally-hosted S3 server. Serves uploaded assets.
    class Minio < Base
      ruleset do
        self.connect_src = 'http://localhost:9000'
        self.img_src     = 'http://localhost:9000'
      end

      def load?
        Rails.env.development?
      end
    end
  end
end
