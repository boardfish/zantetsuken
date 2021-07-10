# Content Security Policy Builder

The Content Security Policy (CSP) initializer in Rails can get cluttered
fast. Break it down with the help of this gem.

## Installation

Add `gem 'csp-builder'` to your Gemfile and run `bundle install`.
Alternatively, install the gem directly by calling `gem install
csp-builder` in your shell.

## Usage

Update `config/initializer/content_security_policy` to include the
following:

```ruby
Rails.application.config.content_security_policy do |policy|
  ContentSecurityPolicy.load(policy)
end
```

This will compose any rulesets you've defined under the
`ContentSecurityPolicy::Ruleset` module into a single
`ActionDispatch::ContentSecurityPolicy`, which is what Rails uses under
the hood to build your CSP.

### Defining rulesets

You should define your rulesets under
`app/lib/content_security_policy/ruleset`. Here's an example:

```ruby
# app/lib/content_security_policy/ruleset/stripe/js.rb

# frozen_string_literal: true

module ContentSecurityPolicy
  module Ruleset
    module Stripe
      # Used for loading Stripe's JS library.
      class Js < Base
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
```

You should:

- call `super` first to initialize the parent state
- inherit from `ContentSecurityPolicy::Ruleset::Base` so that the
  ruleset can be composed with others.

## Contributing

Contributions are welcome by way of a pull request. Pull requests with
failing test cases are preferable to issues, if you feel comfortable
doing that.
