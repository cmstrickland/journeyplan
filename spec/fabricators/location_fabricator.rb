Fabricator(:location) do
  name Faker::Address.name
  latitude Faker::Address.latitude
  longitude Faker::Address.longitude
end
