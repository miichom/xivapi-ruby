module XIVAPI
  class Sheets
    attr_accessor :client

    # Initialize a new Sheets client for making API requests.
    # @param client [XIVAPI::Client] The client to use for making API
    # @return [XIVAPI::Sheets] A new Sheets client instance.
    def initialize(client)
      @client = client
    end

    # List known excel sheets that can be read by the API.
    # @return [Array<Hash>] The list of known sheets.
    def all
      client.request("sheet")
    end

    # Read information about one or more rows and their related data.
    # @param sheet [String] The sheet to fetch the rows from.
    # @param params [Hash] The parameters to fetch the rows with.
    # @return [Array<Hash>] A list of rows with typed fields.
    def list(sheet, params = {})
      client.request("sheet/#{sheet}", params)
    end

    # Read detailed, filterable information from a single sheet row and its related data.
    # @param sheet [String] Name of the sheet to read.
    # @param row_id [Integer] The ID of the row to read.
    # @param params [Hash] The parameters to fetch the row with.
    # @return [Hash] The row with typed fields.
    def get(sheet, row_id, params = {})
      client.request("sheet/#{sheet}/#{row_id}", params)
    end
  end
end
