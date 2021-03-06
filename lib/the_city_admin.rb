require 'rubygems'
require 'openssl'
require 'cgi'
require 'base64'
require 'openssl'
require 'net/http'
require 'net/https'
require 'typhoeus'
require 'json'


TCA_ENV = 'production' unless defined?(TCA_ENV)
THE_CITY_ADMIN_PATH = 'https://api.onthecity.org' unless defined?(THE_CITY_ADMIN_PATH)
THE_CITY_ADMIN_API_VERSION = 'application/vnd.thecity.admin.v1+json' unless defined?(THE_CITY_ADMIN_API_VERSION)

# The path to the lib directory.
THECITY_LIB_DIR = File.dirname(__FILE__)

# The path to the storage directory that will be used for caching data to disk.
THECITY_STORAGE_DIR = File.dirname(__FILE__) + '/../storage/'

require File.dirname(__FILE__) + '/auto_load.rb'

require File.dirname(__FILE__) + '/common.rb'


# This class is meant to be a wrapper TheCity Admin API (OnTheCity.org).
module TheCity

  class AdminApi
    class << self
      attr_reader :api_key, :api_token
    end
    
    def self.connect(admin_api_key, admin_api_token)
      raise TheCityExceptions::UnableToConnectToTheCity.new('Key and Token cannot be nil.') if admin_api_key.nil? or admin_api_token.nil?
      @api_key = admin_api_key
      @api_token = admin_api_token
    end

  end

end
