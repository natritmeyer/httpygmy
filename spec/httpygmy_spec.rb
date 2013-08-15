describe HttPygmy do
  BASE_URL = "http://www.example.com"
  
  context "GET" do
    it "should do a simple GET" do
      stub_request(:get, BASE_URL)
      HttPygmy.new(BASE_URL).get
      a_request(:get, BASE_URL).should have_been_made
    end
  
    it "should do a GET with a path" do
      stub_request(:get, "http://www.example.com/resource/1.xml")
      HttPygmy.new(BASE_URL).get "/resource/1.xml"
      a_request(:get, "http://www.example.com/resource/1.xml").should have_been_made
    end
  
    it "should do a GET with headers do" do
      stub_request(:get, BASE_URL).with(:headers=>{ 'Accept' => 'application/json' })
      HttPygmy.new(BASE_URL).get "/", {"Accept" => "application/json"}
      a_request(:get, BASE_URL).with(:headers=>{ 'Accept' => 'application/json' }).should have_been_made
    end
  
    it "should do a GET with basic auth do" do
      stub_request(:get, "http://username:password@www.example.com")
      HttPygmy.new(BASE_URL, "username", "password").get "/"
      a_request(:get, "http://username:password@www.example.com/").should have_been_made
    end
  end
end
