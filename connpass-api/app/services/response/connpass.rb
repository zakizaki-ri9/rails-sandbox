# frozen_string_literal: true

# typed: ignore
module Response
  class Connpass
    include ActiveModel::Model
    attr_accessor :title, :description, :event_url, :address,
                  :place, :lat, :lon, :accepted, :limit, :waiting,
                  :started_at, :ended_at

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
        started_at: Time.parse(hash['started_at']).strftime('%Y/%m/%d %H:%M'),
        ended_at: Time.parse(hash['ended_at']).strftime('%Y/%m/%d %H:%M')
      }
      self
    end

    class << self
      def build(response)
        return {} if response.blank?

        r = Response::Connpass.new
        r.attributes_setting response
      end
    end

    # def keys
    #   %i[title, description, event_url, address, place, lat, lon, accepted, limit, waiting]
    # end
  end
end
