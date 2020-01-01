# frozen_string_literal: true

# typed: ignore
module Response
  class Connpass
    include ActiveModel::Model
    attr_accessor :title, :description, :event_url, :address,
                  :place, :lat, :lon, :accepted, :limit, :waiting

    class << self
      def build(response)
        return {} if response.blank?

        r = Response::Connpass.new
        r.attributes_setting response
      end
    end

    def attributes_setting(hash)
      self.attributes = {
        title: hash['title'],
        description: hash['description'],
        event_url: hash['event_url'],
        address: hash['address'],
        place: hash['place'],
        lat: hash['lat'],
        lon: hash['lon'],
        accepted: hash['accepted'],
        limit: hash['limit'],
        waiting: hash['waiting'],
      }
      self
    end

    # def keys
    #   %i[title, description, event_url, address, place, lat, lon, accepted, limit, waiting]
    # end
  end
end
