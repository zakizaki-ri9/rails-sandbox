# frozen_string_literal: true

# typed: ignore
module Request
  class Connpass
    include ActiveModel::Model
    extend Enumerize

    attr_accessor :event_id, :keyword, :keyword_or, :ym, :ymd, :nickname,
                  :owner_nickname, :series_id, :start, :order, :count

    enumerize :order, in: %i[updated_desc started_asc new_event_asc]

    validates :count, numericality: {
      greater_than_or_equal_to: 1,
      less_than_or_equal_to: 100
    }

    def initialize(params = {})
      self.attributes = {
        event_id: params[:event_id],
        keyword: params[:keyword],
        keyword_or: params[:keyword_or],
        ym: params[:ym],
        ymd: params[:ymd],
        nickname: params[:nickname],
        owner_nickname: params[:owner_nickname],
        series_id: params[:series_id],
        start: params[:start]
      }

      self.order = :started_asc
      self.count = 100
    end

    def to_query
      json = as_json
      json['order'] = ::Request::Connpass.order.find_value(order).text
      json.to_query
    end
  end
end
