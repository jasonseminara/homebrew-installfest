class Nvm < Formula
  desc "Manage multiple Node.js versions"
  homepage "https://github.com/creationix/nvm"
  url "https://github.com/creationix/nvm/archive/v0.33.8.tar.gz"
  sha256 "59429f4bf3da7c2b7bcac06c488054dd774ae6962bdcefe249015d3590704b0b"
  head "https://github.com/creationix/nvm.git"

  bottle :unneeded

  def install
    ENV["NVM_DIR"]="~/.nvm"
    system "./install.sh"
    prefix.install "nvm.sh", "nvm-exec"
    bash_completion.install "bash_completion" => "nvm"
  end


  test do
    output = pipe_output("NODE_VERSION=homebrewtest #{prefix}/nvm-exec 2>&1")
    assert_no_match /No such file or directory/, output
    assert_no_match /nvm: command not found/, output
    assert_match "N/A: version \"homebrewtest -> N/A\" is not yet installed", output
  end
end
