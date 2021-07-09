# frozen_string_literal: true

module ContentSecurityPolicy
  module Ruleset
    # Displays forms that go straight to an internal database with a UI.
    class Airtable < Base
      def frame_src
        'https://airtable.com'
      end
    end
  end
end
