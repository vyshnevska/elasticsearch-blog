# This migration comes from dashboard (originally 20160419195303)
class CreateDashboardAnalyticReports < ActiveRecord::Migration
  def change
    create_table :dashboard_analytic_reports do |t|
      t.string :name
      t.text :description
      t.text :parameters
      t.string :type

      t.timestamps null: false
    end
  end
end
