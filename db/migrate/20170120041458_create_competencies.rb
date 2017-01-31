class CreateCompetencies < ActiveRecord::Migration[5.0]
  def change
    create_table :competencies do |t|
      t.integer :competency_level
      t.references :user, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.timestamps
    end
  end
end
