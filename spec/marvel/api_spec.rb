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
end
