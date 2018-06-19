class ApiController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ExceptionHandler

  # before_action :authenticate_user!
end
