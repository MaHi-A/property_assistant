# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern
  included do
    rescue_from ActiveRecord::RecordNotFound || ActiveRecord::RecordInvalid do |exception|
      render(json: { errors: exception.message }, status: :unprocessable_entity)
    end
  end
end
