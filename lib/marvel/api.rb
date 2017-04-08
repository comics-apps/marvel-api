require 'marvel/api/http_service'
require 'marvel/api/version'

module Marvel
  module Api
    class << self
      attr_accessor :http_service
    end

    self.http_service = HTTPService
  end
end
