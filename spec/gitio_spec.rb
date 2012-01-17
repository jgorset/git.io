require "net/http"
require "gitio"

describe Gitio do

  it "shortens and lengthens URLs" do
    original_url = "http://github.com/jgorset/facepy"

    short_url = Gitio.shorten(original_url)
    long_url  = Gitio.lengthen(short_url)

    original_url.should eq long_url
  end

end
