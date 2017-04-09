RSpec.shared_examples 'collection response' do
  it "returns filled data" do
    VCR.use_cassette(label) do
      response = make_call
      expect(response).to be_a(Marvel::Api::Response)
      expect(response.status).to eq(200)
      expect(response.results).to be_an(Array)
    end
  end
end

RSpec.shared_examples 'single response' do
  it "returns filled data" do
    VCR.use_cassette(label) do
      response = make_call
      expect(response).to be_a(Marvel::Api::Response)
      expect(response.status).to eq(200)
      expect(response.results).to be_an(Array)
    end
  end
end
