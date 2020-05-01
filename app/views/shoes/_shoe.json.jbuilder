json.extract! shoe, :id, :brand, :model, :condition, :price, :description, :location_id, :created_at, :updated_at
json.url shoe_url(shoe, format: :json)
