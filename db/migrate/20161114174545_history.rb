class History < ActiveRecord::Migration
  def change
    create_table :founding_fathers do |t|
      t.string "name",     null: false
      t.text   "details",      null: false
      t.string "birthday"
      t.string "deathday"
    end
  end
end
