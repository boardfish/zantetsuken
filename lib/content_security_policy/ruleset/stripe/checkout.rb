# frozen_string_literal: true

module ContentSecurityPolicy
  module Ruleset
    module Stripe
      # Supports Stripe's Checkout feature.
      class Checkout < Base
        def initialize(**attributes)
          super
          self.connect_src ||= 'https://checkout.stripe.com'
          self.frame_src   ||= 'https://checkout.stripe.com'
          self.script_src  ||= 'https://checkout.stripe.com'
          self.img_src     ||= 'https://*.stripe.com'
        end
      end
    end
  end
end
