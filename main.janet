(import cmd)
(import sh)

(cmd/main 
  (cmd/group "oakthree"
    "init" (cmd/fn
      "initialize oakthree in the current tmux server"
      [name :string]
      (printf "%s" name)
      )
    "resize" (cmd/fn
      "resize all panes"
      [name :string]
      (def out (sh/$< tmux list-sessions))
      (pp out)
      )
    )
  )
  
