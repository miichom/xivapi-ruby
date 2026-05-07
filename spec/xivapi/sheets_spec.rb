RSpec.describe XIVAPI::Sheets do
  let(:client) { XIVAPI::Client.new }
  let(:sheets) { described_class.new(client) }

  it "lists all sheets" do
    result = sheets.all
    expect(result["sheets"]).to be_an(Array)
    expect(result["sheets"]).not_to be_empty
  end

  it "lists rows" do
    result = sheets.list("Item", limit: 5)
    expect(result["rows"]).to be_an(Array)
    expect(result["rows"]).not_to be_empty
  end

  it "gets a row" do
    result = sheets.get("Item", 1, fields: "Name")
    expect(result["fields"]["Name"]).to eq("Gil")
  end

  it "raises for invalid sheet" do
    expect {
      sheets.list("NotASheet")
    }.to raise_error(Net::HTTPClientException)
  end
end
