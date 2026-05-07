RSpec.describe XIVAPI::Versions do
  let(:client) { XIVAPI::Client.new }
  let(:versions) { described_class.new(client) }

  it "fetches versions" do
    result = versions.all
    expect(result).to be_an(Array)
    expect(result).not_to be_empty
    expect(result.all? { |v| v.is_a?(String) }).to be true
  end
end