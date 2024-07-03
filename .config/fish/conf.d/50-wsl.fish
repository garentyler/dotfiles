#!/usr/bin/fish

if test -d /mnt/c
  set -x SSH_AUTH_SOCK "$HOME/.ssh/agent.sock"
  if ss -a | grep -q $SSH_AUTH_SOCK
    # Do nothing
  else
    rm -f $SSH_AUTH_SOCK
    setsid nohup socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:$HOME/.ssh/wsl2-ssh-pageant.exe &>/dev/null & disown
  end
  
  set -x GPG_AGENT_SOCK "$GNUPGHOME/S.gpg-agent"
  if ss -a | grep -q $GPG_AGENT_SOCK
    # Do nothing
  else
    rm -rf $GPG_AGENT_SOCK
    setsid nohup socat UNIX-LISTEN:$GPG_AGENT_SOCK,fork EXEC:"$HOME/.ssh/wsl2-ssh-pageant.exe --gpg S.gpg-agent" &>/dev/null & disown
  end
  
  fish_add_path "/mnt/c/Program Files (x86)/GnuPG/bin/"
  alias wsl "wsl.exe"
  alias gpg "gpg.exe"
end
