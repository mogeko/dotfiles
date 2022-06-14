# Prompt symbol
SIMP1E_PROMPT_SYMBOL='$'
SIMP1E_ROOT_SYMBOL='#'

# Colors
SIMP1E_COLORS_BORDER=cyan
SIMP1E_COLORS_ROOT=red
SIMP1E_COLORS_TIME=yellow
SIMP1E_COLORS_CURRENT_DIR=magenta
SIMP1E_COLORS_IP=green

# Left Prompt
PROMPT='$(simp1e_lborder)$(simp1e_time) $(simp1e_current_dir)$(simp1e_rborder) '

# Right Prompt
RPROMPT='$(simp1e_ip)'

# Enable redrawing of prompt variables
setopt promptsubst

# BORDER
simp1e_lborder() {
  echo -n "%F{$SIMP1E_COLORS_BORDER}[%f"
}

simp1e_rborder() {
  echo -n "%F{$SIMP1E_COLORS_BORDER}]$(simp1e_symbol)%f"
}

# IP Address
simp1e_ip() {
  ip="$(ifconfig | grep -Po 'inet 192.168.(\d+.){2}' | cut -d ' ' -f 2)"
  echo -n "%B%F{$SIMP1E_COLORS_IP}$ip%f%b"
}

# Time
simp1e_time() {
  echo -n "%F{$SIMP1E_COLORS_TIME}%*%f"
}

# Current directory
simp1e_current_dir() {
  echo -n "%F{$SIMP1E_COLORS_CURRENT_DIR}%~%f"
}

# Prompt symbol
simp1e_symbol() {
  echo -n "%(!.%F{$SIMP1E_COLORS_ROOT}$SIMP1E_ROOT_SYMBOL%f.$SIMP1E_PROMPT_SYMBOL)"
}
