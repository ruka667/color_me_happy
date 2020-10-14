class AddSeasonToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :season, :integer
  end
end
