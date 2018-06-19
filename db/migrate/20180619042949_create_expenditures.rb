class CreateExpenditures < ActiveRecord::Migration[5.1]
  def change
    create_table :expenditures do |t|
      t.string :name
      t.text :description
      t.datetime :starts_at
      t.datetime :ends_at
      t.integer :user_id
      t.boolean :deactivated
      t.boolean :recursive
      t.integer :recursive_type
      t.integer :assigned_to
      t.integer :status
      t.references :category

      t.timestamps
    end
  end
end
