json.array!(@beers) do |beer|
  json.extract! beer, :id, :name, :kind, :taste
  json.url beer_url(beer, format: :json)
end
