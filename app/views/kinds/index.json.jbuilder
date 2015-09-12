json.array!(@kinds) do |kind|
  json.extract! kind, :id, :title
  json.url kind_url(kind, format: :json)
end
