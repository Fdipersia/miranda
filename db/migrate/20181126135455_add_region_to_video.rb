class AddRegionToVideo < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :region, :string
  end
end
