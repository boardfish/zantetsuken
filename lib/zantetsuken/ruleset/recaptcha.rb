# frozen_string_literal: true

module Zantetsuken
  module Ruleset
    # For verification that our users aren't bots.
    class Recaptcha < Base
      def initialize(**attributes)
        super
        self.script_src ||= ['https://www.google.com/recaptcha/', 'https://www.gstatic.com/recaptcha/']
        self.frame_src  ||= ['https://www.google.com/recaptcha/', 'https://recaptcha.google.com/recaptcha/']
        # 'https://www.recaptcha.net'
      end
    end
  end
end
