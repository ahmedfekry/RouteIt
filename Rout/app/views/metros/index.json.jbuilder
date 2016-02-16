json.array!(@metros) do |metro|
  json.extract! metro, :id, :name, :long, :lat
  json.url metro_url(metro, format: :json)
end
