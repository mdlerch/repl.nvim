Introduction
============

`repl.nvim` is a neovim plugin that takes advantage of neovim's built-in
terminal.  The plugin creates a terminal split loaded with your repl of
interest.  Lines from the source file can be sent to the repl through a
mapping.  The repl can be highlighted using any desired syntax.

Options
=======

- `b:repl_cmd` executable for repl
- `b:repl_file` source function for repl
- `b:repl_quit` quit function for repl
- `b:repl_syntax` syntax highlighting for repl

*Notes*: Not all repl's have a good way to source a whole file.  If you set:

```
let b:repl_file = "load"
```

then what happens when you run `<Plug>Repl_file` is that the command
`load("<current file name>")` is sent to the repl.

The option `b:repl_syntax` should be something like
`"syntax/filetype_of_interest.vim"`.  So, if you are using python:
`"syntax/python.vim"`.  If you want to highlight the prompt, you should write
your own (or tweak an existing) syntax file.

Mappings
========

- `<Plug>Repl_start` start the repl
- `<Plug>Repl_line` send the current line
- `<Plug>Repl_down` send the current line and down
- `<Plug>Repl_quit` quit the repl
- `<Plug>Repl_file` send whole file to repl

Recommended use
===============

I recommend adding the appropriate options and mappings to
`ftplugin/filetype.vim` for whatever filetypes you want to use `repl.nvim`.

Example
=======

I have this in my `ftplugin/gnuplot.vim`

```
let b:repl_cmd = "gnuplot"
let b:repl_file = "load"
let b:repl_quit = "quit"
let b:repl_syntax = "syntax/gnuplot.vim"

map ,rf <Plug>Repl_start
map ,l <Plug>Repl_line
map ,d <Plug>Repl_down
map ,rq <Plug>Repl_quit
map ,aa <Plug>Repl_file
```




