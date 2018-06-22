# frozen_string_literal: true

class CreateExpenditures < ActiveRecord::Migration[5.1]
  def change
    create_table :expenditures do |t|
      t.string :name
      t.text :description
      t.datetime :starts_at
      t.datetime :ends_at
      t.boolean :deactivated
      t.boolean :recursive
      t.integer :recursive_type
      t.integer :assigned_to
      t.integer :status
      t.references :category
      t.references :user_id

      t.timestamps
    end
  end
end
