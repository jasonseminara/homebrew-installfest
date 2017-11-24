cask_args appdir: "/Applications"
tap "caskroom/cask"
tap "telemachus/brew", "https://telemachus@bitbucket.org/telemachus/brew.git"
brew "imagemagick"
brew "mysql@5.6", restart_service: true, link: true, conflicts_with: ["mysql"]
brew "emacs", args: ["with-cocoa", "with-gnutls"]
cask "google-chrome"
cask "java" unless system "/usr/libexec/java_home --failfast"
cask "firefox", args: { appdir: "~/my-apps/Applications" }
mas "1Password", id: 443987910
