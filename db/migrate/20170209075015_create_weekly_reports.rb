class CreateWeeklyReports < ActiveRecord::Migration[5.0]
  def change
    create_table :weekly_reports do |t|
      t.references :user, index: true, foreign_key: true
      t.references :week, index: true, foreign_key: true
      t.text :highlights

      t.timestamps
    end
  end
end
