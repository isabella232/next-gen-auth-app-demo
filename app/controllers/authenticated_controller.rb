# frozen_string_literal: true

class AuthenticatedController < ApplicationController
  include ShopifyApp::Authenticated

  protect_from_forgery with: :exception, unless: :valid_jwt_header?
  before_action :update_scopes_if_insufficient_access

  private

  def valid_jwt_header?
    jwt_shopify_domain.present?
  end
end
