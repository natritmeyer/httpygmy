describe HttPygmy do
  BASE_URL = "http://www.example.com"
  HEADERS = { 'Accept' => 'application/json' }
  
  context "GET" do
    it "should do a simple GET" do
      stub_request(:get, BASE_URL)
      HttPygmy.new(BASE_URL).get
      a_request(:get, BASE_URL).should have_been_made
    end
  
    it "should do a GET with a path" do
      expected_url = "http://www.example.com/resource/1.xml"
      stub_request(:get, expected_url)
      HttPygmy.new(BASE_URL).get "/resource/1.xml"
      a_request(:get, expected_url).should have_been_made
    end
  
    it "should do a GET with headers" do
      expected_url = "http://www.example.com/"
      stub_request(:get, expected_url).with(:headers => HEADERS)
      HttPygmy.new(BASE_URL).get "/", HEADERS
      a_request(:get, expected_url).with(:headers => HEADERS).should have_been_made
    end
  
    it "should do a GET with basic auth" do
      expected_url = "http://username:password@www.example.com"
      stub_request(:get, expected_url)
      HttPygmy.new(BASE_URL, "username", "password").get "/"
      a_request(:get, expected_url).should have_been_made
    end
  end
  
  context "POST" do
    it "should do a POST with a path" do
      expected_url = "http://www.example.com/resource"
      stub_request(:post, expected_url)
      HttPygmy.new(BASE_URL).post "/resource"
      a_request(:post, expected_url).should have_been_made
    end
    
    it "should to a POST with headers" do
      expected_url = "http://www.example.com/resource"
      stub_request(:post, expected_url).with(:headers => HEADERS)
      HttPygmy.new(BASE_URL).post "/resource", HEADERS
      a_request(:post, expected_url).with(:headers => HEADERS).should have_been_made
    end
    
    it "should do a POST with a body" do
      expected_url = "http://www.example.com/resource"
      stub_request(:post, expected_url).with :body => "this is the body"
      HttPygmy.new(BASE_URL).post "/resource", {}, "this is the body"
      a_request(:post, expected_url).with(:body => "this is the body").should have_been_made
    end
    
    it "should do a POST with basic auth" do
      expected_url = "http://username:password@www.example.com/resource"
      stub_request(:post, expected_url)
      HttPygmy.new(BASE_URL, "username", "password").post "/resource", {}, "this is the body"
      a_request(:post, expected_url).with(:body => "this is the body").should have_been_made
    end
  end
  
  context "PUT" do
    it "should do a PUT with a path" do
      expected_url = "http://www.example.com/resource/1"
      stub_request(:put, expected_url)
      HttPygmy.new(BASE_URL).put "/resource/1"
      a_request(:put, expected_url).should have_been_made
    end
    
    it "should to a PUT with headers" do
      expected_url = "http://www.example.com/resource/1"
      stub_request(:put, expected_url).with(:headers => HEADERS)
      HttPygmy.new(BASE_URL).put "/resource/1", HEADERS
      a_request(:put, expected_url).with(:headers => HEADERS).should have_been_made
    end
    
    it "should do a PUT with a body" do
      expected_url = "http://www.example.com/resource/1"
      stub_request(:put, expected_url).with :body => "this is the body"
      HttPygmy.new(BASE_URL).put "/resource/1", {}, "this is the body"
      a_request(:put, expected_url).with(:body => "this is the body").should have_been_made
    end
    
    it "should do a PUT with basic auth" do
      expected_url = "http://username:password@www.example.com/resource/1"
      stub_request(:put, expected_url)
      HttPygmy.new(BASE_URL, "username", "password").put "/resource/1", {}, "this is the body"
      a_request(:put, expected_url).with(:body => "this is the body").should have_been_made
    end
  end
  
  context "DELETE" do
    it "should do a DELETE with a path" do
      expected_url = "http://www.example.com/resource/1"
      stub_request(:delete, expected_url)
      HttPygmy.new(BASE_URL).delete "/resource/1"
      a_request(:delete, expected_url).should have_been_made
    end
    
    it "should to a DELETE with headers" do
      expected_url = "http://www.example.com/resource/1"
      stub_request(:delete, expected_url).with(:headers => HEADERS)
      HttPygmy.new(BASE_URL).delete "/resource/1", HEADERS
      a_request(:delete, expected_url).with(:headers => HEADERS).should have_been_made
    end
    
    it "should do a DELETE with basic auth" do
      expected_url = "http://username:password@www.example.com/resource/1"
      stub_request(:delete, expected_url)
      HttPygmy.new(BASE_URL, "username", "password").delete "/resource/1", {}
      a_request(:delete, expected_url).should have_been_made
    end
  end
end

