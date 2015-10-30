json.array!(@items4) do |item|
    json.extract! item, :name, :price, :description, :category
    json.url item_url(item, format: :json)
  end
