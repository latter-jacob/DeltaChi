class ExecTimeStamps < ActiveRecord::Migration
  def change
    add_column :execs, :bio, :string
    add_column :execs, :created_at, :datetime
  end
end
