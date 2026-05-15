module XIVAPI
  # Endpoints for querying metadata about the versions recorded by the boilmaster system.
  class Versions
    attr_accessor :client

    # Initialize a new Versions client for making API requests.
    # @param client [XIVAPI::Client] The client to use for making API
    # @return [XIVAPI::Versions] A new Versions client instance.
    def initialize(client)
      @client = client
    end

    # List versions understood by the API.
    # @return [Array<Hash>] The list of known versions.
    def all
      result = client.request("version")
      result["versions"].flat_map { |v| v["names"] }
    end
  end
end
