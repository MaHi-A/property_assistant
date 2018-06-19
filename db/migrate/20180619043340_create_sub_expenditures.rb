class CreateSubExpenditures < ActiveRecord::Migration[5.1]
  def change
    create_table :sub_expenditures do |t|
      t.datetime :completed_date
      t.datetime :starts_at
      t.datetime :ends_at
      t.decimal :amount
      t.integer :status
      t.references :expenditure

      t.timestamps
    end
  end
end
