require_dependency "dashboard/application_controller"

module Dashboard
  class AnalyticReportsController < ApplicationController

    def index
      @navigation_tabs = [
        { id: 1, name: '1 day',   url: 'one_day' },
        { id: 2, name: '1 week',  url: 'one_week' },
        { id: 3, name: '1 month', url: 'one_month' }
      ]
    end

    def create
      @analytic_report = AnalyticReport.create(analytic_report_params)
      render 'dashboard/index'
    end

    private
      def analytic_report_params
        params.permit(:name, :description, :type)
      end
  end
end
