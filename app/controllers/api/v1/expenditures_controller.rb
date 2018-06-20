# frozen_string_literal: true

class Api::V1::ExpendituresController < ApiController
  def create
    Expenditure.create.call(current_user, expenditure_params)
  end

  private

  def expenditure_params
    params.require(:expenditure)
          .permit(:name, :description, :starts_at, :ends_at, :user_id,
                  :deactivated, :recursive, :recursive_type, :assigned_to, :status, :category_id,
                  sub_expenditures_attribues: %i[completed_date starts_at ends_at amount status expenditure_id])
  end
end
