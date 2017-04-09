require 'marvel/api/api_methods'
require 'marvel/api/http_service'
require 'marvel/api/request'
require 'marvel/api/response'
require 'marvel/api/version'

module Marvel
  class Api
    include ApiMethods

    class << self
      attr_accessor :http_service
    end

    self.http_service = HTTPService

    DEFAULT_SERVER = 'http://gateway.marvel.com'.freeze

    attr_reader :public_key, :private_key, :options

    def initialize(public_key, private_key, options = {})
      @public_key = public_key
      @private_key = private_key
      @options = options
    end

    def api_call(path, args, options = {})
      request = Request.new(
        path: path,
        args: args.merge(apikey: public_key, ts: ts, hash: request_hash),
        options: options
      )
      self.class.http_service.make_request(request)
    end

    def comics(args = {})
      api_call('comics', args)
    end

    private

    def ts
      Time.now.utc.to_i
    end

    def request_hash
      Digest::MD5.hexdigest("#{ts}#{private_key}#{public_key}")
    end
  end
end
