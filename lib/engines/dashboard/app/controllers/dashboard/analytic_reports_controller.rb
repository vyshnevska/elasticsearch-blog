require_dependency "dashboard/application_controller"

module Dashboard
  class AnalyticReportsController < ApplicationController

    def index
    end

    def create
      @analytic_report = AnalyticReport.create!(analytic_report_params)
      @analytic_reports = AnalyticReport.all

      redirect_to root_path
    end

    def show
      @navigation_tabs = [
        { id: 1, name: '1 day',   url: 'one_day' },
        { id: 2, name: '1 week',  url: 'one_week' },
        { id: 3, name: '1 month', url: 'one_month' }
      ]
      @analytic_report = AnalyticReport.find(params[:id])
      render 'index'
    end

    private
      def analytic_report_params
        params.permit(analytic_report: [:name, :report_type, :description])['analytic_report']
      end
  end
end
