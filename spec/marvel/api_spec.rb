RSpec.describe Marvel::Api do
  it 'has an http_service accessor' do
    expect(Marvel::Api).to respond_to(:http_service)
    expect(Marvel::Api).to respond_to(:http_service=)
  end

  describe 'constants' do
    it 'has a version' do
      expect(Marvel::Api.const_defined?('VERSION')).to be_truthy
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
end
