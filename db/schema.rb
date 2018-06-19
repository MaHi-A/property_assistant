# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_180_619_043_340) do
  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'expenditures', force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.datetime 'starts_at'
    t.datetime 'ends_at'
    t.integer 'user_id'
    t.boolean 'deactivated'
    t.boolean 'recursive'
    t.integer 'recursive_type'
    t.integer 'assigned_to'
    t.integer 'status'
    t.integer 'category_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['category_id'], name: 'index_expenditures_on_category_id'
  end

  create_table 'sub_expenditures', force: :cascade do |t|
    t.datetime 'completed_date'
    t.datetime 'starts_at'
    t.datetime 'ends_at'
    t.decimal 'amount'
    t.integer 'status'
    t.integer 'expenditure_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['expenditure_id'], name: 'index_sub_expenditures_on_expenditure_id'
  end
end
