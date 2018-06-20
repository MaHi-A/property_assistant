# frozen_string_literal: true

class Api::V1::SubExpendituresController < ApiController
  before_action :find_expenditure, only: [:sub_expenditure_dates]
  
  def index; end

  def sub_expenditure_dates
    
  end

  private

  def find_expenditure
    @expenditure = Expenditure.find(params[:expenditure_id])    
  end

  def sub_expenditure_params

  end
end
