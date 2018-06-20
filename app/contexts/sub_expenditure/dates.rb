# frozen_string_literal: true

class SubExpenditure::Dates
  attr_reader :params, :starts_at, :ends_at

  def self.call(controller, params)
    new(params)
  end

  def initialize(controller, params)
    @controller = controller
    @params = params
  end

  def call
    fetch_dates_based_on_recursive_type
  end

  private

  def fetch_dates_based_on_recursive_type
    case params[:recursive_type]
    when 'weekly'
      fetch_weekly_dates
    when 'bi-weekly'
      fetch_bi_weekly_dates
    when 'monthly'
      fetch_montly_dates
    when 'yearly'
      fetch_yearly_dates
    else
      return_and_render_error
    end
  end

  def fetch_weekly_dates
  end

  def fetch_bi_weekly_dates; end

  def fetch_montly_dates; end

  def fetch_yearly_dates; end

  def return_and_render_error; end

  def parse_expenditure_dates
    @starts_at = parse_date(params[:starts_at])
    @ends_at = parse_date(params[:ends_at])
  end

  def parse_date(date)
    Time.parse(date)
  rescue
    controller.render(json: { status: 'error', { data: 'Please provide the correct date format'} }, status: :unprocessable_entity) && return
  end
end
