module Dashboard
  class ApplicationController < ActionController::Base
    def index
      @analytic_reports = AnalyticReport.all
      render 'dashboard/index'
    end
  end
end
