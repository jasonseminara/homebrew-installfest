# require "cask/lib/hbc/system_command"

class Installfest < Formula

  desc "The installer for WDI NYC"
  homepage "https://git.generalassemb.ly/wdi-nyc/installfest"
  url "https://git.generalassemb.ly/wdi-nyc/installfest/archive/homebrew.zip"
  version "2"
  sha256 "e78c801835668dc5d5ac58577bc9c29442903a309cbe7469e14598407826efc2"

  bottle :unneeded

  # We'll only allow sierra and above.
  depends_on :macos => :sierra
  depends_on :xcode

  def install
    $HOME = Pathname.new('~/');
    oh1 "#{Tty.blue}Welcome to WDI Installfest!"

    # ohai Hbc::SystemCommand.new "/bin/rm", {sudo:true}
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
    ohai "#{Tty.green}done!"

    # check for command-line tools
    # print "\t#{Tty.green}Checking for XCode Command Line Tools..."
    # if MacOS::CLT.outdated?
    #   system "xcode-select", "--install"
    # else
    #   ohai "#{Tty.green}up to date!"
    # end

    # # software updates
    # print "\t#{Tty.green}Running software update on Mac OS..."
    # # system "softwareupdate", "-ir"
    # ohai "#{Tty.green}Updated!"

    # ensure user owns their home folder
    print "\t#{Tty.green}Ensuring the current user owns their home folder..."
    # system "chown", "-R", ENV['LOGNAME'], "/Users/#{ENV['LOGNAME']}"
    ohai "#{Tty.green}done!"

    ### pre-install
    # remove rvm

    rvm = $HOME/'.rvm' ##/#
    #

    if quiet_system "hash rvm" or rvm.exist?
      print "\t#{Tty.green}Removing RVM..."
      system "rvm", "implode"
      rvm.rmtree
      ohai "#{Tty.green}done!"
    else
      ohai "\t#{Tty.green}RVM not installed"
    end


  # Uninstall Macports b/c we are using Homebrew
  # http://guide.macports.org/chunked/installing.macports.uninstalling.html
    macports = Pathname.new('/opt/local/macports')
    # remove macports
    if quiet_system 'hash port' or macports.exist?
      ohai "\t#{Tty.green}Removing macports..."

      # remove_macports = Hbc::SystemCommand.new("/bin/rm", sudo: true, args: ["-rf", macports.to_s])


      # remove each subdirectory of macports
      # sudo port -fp uninstall installed
      # gather all associated files/folders

      files = Dir[*%w(
        /opt/local
        /Applications/DarwinPorts
        /Applications/MacPorts
        /Library/StartupItems/DarwinPortsStartup
        /Library/Tcl/darwinports1.0
        /Library/Tcl/macports1.0
        /Library/LaunchDaemons/org.macports.*
        /Library/Receipts/DarwinPorts*.pkg
        /Library/Receipts/MacPorts*.pkg
        ~/.macports
      )]

      macports.each_child(&:rmtree)
      # ohai macports.owned?
      # TODO: add warnings to dynamic shell script...
      # or
      # TODO: remove_macports.run!
      # remove all the above files

      FileUtils.rm_rf(*files)
      files.each do |f|
        opoo "Cannot remove #{f}! Use the cleanup script to remove them with `sudo`"
      end
    else
      ohai "\t#{Tty.green}Macports not installed..."
    end

    # TODO: github keys...



    ### install
    # move/config/symlink config files
    bin.install "settings/dotfiles/bash_prompt.sh"
    bin.install "settings/dotfiles/welcome_prompt.sh"

    # ln_s "#{bin}/bash_prompt.sh", "~/bash_prompt.sh", force:true
    # install dependencies
    #

    ### post-install
    #

  end

end
