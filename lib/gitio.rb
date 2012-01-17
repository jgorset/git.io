require "net/http"
require "uri"

module Gitio
  autoload :VERSION,    "gitio/version"
  autoload :Error,      "gitio/errors"
  autoload :CLI,        "gitio/cli"

  def self.shorten(url, code=nil)
    Net::HTTP.start "git.io", 80 do |http|
      request = Net::HTTP::Post.new "/"
      request.content_type = "application/x-www-form-urlencoded"

      query = {}.tap do |hash|
        hash[:url] = url
        hash[:code] = code if code
      end

      request.body = URI.encode_www_form(query)

      response = http.request(request)

      if short_url = response["Location"]
        return short_url
      else
        raise Error, response.body
      end
    end
  end

  def self.lengthen(url)
    url = URI(url)

    Net::HTTP.start url.host, 80 do |http|
      request = Net::HTTP::Get.new url.path

      response = http.request(request)
      return response["Location"]
    end
  end

end
