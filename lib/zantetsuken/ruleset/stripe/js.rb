# frozen_string_literal: true

module Zantetsuken
  module Ruleset
    module Stripe
      # Used for loading Stripe's JS library.
      class Js
        def initialize(**attributes)
          super
          self.connect_src ||= 'https://api.stripe.com'
          self.frame_src   ||= ['https://js.stripe.com', 'https://hooks.stripe.com']
          self.script_src  ||= 'https://js.stripe.com'
        end
      end
    end
  end
end
