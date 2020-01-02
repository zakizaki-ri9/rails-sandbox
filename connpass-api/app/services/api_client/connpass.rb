# frozen_string_literal: true

# typed: true
module ApiClient
  class Connpass
    REQUEST_URL = 'https://connpass.com/api/v1/event/?'

    attr_reader :request, :response

    def initialize(request)
      @request = request
    end

    def fetch!
      client = HTTPClient.new
      raw_response = client.get(external_url)
      @response = JSON.parse raw_response&.body
    end

    def build_response
      return [] if response.blank?

      response['events'].map do |event|
        Response::Connpass.build event
      end
    end

    private

    def external_url
      REQUEST_URL + request.to_query
    end
  end
end
