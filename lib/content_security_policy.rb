# frozen_string_literal: true

require 'active_model'
require 'action_dispatch'
require 'active_support/core_ext/object/instance_variables'
require 'active_support/core_ext/array/wrap'
require 'active_support/core_ext/string/inquiry'

require_relative 'content_security_policy/ruleset'
require_relative 'content_security_policy/ruleset/base'
require_relative 'content_security_policy/ruleset/adobe_document_cloud'
require_relative 'content_security_policy/ruleset/airtable'
require_relative 'content_security_policy/ruleset/google_analytics'
require_relative 'content_security_policy/ruleset/intercom'
require_relative 'content_security_policy/ruleset/minio'
require_relative 'content_security_policy/ruleset/recaptcha'
require_relative 'content_security_policy/ruleset/site'
require_relative 'content_security_policy/ruleset/stripe'
require_relative 'content_security_policy/ruleset/timekit'
require_relative 'content_security_policy/ruleset/twitch'
require_relative 'content_security_policy/ruleset/typeform'
require_relative 'content_security_policy/ruleset/webpack_dev_server'

# A policy that defines sources from which content should be able to load in the
# browser when you visit this Rails application.
module ContentSecurityPolicy
  class << self
    def load(base_policy = ActionDispatch::ContentSecurityPolicy.new)
      self::Ruleset.load(base_policy)
    end
  end
end
