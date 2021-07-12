# frozen_string_literal: true

require 'zantetsuken'

class MockRulesetAdd1 < Zantetsuken::Ruleset::Base
  ruleset do
    self.base_uri    = 'ruleset 1' # copes with a singular attribute
    self.default_src = 'ruleset 1:1', 'ruleset 1:2'
    self.font_src    = nil # copes with a nil/empty attribute
    self.img_src     = 'ruleset 1:1', 'ruleset 1:2'
    self.object_src  = 'ruleset 1:1', 'ruleset 1:2'
    self.script_src  = 'ruleset 1:1', 'ruleset 1:2'
    self.frame_src   = 'ruleset 1:1', 'ruleset 1:2'
    self.connect_src = 'ruleset 1:1', 'ruleset 1:2'
    self.style_src   = 'ruleset 1:1', 'ruleset 1:2'
  end
end

class MockRulesetAdd2 < Zantetsuken::Ruleset::Base
  ruleset do
    self.base_uri    = 'ruleset 2'
    self.default_src = 'ruleset 2:1', 'ruleset 2:2'
    self.font_src    = 'ruleset 2:1', 'ruleset 2:2'
    self.img_src     = 'ruleset 2:1', 'ruleset 2:2'
    self.object_src  = 'ruleset 2:1', 'ruleset 2:2'
    self.script_src  = 'ruleset 2:1', 'ruleset 2:2'
    self.frame_src   = 'ruleset 2:1', 'ruleset 2:2'
    self.connect_src = 'ruleset 2:1', 'ruleset 2:2'
    self.style_src   = 'ruleset 2:1', 'ruleset 2:2'
  end
end
