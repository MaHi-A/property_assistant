# frozen_string_literal: true

class UnprocessableEntityError < StandardError
  def initialize(message)
    super
  end
end
