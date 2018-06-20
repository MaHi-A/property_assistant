# frozen_string_literal: true

class SubExpenditure::Dates
  attr_reader :params, :starts_at, :ends_at, :sub_expenditure_dates, :recursive_hash, :recursive_type

  def self.call(controller, params)
    new(params)
  end

  def initialize(controller, params)
    @controller = controller
    @params = params
    @recursive_type = params[:recursive_type]
    @recursive_hash = { weekly: 7.days, biweekly: 14.days, yearly: 1.year }
    @sub_expenditure_dates = []
  end

  def call
    fetch_dates_based_on_recursive_type
  end

  private

  def fetch_dates_based_on_recursive_type
    if %i[weekly biweekly yearly].include?(recursive_type)
      fetch_dates
    elsif
      fetch_montly_dates
    else
      return_and_render_error
    end
  end

  def fetch_dates
    when ends_at > starts_at
      @sub_expenditure_dates << { starts_at:  starts_at }
      starts_at += recursive_hash[recursive_type]
    end
  end

  def fetch_montly_dates; end

  def return_and_render_error
    controller.render(
      json: { status: 'error', { data: 'Please provide the correct recursive_type'} },
        status: :unprocessable_entity) && return
  end

  def parse_expenditure_dates
    @starts_at = parse_date(params[:starts_at])
    @ends_at = parse_date(params[:ends_at])
  end

  def parse_date(date)
    Date.parse(date)
  rescue
    controller.render(
      json: { status: 'error', { data: 'Please provide the correct date format'} },
      status: :unprocessable_entity) && return
  end
end
