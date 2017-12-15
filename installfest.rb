class Installfest < Formula
  desc "The premiere installer for WDI NYC"
  homepage "https://git.generalassemb.ly/wdi-nyc/installfest"
  url "https://git.generalassemb.ly/wdi-nyc/installfest/raw/homebrew/installfest-2.0.0.tar.gz"
  version "2"
  sha256 "25a28dcf3662bb70dc2120749777370dd451370882f6216901c3b1185e7c1704"


  bottle :unneeded

  resource "nvm" do
    url "https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh"
  end

  def install
    ohai "#{Tty.blue}Welcome to the Installfest!"


    #install nvm by hand
    # configure and copy git aliases
    # do some other magic

    resource('nvm').install
  end
end
