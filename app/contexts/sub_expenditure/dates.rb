# frozen_string_literal: true

class SubExpenditure::Dates
  attr_reader :params, :recursive_type, :controller

  def self.call(controller, params)
    new(controller, params).call
  end

  def initialize(controller, params)
    @params = params
    @controller = controller
    @sub_expenditure_dates = []
    @recursive_type = params[:recursive_type]
    @recursive_hash = { weekly: 7.days, biweekly: 14.days, yearly: 1.year }
  end

  def call
    parse_expenditure_dates
    fetch_dates_based_on_recursive_type
    render_success_response
  end

  def render_success_response
    controller.render_success_response @sub_expenditure_dates
  end

  private

  def fetch_dates_based_on_recursive_type
    if Expenditure::RECURSIVE_TYPES.include?(recursive_type)
      %w[weekly biweekly yearly].include?(recursive_type) ? fetch_dates : fetch_monthly_dates
    else
      raise UnprocessableEntityError, I18n.t('expenditure.recursive_type_error', recursive_type: recursive_type)
    end
  end

  def fetch_dates
    time_period = @recursive_hash[recursive_type.to_sym]
    while @ends_at >= @starts_at
      @sub_expenditure_dates << { starts_at: @starts_at }
      @starts_at += time_period
    end
  end

  # TODO: need to work on this recursive_type
  def fetch_monthly_dates; end

  def parse_expenditure_dates
    @starts_at = parse_date(params[:starts_at])
    @ends_at = parse_date(params[:ends_at])
  end

  def parse_date(date)
    Date.parse(date)
  rescue StandardError
    raise UnprocessableEntityError, I18n.t('invalid_date_format')
  end
end
