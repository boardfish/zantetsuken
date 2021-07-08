# frozen_string_literal: true

module ContentSecurityPolicy
  module Ruleset
    module Stripe
      # Used for loading Stripe's JS library.
      class Js
        def connect_src
          'https://api.stripe.com'
        end

        def frame_src
          ['https://js.stripe.com', 'https://hooks.stripe.com']
        end

        def script_src
          'https://js.stripe.com'
        end
      end
    end
  end
end
