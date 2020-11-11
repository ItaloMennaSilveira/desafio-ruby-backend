class CreateBeneficiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :beneficiaries do |t|
      t.string :name
      t.string :cpf
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
