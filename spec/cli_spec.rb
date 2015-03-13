require "gitio"
require "support"

describe Gitio::CLI do

  it "accepts an URL" do
    output = capture_stdout do
      Gitio::CLI.new ["https://github.com/jgorset/git.io"]
    end

    output.should eq "http://git.io/Vhp6yw\n"
  end

  it "accepts an URL with a code" do
    output = capture_stdout do
      Gitio::CLI.new ["https://github.com/jgorset/git.io", "git.io"]
    end

    output.should eq "http://git.io/Vhp6yw\n"
  end

end
