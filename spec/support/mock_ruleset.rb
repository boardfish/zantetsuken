# frozen_string_literal: true

require 'zantetsuken'

class MockRuleset < Zantetsuken::Ruleset::Base
  ruleset do
    self.base_uri    = :self
    self.default_src = :self, :https, :unsafe_eval, 'http://example.com'
    self.font_src    = :self, :https, :data
    self.img_src     = :self, :https, :data, 'http://example.com'
    self.object_src  = :none
    self.script_src  = :strict_dynamic, :self, :https, :unsafe_inline, 'http://example.com'
    self.frame_src   = 'http://example.com'
    self.connect_src = :self, :https, 'http://example.com'
    self.style_src   = :self, :https, :unsafe_inline
  end
end
