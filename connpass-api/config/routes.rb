# frozen_string_literal: true

# typed: strong
Rails.application.routes.draw do
  resources :connpass, only: %i[index]
end
