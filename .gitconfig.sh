[push]
  default = current
[core]
  excludesfile = {{user_home}}.gitignore_global
  editor = nano
[user]
  name = {{user_full_name}}
  email = {{user_email}}
[alias]
  co = checkout
  ci = commit
  st = status
  br = branch
  hist = log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short
  type = cat-file -t
  dump = cat-file -p
  lg = log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit
  unstage = reset HEAD --
  last = log -1 HEAD --oneline --decorate
  s = status
  sha = rev-parse HEAD
  ll = log --oneline --decorate
  set-master = branch --set-upstream-to=origin/master master
  back = reset --soft HEAD~1
  again = commit -c ORIG_HEAD
  set-deploy = =
  bs = branch -v
  rs = remote -v
  conflicts = diff --name-only --diff-filter=U
[rerere]
  enabled = false
[filter "lfs"]
  clean = git-lfs clean %f
  smudge = git-lfs smudge %f
  required = true
[color]
  ui = always
[color "branch"]
  current = green reverse
  local = green
  remote = yellow
[color "status"]
  added = green
  changed = yellow
  untracked = red
[commit]
  template = {{user_home}}.gitmessage.txt
[pull]
  rebase = false
