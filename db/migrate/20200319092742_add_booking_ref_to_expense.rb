class AddBookingRefToExpense < ActiveRecord::Migration[5.2]
  def change
    add_reference :expenses, :booking, foreign_key: true
  end
end
