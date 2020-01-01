# frozen_string_literal: true

# typed: ignore
module Request
  class Connpass
    include ActiveModel::Model
    attr_accessor :event_id, :keyword, :keyword_or, :ym, :ymd, :nickname,
                  :owner_nickname, :series_id, :start, :order, :count, :format

    def initialize(params)
      self.attributes = {
        event_id: params[:event_id],
        keyword: params[:keyword],
        keyword_or: params[:keyword_or],
        ym: params[:ym],
        ymd: params[:ymd],
        nickname: params[:nickname],
        owner_nickname: params[:owner_nickname],
        series_id: params[:series_id],
        start: params[:start],
        order: params[:order],
        count: params[:count],
        format: params[:format]
      }
    end

    def to_query
      as_json.to_query
    end
  end
end
