# frozen_string_literal: true

# A set of rules to apply as part of the content security policy.
module ContentSecurityPolicy
  module Ruleset
    # Inherit from this class to define a set of rules that should be bundled into the content security policy.
    class Base
      # Return an empty array by default.
      %i[
        base_uri default_src font_src img_src object_src script_src frame_src connect_src style_src
      ].each do |method_name|
        define_method(method_name) { [] }
      end
    end
  end
end
