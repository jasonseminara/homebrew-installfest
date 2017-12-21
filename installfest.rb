class Installfest < Formula
  desc "The premiere installer for WDI NYC"
  homepage "https://git.generalassemb.ly/wdi-nyc/installfest"
  url "https://git.generalassemb.ly/wdi-nyc/installfest/archive/master.zip"
  version "2"
  sha256 "6e033713d93dce57ab80207b3c9a9076e37d6b4339bc7f476ae2b6b2af3529f4"


  bottle :unneeded

  depends_on "git"


  def install
    ohai "#{Tty.blue}Welcome to the Installfest!"

    #######
    ### pre-flight

    # check for admin
    ohai "Pre-Flight..."
    ohai "#{Tty.green}Checking for admin privileges..."
    if !system "id -Gn $whoami | grep -qw admin"
      onoe <<~EOS
        #{Tty.red}#{Tty.bold}
        The current user does not have administrator privileges.
        #{Tty.reset}You must run this program from an admin user.
        Ask an instructor for help.
        Exiting..."
      EOS
      raise SecurityError
    end


    # check for mixed-case username
    ohai "#{Tty.green}Checking for mixed-case..."
    if ENV['LOGNAME'][/[A-Z]/]
      raise SecurityError, 'mixed-case'
    end

    # check for spaces in username
    ohai "#{Tty.green}Checking for spaces..."
    if ENV['LOGNAME'][/\s/]
      raise SecurityError, 'poop'
    end

    # check for command-line tools
    if MacOS::CLT.outdated?
      raise StandardError, "xcode"
    end

    ### pre-install
    # software updates
    # remove rvm
    # remove macports

    ### install
    # move/config/symlink config files
    # install dependencies
    #

    ### post-install
    #

  end
end
