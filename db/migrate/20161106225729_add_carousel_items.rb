class AddCarouselItems < ActiveRecord::Migration
  def change
    create_table :carousel_items, force: :cascade do |t|
      t.string "title",     null: false
      t.text   "body",      null: false
      t.string "file_name"
    end
  end
end
