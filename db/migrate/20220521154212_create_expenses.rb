class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :name
      t.decimal :amount, precision: 8, scale: 2

      t.timestamps
    end
  end
end
