# frozen_string_literal: true

require 'active_model'
require 'action_dispatch'
require 'active_support/core_ext/object/instance_variables'
require 'active_support/core_ext/array/wrap'
require 'active_support/core_ext/string/inquiry'

require_relative 'zantetsuken/ruleset'
require_relative 'zantetsuken/ruleset/base'
require_relative 'zantetsuken/ruleset/adobe_document_cloud'
require_relative 'zantetsuken/ruleset/airtable'
require_relative 'zantetsuken/ruleset/google_analytics'
require_relative 'zantetsuken/ruleset/intercom'
require_relative 'zantetsuken/ruleset/minio'
require_relative 'zantetsuken/ruleset/recaptcha'
require_relative 'zantetsuken/ruleset/site'
require_relative 'zantetsuken/ruleset/stripe'
require_relative 'zantetsuken/ruleset/timekit'
require_relative 'zantetsuken/ruleset/twitch'
require_relative 'zantetsuken/ruleset/typeform'
require_relative 'zantetsuken/ruleset/webpack_dev_server'

# A policy that defines sources from which content should be able to load in the
# browser when you visit this Rails application.
module Zantetsuken
  class << self
    def load(base_policy = ActionDispatch::ContentSecurityPolicy.new)
      self::Ruleset.load(base_policy)
    end
  end
end
