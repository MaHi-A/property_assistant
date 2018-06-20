# frozen_string_literal: true

class Expenditre::Create
  attr_reader :params

  def self.call(params)
    new(current_user, params)
  end

  def initialize(_current_user, params)
    @params = params
  end

  def call
    decorator.create!(params)
  end
end
