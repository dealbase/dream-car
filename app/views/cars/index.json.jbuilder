json.array!(@cars) do |car|
  json.extract! car, :id, :name, :amount
  json.url car_url(car, format: :json)
end
