class Installfest < Formula
  desc "The premiere installer for WDI NYC"
  homepage "https://git.generalassemb.ly/wdi-nyc/installfest"
  url "https://git.generalassemb.ly/wdi-nyc/installfest/archive/master.zip"
  version "2"
  sha256 "6e033713d93dce57ab80207b3c9a9076e37d6b4339bc7f476ae2b6b2af3529f4"

  bottle :unneeded

  def install
    ohai "#{Tty.blue}Welcome to WDI Installfest!"

    #######
    ### pre-flight

    # check for admin
    #ohai "Checking user..."
    #print "\t#{Tty.green}Checking for admin privileges..."
    #if quiet_system "id -Gn $whoami | grep -qw admin"
    #  raise onoe <<~EOS
    #    #{Tty.bold}
    #    The current user does not have administrator privileges.
    #      #{Tty.reset}You must run this program from an admin user.
    #      Ask an instructor for help.
    #      Exiting..."
    #  EOS
    #end
    #print "\t#{Tty.green}done!\n"


    # check for mixed-case username
    print "\t#{Tty.green}Checking for mixed-case..."
    if ENV['LOGNAME'][/[A-Z]/]
      raise onoe <<~EOS
        #{Tty.bold}
        Your username #{ENV['LOGNAME']} cannot be 'mixed-case'; it should be entirely in lowercase.
          #{Tty.reset}This could lead to some issues where certain tools that are
          case-sensitive, and others that are not, don't work well together.
          It is suggested that you change your username.
          PS: this also goes for your GitHub username!
      EOS
    end
    ohai "\t#{Tty.green}done!"

    # check for spaces in username
    print "\t#{Tty.green}Checking for spaces in your username..."
    if ENV['LOGNAME'][/\s/]
      raise onoe <<~EOS
        #{Tty.bold}
        Your username #{ENV['LOGNAME']} has a space.
          This complicates using command line tools, and can even break some programs.
          Change your username before continuing.                              "
          Exiting...
      EOS
    end
    ohai "\t#{Tty.green}done!"

    # check for command-line tools
    ohai "#{Tty.green}Checking for XCode Command Line Tools..."
    system "xcode-select", "--install" if MacOS::CLT.outdated?
    ohai "XCode"

    # software updates
    ohai "#{Tty.green}Running software update on Mac OS..."
    # system "softwareupdate", "-ir"
    ohai "#{Tty.green}Software updated!"

    # ensure user owns their home folder
    ohai "#{Tty.green}Ensuring the current user owns their home folder..."
    # system "chown", "-R", ENV['LOGNAME'], "/Users/#{ENV['LOGNAME']}"
    ohai "#{Tty.green}Home directory owned!"

    ### pre-install
    # remove rvm
    ohai "#{Tty.green}Removing RVM..."
    if quiet_system "hash rvm"
      ohai "rvm installed"
    end
    ohai "#{Tty.green}rvm removed!"
    # remove macports

    ### install
    # move/config/symlink config files
    # install dependencies
    #

    ### post-install
    #

  end
end
