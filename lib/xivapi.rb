# frozen_string_literal: true

require_relative "xivapi/version" # The version of the gem

require_relative "xivapi/assets"
require_relative "xivapi/sheets"
require_relative "xivapi/versions"

require "uri"
require "net/http"
require "json"

module XIVAPI
  # Known languages supported by the gata data format.
  LANGUAGE_CODES = %w[ja en de fr chs cht kr].freeze

  # An asynchronous Ruby wrapper for XIVAPI.
  class Client
    attr_accessor :logger, :verbose, :version

    # Initialize a new client for making API requests.
    # @param language [String] The supported by the gata data format
    # @param version [String] The supported version of the game to use for the API.
    # @param verbose [true, false] Whether to enable verbose logging.
    def initialize(language = "en", version = "latest", verbose = false)
      self.language = language
      @version = version
      @verbose = verbose
    end

    # @return [String] The supported by the gata data format
    attr_reader :language

    # @param language [String, Symbol] The language to set for the client
    # @return The supported by the gata data format
    def language=(language)
      lang = language.to_s.downcase
      raise ArgumentError, "Unsupported language" unless LANGUAGE_CODES.include?(lang)

      @language = lang
    end

    def search(params = {})
      request("search", params)
    end

    def request(path, params = {})
      merged = { language: @language, version: @version }.merge(params)

      uri = URI.join("https://v2.xivapi.com/api/", path)
      uri.query = URI.encode_www_form(merged.compact) unless merged.empty?
      puts "=> #{uri}" if @verbose
      response = Net::HTTP.get_response(uri)
      raise response.error! unless response.is_a?(Net::HTTPSuccess)

      if response.content_type&.include?("application/json")
        json = JSON.parse(response.body)

        raise json["error"].to_s if json.is_a?(Hash) && json["error"]

        json
      else
        response.body
      end
    end
  end
end
