# frozen_string_literal: true

module HttpAdapter

  module_function
  
  def post(url, payload = nil, headers = {})
    conn.post(url, payload, headers)
  end

  def get(url, params = nil, headers = {})
    conn.get(url, params, headers)
  end

  def conn
    Faraday.new do |f|
      f.request :json
      f.adapter Faraday.default_adapter
    end
  end
end

