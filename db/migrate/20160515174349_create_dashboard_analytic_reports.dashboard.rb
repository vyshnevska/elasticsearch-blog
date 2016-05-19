# This migration comes from dashboard (originally 20160419195303)
class CreateDashboardAnalyticReports < ActiveRecord::Migration
  def change
    create_table :dashboard_analytic_reports do |t|
      t.string :name
      t.text :description
      t.text :parameters
      t.string :report_type, limit: 50

      t.timestamps null: false
    end
  end
end
