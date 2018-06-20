# frozen_string_literal: true

module ApplicationHelper
  def date_format(date)
    date.strftime('%m-%d-%y') if date.is_a?(Date)
  end
end
