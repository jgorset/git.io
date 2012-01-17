require "net/http"
require "gitio"

describe Gitio do

  it "shortens URLs randomly" do
    original_url = "https://github.com/jgorset/git.io"

    short_url = Gitio.shorten(original_url)
    long_url  = Gitio.lengthen(short_url)

    original_url.should eq long_url
  end

  it "shortens URLs with a given code" do
    original_url = "https://github.com/jgorset/git.io"

    short_url = Gitio.shorten(original_url, "git.io")

    short_url.should eq "http://git.io/git.io"
  end

end
