module Dashboard
  class ApplicationController < ActionController::Base
    def index
      render 'dashboard/index'
    end
  end
end
