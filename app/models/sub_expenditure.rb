# frozen_string_literal: true

class SubExpenditure < ApplicationRecord
  belongs_to :expenditure

  STATUSES = %w[pending completed].freeze
  enum status: STATUSES
end
