class FoundingFatherFile < ActiveRecord::Migration
  def change
    add_column :founding_fathers, :file_name, :string
  end
end
