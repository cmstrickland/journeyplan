Fabricator(:visit) do
  location
  arrival  Faker::Time.forward
  duration_seconds  { (rand(10)+1) * 60 * 60 }
end
