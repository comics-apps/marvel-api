RSpec.describe Marvel::Api do
  it 'has an http_service accessor' do
    expect(Marvel::Api).to respond_to(:http_service)
    expect(Marvel::Api).to respond_to(:http_service=)
  end

  describe 'constants' do
    it 'has a version' do
      expect(Marvel::Api.const_defined?('VERSION')).to be_truthy
    end

    it 'has a filled default server' do
      expect(Marvel::Api.const_defined?('DEFAULT_SERVER')).to be_truthy
      expect(Marvel::Api::DEFAULT_SERVER).to eq('http://gateway.marvel.com')
    end
  end

  it 'has an attr_reader for public key' do
    public_key = 'public-key'
    private_key = 'private-key'
    service = Marvel::Api.new(public_key, private_key)
    expect(service.public_key).to eq(public_key)
  end

  it 'has an attr_reader for private key' do
    public_key = 'public-key'
    private_key = 'private-key'
    service = Marvel::Api.new(public_key, private_key)
    expect(service.public_key).to eq(public_key)
  end

  it 'has an attr_reader for options with default value' do
    public_key = 'public-key'
    private_key = 'private-key'
    service = Marvel::Api.new(public_key, private_key)
    expect(service.options).to eq({})
  end

  it 'has an attr_reader for options with passed value' do
    public_key = 'public-key'
    private_key = 'private-key'
    options = { proxy: 'localhost' }
    service = Marvel::Api.new(public_key, private_key, options)
    expect(service.options).to eq(proxy: 'localhost')
  end

  it 'returns response for types request' do
    VCR.use_cassette('comics') do
      service = Marvel::Api.new(
        ENV['MARVEL_PUBLIC_KEY'], ENV['MARVEL_PRIVATE_KEY']
      )
      response = service.comics(limit: 1)
      expect(response).to be_a(Marvel::Api::Response)
      expect(response.status).to eq(200)
      expect(response.results).to be_an(Array)
      expect(response.results).not_to be_empty
    end
  end
end
