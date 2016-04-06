Fabricator(:journey) do
  negotiator
  starts     { Faker::Time.forward }
  visits(count: 1) { |atts,i|  Fabricate.build(:visit) }
  locations {  %Q| [{"lat":51.520222659283455,"lng":-0.09969234466552734},{"lat":51.51986883555282,"lng":-0.09846925735473633},{"lat":51.51979206211625,"lng":-0.0970315933227539},{"lat":51.52036285283142,"lng":-0.09594261646270752}]| }
end
