class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.text :description
      t.integer :amount_cents, default: 0, null: false

      t.timestamps
    end
  end
end
