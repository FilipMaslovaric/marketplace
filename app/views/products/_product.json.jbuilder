json.extract! product, :id, :name, :description, :price, :image, :sold, :shop_id, :category_id, :created_at, :updated_at
json.url product_url(product, format: :json)
