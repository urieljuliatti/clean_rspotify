# frozen_string_literal: true

require 'test_helper'

class HttpAdapterTest < ActiveSupport::TestCase

  test 'should return a GET request' do
    url = 'http://www.example.com'
    body = { 'status' => 'OK' }
    
    stub_request(:get, url).to_return(body: body.to_json, status: 200)
    
    response = HttpAdapter.get(url)
   
    assert_equal body.to_json, response.body
    assert_equal 200, response.status
  end
  
  test 'should perform a POST request' do
    url = 'http://www.example.com'
    payload = { 'code' => '1234' }
    body = { 'status' => 'ok', 'song' => 'When The Sun Burns Red' }

    stub_request(:post, url).with(body: payload.to_json).to_return(body: body.to_json, status: 200)

    response = HttpAdapter.post(url, payload)
    
    assert_equal body.to_json, response.body    
    assert_equal 200, response.status
  end
end

