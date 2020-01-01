# frozen_string_literal: true

# typed: ignore
module Request
  class Connpass
    include ActiveModel::Model
    attr_accessor :event_id, :keyword, :keyword_or, :ym, :ymd, :nickname,
                  :owner_nickname, :series_id, :start, :order, :count, :format
  end
end
