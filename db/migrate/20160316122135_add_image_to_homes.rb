class AddImageToHomes < ActiveRecord::Migration
  def change
    add_column :homes, :image, :string
  end
end
