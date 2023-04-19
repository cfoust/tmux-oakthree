(declare-project
  :name "oakthree"
  :description "oakthree --verbose"
  :dependencies [
    {:url "https://github.com/ianthehenry/cmd.git"
    :tag "v1.0.4"}
    "https://github.com/andrewchambers/janet-sh"
  ]
  )

(declare-executable
  :name "oakthree"
  :entry "main.janet"
  :install true)
