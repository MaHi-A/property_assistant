# frozen_string_literal: true

class Expenditure < ApplicationRecord
  belongs_to :category
  belongs_to :user

  enum status: %i[pending accepted rejected completed]
  enum recursive_type: %i[weekly bi-weekly monthly yearly]
end
