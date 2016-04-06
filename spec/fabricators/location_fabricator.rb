def latitude
  "51." + rand(6).to_s + rand(1000000000000000).to_s
end

def longitude
  if rand(2) > 0
    prefix = "-"
  else
    prefix=""
  end
  prefix + "0." + rand(4).to_s +  rand(10000000000000000).to_s
end

Fabricator(:location) do
  name { Faker::Address.name }
  latitude { latitude }
  longitude { longitude }
end
