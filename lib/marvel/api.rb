require 'marvel/api/http_service'
require 'marvel/api/version'

module Marvel
  class Api
    class << self
      attr_accessor :http_service
    end

    self.http_service = HTTPService

    attr_reader :public_key, :private_key, :options

    def initialize(public_key, private_key, options = {})
      @public_key = public_key
      @private_key = private_key
      @options = options
    end
  end
end
