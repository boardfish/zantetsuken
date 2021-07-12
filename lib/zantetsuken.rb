# frozen_string_literal: true

require 'active_model'
require 'action_dispatch'
require 'active_support/core_ext/object/instance_variables'
require 'active_support/core_ext/array/wrap'
require 'active_support/core_ext/string/inquiry'

require_relative 'zantetsuken/ruleset'
require_relative 'zantetsuken/ruleset/base'

# A policy that defines sources from which content should be able to load in the
# browser when you visit this Rails application.
module Zantetsuken
  class << self
    def load(base_policy = ActionDispatch::ContentSecurityPolicy.new)
      self::Ruleset.load(base_policy)
    end
  end
end
