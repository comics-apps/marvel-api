require 'spec_helper'

RSpec.describe Marvel::Api::HTTPService do
  it 'has a faraday_middleware accessor' do
    expect(Marvel::Api::HTTPService).to respond_to(:faraday_middleware)
    expect(Marvel::Api::HTTPService).to respond_to(:faraday_middleware=)
  end

  it 'has an http_options accessor' do
    expect(Marvel::Api::HTTPService).to respond_to(:http_options)
    expect(Marvel::Api::HTTPService).to respond_to(:http_options=)
  end

  it 'sets http_options to {} by default' do
    expect(Marvel::Api::HTTPService.http_options).to eq({})
  end

  describe 'DEFAULT_MIDDLEWARE' do
    class FakeBuilder
      attr_reader :adapters

      def adapter(arg)
        @adapters ||= []
        @adapters << arg
      end
    end

    let(:builder) { FakeBuilder.new }

    it 'adds the right default middleware' do
      Marvel::Api::HTTPService::DEFAULT_MIDDLEWARE.call(builder)
      expect(builder.adapters).to eq([Faraday.default_adapter])
    end
  end

  describe '.make_request' do
    let(:mock_body) { 'a body' }
    let(:mock_headers_hash) { double(value: 'headers hash') }
    let(:mock_http_response) do
      double('Faraday Response', status: 200, headers: mock_headers_hash,
                                 body: mock_body)
    end

    let(:request) do
      Marvel::Api::Request.new(
        path: 'foo', args: { 'an' => :arg }, options: {}
      )
    end

    before :each do
      allow_any_instance_of(Faraday::Connection)
        .to receive(:get).and_return(mock_http_response)
    end

    it 'makes a Faraday request appropriately' do
      expect_any_instance_of(Faraday::Connection)
        .to receive(:get) do |instance, path|

        expect(path).to eq(request.path)
        expect(instance.params).to eq({})
        expect(instance.url_prefix).to eq(URI.parse(request.server))

        mock_http_response
      end

      Marvel::Api::HTTPService.make_request(request)
    end

    it 'returns the right response' do
      response = Marvel::Api::HTTPService.make_request(request)
      expect(response.status).to eq(mock_http_response.status)
      expect(response.headers).to eq(mock_http_response.headers)
      expect(response.body).to eq(mock_http_response.body)
    end

    context 'when HTTPService.faraday_middleware block is not defined' do
      it 'uses the default builder block' do
        block = proc do |builder|
          builder.request :url_encoded
        end
        stub_const('Marvel::Api::HTTPService::DEFAULT_MIDDLEWARE', block)
        allow(Marvel::Api::HTTPService).to receive(:faraday_middleware)
          .and_return(nil)

        expect_any_instance_of(Faraday::Connection)
          .to receive(:get) do |instance|

          expect(instance.builder.handlers)
            .to eq([Faraday::Request::UrlEncoded])
          mock_http_response
        end

        Marvel::Api::HTTPService.make_request(request)
      end
    end

    context 'when HTTPService.faraday_middleware block is defined' do
      it 'uses the defined HTTPService.faraday_middleware block' do
        block = proc do |builder|
          builder.request :url_encoded
        end
        expect(Marvel::Api::HTTPService)
          .to receive(:faraday_middleware).and_return(block)

        expect_any_instance_of(Faraday::Connection)
          .to receive(:get) do |instance|

          expect(instance.builder.handlers)
            .to eq([Faraday::Request::UrlEncoded])
          mock_http_response
        end

        Marvel::Api::HTTPService.make_request(request)
      end
    end
  end
end
