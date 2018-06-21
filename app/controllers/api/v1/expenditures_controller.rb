# frozen_string_literal: true

class Api::V1::ExpendituresController < ApiController
  before_action :find_expenditure, only: %i[update]

  def create
    response = Expenditure.create!(expenditure_params)
    render_success_response response
  end

  def update
    response = @expenditure.update!(expenditure_params)
    render_success_response response
  end

  private

  def expenditure_with_extra_params
    expenditure_params.merge!(action_name: action_name, expenditure: @expenditure)
  end

  def expenditure_params
    params.require(:expenditure)
          .permit(:name, :description, :starts_at, :ends_at, :user_id,
                  :deactivated, :recursive, :recursive_type, :assigned_to, :status, :category_id,
                  sub_expenditures_attributes: %i[completed_date starts_at ends_at amount status expenditure_id])
  end

  def find_expenditure
    @expenditure = current_user.expenditures.find(params[:id])
  end
end
