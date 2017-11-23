class Weather < Formula
  desc "The only command-line tool to retrieve local weather"
  homepage "https://github.com/jasonseminara/weather"
  url "https://github.com/jasonseminara/weather/blob/master/archive/weather-1.0.0.tar.gz"
  version "1.0.1"
  sha256 "2d877400850ba4524709e6f23366edf3965df1cb69c08d0fe315c0700c11bcf5"

  depends_on "curl"
  depends_on "tig"
  depends_on "git"

  bottle :unneeded

  def install
    bin.install "weather"
  end
end

