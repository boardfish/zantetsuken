# frozen_string_literal: true

module ContentSecurityPolicy
  module Ruleset
    # Displays forms that go straight to an internal database with a UI.
    class Airtable < Base
      def initialize(**attributes)
        super
        self.frame_src ||= [
          'https://form.typeform.com',
          'https://raisedevs.typeform.com'
        ]
      end
    end
  end
end
