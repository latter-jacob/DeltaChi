class Contacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :email, null: false
      t.string :message, null: false
      t.datetime "created_at"
    end
  end
end
