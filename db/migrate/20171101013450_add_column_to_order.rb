class AddColumnToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :order_details, :text
  end
end
