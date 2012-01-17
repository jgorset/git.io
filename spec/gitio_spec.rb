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

  it "should raise an exception upon trying to shorten an invalid URL" do
    original_url = "http://google.com"

    expect { Gitio.shorten(original_url) }.to raise_error Gitio::Error
  end

end
