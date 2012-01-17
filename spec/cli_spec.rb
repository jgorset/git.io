require "gitio"

describe Gitio::CLI do
  
  before do
    $stdout = StringIO.new
  end

  it "accepts an URL" do
    Gitio::CLI.new ["http://github.com/jgorset/git.io"]
  end

  it "accepts an URL with a code" do
    Gitio::CLI.new ["http://github.com/jgorset/git.io", "git.io"]
  end

end
