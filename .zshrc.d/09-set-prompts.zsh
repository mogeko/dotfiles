# Prompt symbol
SIMP1E_PROMPT_SYMBOL='$'
SIMP1E_ROOT_SYMBOL='#'
SIMP1E_SPARATE_SYMBOL=':'

# Colors
SIMP1E_COLORS_BORDER=cyan
SIMP1E_COLORS_ROOT=red
SIMP1E_COLORS_CLOCK=yellow
SIMP1E_COLORS_CURRENT_DIR=magenta
SIMP1E_COLORS_ME=green
SIMP1E_COLORS_SPARATE=yellow

# Enable redrawing of prompt variables
setopt promptsubst

# BORDER
function _simp1e_lborder() {
  echo -n "%F{$SIMP1E_COLORS_BORDER}[%f"
}

function _simp1e_rborder() {
  echo -n "%F{$SIMP1E_COLORS_BORDER}]%f"
}

# User
function _simp1e_me() {
  echo -n "%(!.%F{$SIMP1E_COLORS_ROOT}.%F{$SIMP1E_COLORS_ME})%n%f"
}

# Separate
function _simp1e_separate() {
  echo -n "%F{$SIMPLE_COLORS_SPARATE}$SIMP1E_SPARATE_SYMBOL%f"
}

# Clock
function _simp1e_clock() {
  echo -n "%F{$SIMP1E_COLORS_CLOCK}%*%f"
}

# Current directory
function _simp1e_current_dir() {
  echo -n "%F{$SIMP1E_COLORS_CURRENT_DIR}%~%f"
}

# Prompt symbol
function _simp1e_symbol() {
  echo -n "%(!.%F{$SIMP1E_COLORS_ROOT}$SIMP1E_ROOT_SYMBOL%f.%F{$SIMP1E_COLORS_ME}$SIMP1E_PROMPT_SYMBOL%f)"
}

# Left Prompt
PROMPT='%B$(_simp1e_lborder)$(_simp1e_me)$(_simp1e_separate)$(_simp1e_current_dir)$(_simp1e_rborder)$(_simp1e_symbol)%b '

# Right Prompt
RPROMPT='%B$(_simp1e_clock)%b'
