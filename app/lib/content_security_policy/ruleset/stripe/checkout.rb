# frozen_string_literal: true

module ContentSecurityPolicy
  module Ruleset
    module Stripe
      # Supports Stripe's Checkout feature.
      class Checkout
        def connect_src
          'https://checkout.stripe.com'
        end

        def frame_src
          'https://checkout.stripe.com'
        end

        def script_src
          'https://checkout.stripe.com'
        end

        def img_src
          'https://*.stripe.com'
        end
      end
    end
  end
end
