# frozen_string_literal: true

class Expenditre::Create
  attr_reader :decorator, :params

  def self.call(params)
    @params = params
    new(current_user, params)
  end

  def initialize(_current_user, params)
    @decorator = Expenditre::Decorator.new(params)
  end

  def call
    decorator.create!(params)
  end
end
