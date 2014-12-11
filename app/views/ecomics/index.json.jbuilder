json.array!(@ecomics) do |ecomic|
  json.extract! ecomic, :id, :name, :description, :comic_type, :user_id
  json.url ecomic_url(ecomic, format: :json)
end
