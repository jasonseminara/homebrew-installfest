class Weather < Formula
  desc "The only command-line tool to retrieve local weather"
  homepage "https://github.com/jasonseminara/weather"
  url "https://github.com/jasonseminara/weather/blob/master/archive/weather-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "67d335cccca65d650165f4e9d3be46cb31738a6dc622e4ed3540b3e05bfb94e9"

  depends_on "curl"
  depends_on "tig"
  depends_on "git"

  bottle :unneeded

  def install
    bin.install "weather"
  end
end

