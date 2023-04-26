(import cmd)
(import sh)

(defmacro t
  ``
  Invoke tmux commands in short form.
  ``
  [& args]
  (sh/$< tmux ;args)
)

(def VAR_PREFIX "@ot:")

(defmacro setv
  ``
  Set a prefixed tmux variable.
  ``
  [key value]
  ~(sh/$< tmux set -g (string VAR_PREFIX ,key) (string ,value))
)

(defmacro getv
  ``
  Get a prefixed tmux variable as a string.
  ``
  [key]
  ~(string/trim (sh/$< tmux show-option -gv (string ,VAR_PREFIX ,key)))
)

(cmd/main 
  (cmd/group "oakthree"
    "init" (cmd/fn
      "initialize oakthree"
      []
      # Hide the useless status bar
      (t set -g status off)

      (pp (os/getenv "OAKTHREE_PATH"))
    )
    "eval" (cmd/fn
      "evaluate a command"
      [command :string]
      (pp (eval-string command))
    )
  )
)
