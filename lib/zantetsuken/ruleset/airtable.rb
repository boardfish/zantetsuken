# frozen_string_literal: true

module Zantetsuken
  module Ruleset
    # Displays forms that go straight to an internal database with a UI.
    class Airtable < Base
      def initialize(**attributes)
        super
        self.frame_src ||= 'https://airtable.com'
      end
    end
  end
end
