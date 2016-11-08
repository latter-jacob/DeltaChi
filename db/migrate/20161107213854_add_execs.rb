class AddExecs < ActiveRecord::Migration
  def change
    create_table :execs do |t|
      t.string "name",     null: false
      t.text   "title",      null: false
      t.string "file_name"
    end
  end
end
