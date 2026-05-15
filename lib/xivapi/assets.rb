module XIVAPI
  # Endpoints for accessing game data on a file-by-file basis. Commonly useful for fetching icons or other textures to display on the web.
  class Assets
    attr_accessor :client

    # Initialize a new Assets client for making API requests.
    # @param client [XIVAPI::Client] The client to use for making API
    # @return [XIVAPI::Assets] A new Assets client instance.
    def initialize(client)
      @client = client
    end

    # Read an asset from the game at the specified path, converting it into a usable format. If no valid conversion between the game file type and specified format exists, an error will be returned.
    # @param params [Hash] Query parameters accepted by the asset endpoint.
    # @return [Buffer, String] An image of the specified asset in the specified format.
    def get(params = {})
      client.request("asset", params)
    end

    # Retrieve the specified map, composing it from split source files if necessary.
    # @param params [Hash] Query parameters accepted by the map endpoint.
    # @return [Buffer, String] An image of the specified map in the specified format.
    def map(territory, index, params = {})
      client.request("asset/map/#{territory}/#{index}", params)
    end
  end
end
