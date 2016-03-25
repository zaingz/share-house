json.array!(@photos) do |photo|
  json.extract! photo, :id, :home_id, :image
  json.url photo_url(photo, format: :json)
end
