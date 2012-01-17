require "net/http"
require "gitio/version"

module Gitio

  def self.shorten(url)
    Net::HTTP.start "git.io", 80 do |http|
      request = Net::HTTP::Post.new "/"
      request.content_type = "application/x-www-form-urlencoded"
      request.body = "url=" + url

      response = http.request(request)
      return response["Location"]
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
