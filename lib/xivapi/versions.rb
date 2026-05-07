module XIVAPI
  # Endpoints for querying metadata about the versions recorded by the boilmaster system.
  class Versions
    attr_accessor :client

    def initialize(client)
      @client = client
    end

    # List versions understood by the API.
    # @return [Array<Hash>] The list of known versions.
    def all
      result = self.client.request("version")
      result["versions"].flat_map { |v| v["names"] }
    end
  end
end