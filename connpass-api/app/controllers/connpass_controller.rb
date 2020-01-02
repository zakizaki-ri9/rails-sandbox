# typed: strong
# frozen_string_literal: true

class ConnpassController < ApplicationController
  def index
    request = Request::Connpass.new index_params
    api = Api::Connpass.new request
    api.fetch!
    render json: { content: api.build_response, status: 200 }
  end

  private

  def index_params
    params.permit(:event_id, :keyword, :keyword_or, :ym, :ymd, :nickname, :owner_nickname, :series_id, :start)
  end
end
