class Preflight < Formula

  def install
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
  end
end
