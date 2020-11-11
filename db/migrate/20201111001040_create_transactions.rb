class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :transaction_type
      t.date :occurrence_date
      t.decimal :value
      t.string :credit_card
      t.string :hour
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
