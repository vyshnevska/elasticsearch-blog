require_dependency "dashboard/application_controller"

module Dashboard
  class ReportController < ApplicationController

    def index
      @navigation_tabs = [
        { id: 1, name: '1 day',   url: 'one_day' },
        { id: 2, name: '1 week',  url: 'one_week' },
        { id: 3, name: '1 month', url: 'one_month' }
      ]
    end
  end
end
