require 'rails_helper'

def rx_param(key,val)
  return %r|#{key}=#{Regexp.escape(CGI.escape(val.to_s))}|
end


RSpec.describe CityMapperRequest, type: :model do
  let(:start) { Fabricate(:location) }
  let(:finish)   { Fabricate(:location) }
  let(:time) { Faker::Time.forward }
  let(:req) { CityMapperRequest.new(start: start, finish: finish, time: time) }

  it "produces a URI from parameters" do
    expect(req.uri).to be_instance_of(URI::HTTPS)
  end

  context "testing the components" do
    it "domain" do
      expect(req.uri.host).to eq CityMapperRequest::REQUEST_DOMAIN
    end

    it "path" do
      expect(req.uri.path).to eq "/#{CityMapperRequest::API_RESOURCE}/"
    end

    it "query" do
      expect(req.uri.query).to match rx_param('endcoord',finish)
      expect(req.uri.query).to match rx_param('key',req.api_key)
      expect(req.uri.query).to match rx_param('startcoord',start)
      expect(req.uri.query).to match rx_param('time',time)
      expect(req.uri.query).to match rx_param('time_type','arrival')
    end
  end

end
