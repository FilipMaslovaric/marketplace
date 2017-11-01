class ChangeImageToBeIntegerInProducts < ActiveRecord::Migration[5.1]
  def change
  	change_column :products, :image, 'integer USING CAST(image AS integer)'
  end
end
