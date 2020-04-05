class RemoveClassFromEstimates < ActiveRecord::Migration[5.2]
  def change
    remove_column :estimates, :class, :string
  end
end
