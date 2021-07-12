# frozen_string_literal: true

module Zantetsuken
  module Ruleset
    # Displays forms that go straight to an internal database with a UI.
    class Airtable < Base
      ruleset do
        self.frame_src = 'https://airtable.com'
      end
    end
  end
end
