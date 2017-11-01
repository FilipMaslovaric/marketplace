class ChangeOrderDetailsColumnToJsonOnOrder < ActiveRecord::Migration[5.1]
  def change
  	change_column :orders, :order_details, 'json USING CAST(order_details AS json)'
  end
end
