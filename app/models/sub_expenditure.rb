# frozen_string_literal: true

class SubExpenditure < ApplicationRecord
  belongs_to :expenditure

  enum status: %i[pending completed]
end
