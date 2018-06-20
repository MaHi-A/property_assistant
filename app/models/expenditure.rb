# frozen_string_literal: true

class Expenditure < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :sub_expenditures

  enum status: %i[pending accepted rejected completed]
  enum recursive_type: %i[weekly bi-weekly monthly yearly]

  accepts_nested_attributes_for :sub_expenditures
end
