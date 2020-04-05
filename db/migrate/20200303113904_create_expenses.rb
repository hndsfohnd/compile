class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.date :application_date,      null: false
      t.string :travel_cost,      null: false
      t.string :approver
      t.date :completed
      t.boolean :approval
      t.references :user, foreign_key: true
      t.references :decision, foreign_key: true
      t.timestamps
    end
  end
end
