class CreateDecisions < ActiveRecord::Migration[5.2]
  def change
    create_table :decisions do |t|
      t.string :title,               null: false
      t.text   :purpose,            null: false
      t.string :rate,               null: false
      t.date :application_date,      null: false
      t.date :completed
      t.boolean :approval
      t.string  :authorizer
      t.references :user, foreign_key: true
      t.references :booking, foreign_key: true
      t.references :estimate, foreign_key: true
      t.timestamps
    end
  end
end
