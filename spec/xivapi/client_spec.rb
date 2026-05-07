RSpec.describe XIVAPI::Client do
  let(:client) { described_class.new }

  describe "#search" do
    it "performs a search request and returns results" do
      result = client.search(
        query: 'Name="Iron War Axe"',
        sheets: "Item",
        limit: 3
      )

      expect(result).to be_a(Hash)
      expect(result["results"]).to be_an(Array)
      expect(result["results"].length).to be <= 3
    end

    it "supports partial text search" do
      result = client.search(
        query: 'Name~"sword"',
        sheets: "Item",
        limit: 3
      )

      expect(result["results"]).to be_an(Array)

      result["results"].each do |item|
        next unless item["fields"]["Name"]
        expect(item["fields"]["Name"].downcase).to include("sword")
      end
    end

    it "raises an error for invalid query syntax" do
      expect {
        client.search(query: "invalid syntax", sheets: "Item")
      }.to raise_error(Net::HTTPClientException)
    end
  end

  describe "verbose logging" do
    it "prints debug output when verbose is enabled" do
      client.verbose = true

      expect {
        client.search(query: 'Name="Gil"', sheets: "Item", limit: 1)
      }.to output(/https:\/\/v2.xivapi.com\/api\/search/i).to_stdout
    end

    it "does not print debug output when verbose is disabled" do
      client.verbose = false

      expect {
        client.search(query: 'Name="Gil"', sheets: "Item", limit: 1)
      }.not_to output.to_stdout
    end
  end
end
