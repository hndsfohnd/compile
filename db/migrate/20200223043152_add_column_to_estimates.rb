class AddColumnToEstimates < ActiveRecord::Migration[5.2]
  def change
    add_column :estimates, :flight_class, :string
  end
end
