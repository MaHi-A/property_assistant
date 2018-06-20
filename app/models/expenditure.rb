# frozen_string_literal: true

class Expenditure < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :sub_expenditures

  RECURSIVE_TYPES = %w[weekly biweekly monthly yearly].freeze
  STATUSES = %w[pending accepted rejected completed].freeze
  enum status: STATUSES
  enum recursive_type: RECURSIVE_TYPES

  accepts_nested_attributes_for :sub_expenditures
end
