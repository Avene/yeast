json.array!(@beers) do |beer|
  json.extract! beer, :id, :name, :beer_type, :taste
  json.url beer_url(beer, format: :json)
end
