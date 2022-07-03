# frozen_string_literal: true

module HttpAdapter

  module_function

  def get(url, params = nil)
    conn.get(url, params)
  end

  def conn
    Faraday.new do |f|
      f.request :json
      f.response :json
      f.adapter :net_http
    end
  end
end

