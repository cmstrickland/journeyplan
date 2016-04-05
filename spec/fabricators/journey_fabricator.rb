Fabricator(:journey) do
  negotiator
  starts     { Faker::Time.forward }
  visits(count: 1) { |atts,i|  Fabricate.build(:visit) }
end
