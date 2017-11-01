class CreateShops < ActiveRecord::Migration[5.1]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :logo
      t.string :background_image
      t.text :about
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
