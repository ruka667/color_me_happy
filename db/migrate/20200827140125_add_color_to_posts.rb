class AddColorToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :color, :string
  end
end
