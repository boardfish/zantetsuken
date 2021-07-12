# frozen_string_literal: true

module Zantetsuken
  module Ruleset
    # Displays forms.
    class Typeform < Base
      ruleset do
        self.frame_src = ['https://form.typeform.com', 'https://raisedevs.typeform.com']
      end
    end
  end
end
