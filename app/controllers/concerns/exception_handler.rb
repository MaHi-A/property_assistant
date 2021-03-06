module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |exception|
      render(json: { errors: exception.message }, status: :unprocessable_entity)
    end

    rescue_from ActiveRecord::RecordInvalid do |exception|
      render(json: { errors: exception.message }, status: :unprocessable_entity)
    end
  end
end