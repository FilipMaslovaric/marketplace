class ChangeLogoToIntegerInShop < ActiveRecord::Migration[5.1]
  def change
  	change_column :shops, :logo, 'integer USING CAST(logo AS integer)'
  	change_column :shops, :background_image, 'integer USING CAST(background_image AS integer)'
  end
end
