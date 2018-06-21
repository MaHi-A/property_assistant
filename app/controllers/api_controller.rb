# frozen_string_literal: true

class ApiController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ExceptionHandler

  before_action :authenticate_user!

  def render_success_response(data)
    render json: { data: data }, status: :ok
  end
end
