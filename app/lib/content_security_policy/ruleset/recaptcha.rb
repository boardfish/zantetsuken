# frozen_string_literal: true

module ContentSecurityPolicy
  module Ruleset
    # For verification that our users aren't bots.
    class Recaptcha < Base
      def script_src
        ['https://www.google.com/recaptcha/', 'https://www.gstatic.com/recaptcha/']
      end

      def frame_src
        ['https://www.google.com/recaptcha/', 'https://recaptcha.google.com/recaptcha/']
        # 'https://www.recaptcha.net'
      end
    end
  end
end
