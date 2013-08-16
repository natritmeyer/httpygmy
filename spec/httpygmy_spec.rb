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
  
    it "should do a GET with headers" do
      stub_request(:get, BASE_URL).with(:headers => { 'Accept' => 'application/json' })
      HttPygmy.new(BASE_URL).get "/", {"Accept" => "application/json"}
      a_request(:get, BASE_URL).with(:headers => { 'Accept' => 'application/json' }).should have_been_made
    end
  
    it "should do a GET with basic auth" do
      stub_request(:get, "http://username:password@www.example.com")
      HttPygmy.new(BASE_URL, "username", "password").get "/"
      a_request(:get, "http://username:password@www.example.com/").should have_been_made
    end
  end
  
  context "POST" do
    it "should do a POST with a path" do
      stub_request(:post, "http://www.example.com/resource")
      HttPygmy.new(BASE_URL).post "/resource"
      a_request(:post, "http://www.example.com/resource").should have_been_made
    end
    
    it "should to a POST with headers" do
      stub_request(:post, "http://www.example.com/resource").with(:headers => { 'Accept' => 'application/json' })
      HttPygmy.new(BASE_URL).post "/resource", {"Accept" => "application/json"}
      a_request(:post, "http://www.example.com/resource").with(:headers => { 'Accept' => 'application/json' }).should have_been_made
    end
    
    it "should do a POST with a body" do
      stub_request(:post, "http://www.example.com/resource").with :body => "this is the body"
      HttPygmy.new(BASE_URL).post "/resource", {}, "this is the body"
      a_request(:post, "http://www.example.com/resource").with(:body => "this is the body").should have_been_made
    end
    
    it "should do a POST with basic auth" do
      stub_request(:post, "http://username:password@www.example.com/resource")
      HttPygmy.new(BASE_URL, "username", "password").post "/resource", {}, "this is the body"
      a_request(:post, "http://username:password@www.example.com/resource").with(:body => "this is the body").should have_been_made
    end
  end
  
  context "PUT" do
    it "should do a PUT with a path" do
      stub_request(:put, "http://www.example.com/resource/1")
      HttPygmy.new(BASE_URL).put "/resource/1"
      a_request(:put, "http://www.example.com/resource/1").should have_been_made
    end
    
    it "should to a PUT with headers" do
      stub_request(:put, "http://www.example.com/resource/1").with(:headers => { 'Accept' => 'application/json' })
      HttPygmy.new(BASE_URL).put "/resource/1", {"Accept" => "application/json"}
      a_request(:put, "http://www.example.com/resource/1").with(:headers => { 'Accept' => 'application/json' }).should have_been_made
    end
    
    it "should do a PUT with a body" do
      stub_request(:put, "http://www.example.com/resource/1").with :body => "this is the body"
      HttPygmy.new(BASE_URL).put "/resource/1", {}, "this is the body"
      a_request(:put, "http://www.example.com/resource/1").with(:body => "this is the body").should have_been_made
    end
    
    it "should do a PUT with basic auth" do
      stub_request(:put, "http://username:password@www.example.com/resource/1")
      HttPygmy.new(BASE_URL, "username", "password").put "/resource/1", {}, "this is the body"
      a_request(:put, "http://username:password@www.example.com/resource/1").with(:body => "this is the body").should have_been_made
    end
  end
  
  context "DELETE" do
    it "should do a DELETE with a path" do
      stub_request(:delete, "http://www.example.com/resource/1")
      HttPygmy.new(BASE_URL).delete "/resource/1"
      a_request(:delete, "http://www.example.com/resource/1").should have_been_made
    end
    
    it "should to a DELETE with headers" do
      stub_request(:delete, "http://www.example.com/resource/1").with(:headers => { 'Accept' => 'application/json' })
      HttPygmy.new(BASE_URL).delete "/resource/1", {"Accept" => "application/json"}
      a_request(:delete, "http://www.example.com/resource/1").with(:headers => { 'Accept' => 'application/json' }).should have_been_made
    end
    
    it "should do a DELETE with basic auth" do
      stub_request(:delete, "http://username:password@www.example.com/resource/1")
      HttPygmy.new(BASE_URL, "username", "password").delete "/resource/1", {}
      a_request(:delete, "http://username:password@www.example.com/resource/1").should have_been_made
    end
  end
end

