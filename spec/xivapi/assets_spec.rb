RSpec.describe XIVAPI::Assets do
  let(:client) { XIVAPI::Client.new }
  let(:assets) { described_class.new(client) }

  it "fetches an asset" do
    result = assets.get(
      path: "ui/icon/051000/051474_hr1.tex",
      format: "png"
    )
    expect(result).to be_a(String)
    expect(result.bytesize).to be > 0
  end

  it "fetches a map" do
    result = assets.map("s1d1", "00", version: "latest")
    expect(result.bytesize).to be > 0
  end

  it "raises on invalid asset" do
    expect {
      assets.get(path: "invalid/path.tex", format: "png")
    }.to raise_error(Net::HTTPClientException)
  end
end
