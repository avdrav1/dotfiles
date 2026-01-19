# Initialize zoxide first
eval "$(zoxide init zsh)"

# Oh My Zsh configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="${ZSH_CUSTOM:-$ZSH/custom}"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)

# Load Oh My Zsh (this will use the plugins array above)
if [ -f "$ZSH/oh-my-zsh.sh" ]; then
  source "$ZSH/oh-my-zsh.sh"
fi

export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"
export PGHOST="/var/run/postgresql"


export PATH=$PATH:/usr/local/go/bin

HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=50000

setopt inc_append_history

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$HOME/.local/share/omarchy/bin:$PATH"
eval "$(~/.local/bin/mise activate zsh)"

new_tmux () {
  session_dir=$(zoxide query --list | fzf)
  session_name=$(basename "$session_dir")

  if tmux has-session -t $session_name 2>/dev/null; then
    if [ -n "$TMUX" ]; then
      tmux switch-client -t "$session_name"
    else
      tmux attach -t "$session_name"
    fi
    notification="tmux attached to $session_name"
  else
    if [ -n "$TMUX" ]; then
      tmux new-session -d -c "$session_dir" -s "$session_name" && tmux switch-client -t "$session_name"
      notification="new tmux session INSIDE TMUX: $session_name"
    else
      tmux new-session -c "$session_dir" -s "$session_name"
      notification="new tmux session: $session_name"
    fi
  fi

  if [ -s "$session_name" ]; then
    notify-send "$notification"
  fi
}

alias tm=new_tmux

# Helper to download music from YouTube/YouTube Music with metadata, art, and subs
yt-music() {
  if [ -z "$1" ]; then
    echo "Usage: yt-music <youtube-or-youtube-music-url>" >&2
    return 1
  fi

  yt-dlp \
    --yes-playlist \
    --extract-audio \
    --audio-format best \
    --add-metadata \
    --embed-thumbnail \
    --embed-chapters \
    --embed-info-json \
    --output "$HOME/Music/%(album_artist,artist,channel)s/%(album,playlist,title)s/%(playlist_index,track_number,1)02d - %(title)s.%(ext)s" \
    --write-subs \
    --write-auto-subs \
    --sub-lang en \
    --sub-format srt \
    "$1"
}

# Starship prompt (load last so it wins over other prompt customizations)
export STARSHIP_CONFIG="$HOME/.config/starship.toml"
eval "$(starship init zsh)"
