module Dashboard
  class AnalyticReport < ActiveRecord::Base

    scope :financial_reports, -> { where(report_type: 'FinancialReport') }
    scope :general_reports, -> { where(report_type: 'GeneralReport') }

    def self.report_types
      %w(GeneralReport FinancialReport)
    end
  end

  class FinancialReport < AnalyticReport; end
  class GeneralReport < AnalyticReport; end
end