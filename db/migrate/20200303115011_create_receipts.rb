class CreateReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :receipts do |t|
      t.string :image
      t.references :expense, foreign_key: true
      t.timestamps
    end
  end
end
