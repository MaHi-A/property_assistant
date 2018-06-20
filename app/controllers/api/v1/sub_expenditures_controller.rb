# frozen_string_literal: true

class Api::V1::SubExpendituresController < ApiController
  # before_action :find_expenditure

  def sub_expenditure_dates
    SubExpenditure::Dates.call(self, sub_expenditure_params)
  end

  private

  def find_expenditure
    @expenditure = Expenditure.find(params[:expenditure_id])
  end

  def sub_expenditure_params
    params.permit(:recursive_type, :starts_at, :ends_at)
  end
end
