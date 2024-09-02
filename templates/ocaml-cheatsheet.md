# OCaml cheatsheet

## Installing OCaml (e.g. from Vagrantfile)

```
$ sudo apt-get install opam
$ opam init
```
The last command is to be run interactively.

## Creating a new OCaml project
```
$ dune init proj hello
$ cd hello
$ dune build

$ opam switch create . --deps-only
$ opam install core_bench utop	# optional
$ opam install ocaml-lsp-server ocamlformat # for VS Code support
$ eval `opam env`
$ opam lock .

$ git init
$ (echo _build; echo _opam) > .gitignore
$ git add .
$ git commit -m 'initial project skeleton' -m'result of' -m '$ dune init proj hello' -m '$ opam lock .'
```

## Adding a project dependency

Add dependency to dune-project, then run 
```
$ dune build
$ opam install . --deps-only
$ opam lock .
```

Then add dependencies to the proper dune files, then run `dune build` again.

## Running the executable

Use one of the following commands

```
$ dune build && _build/default/bin/hello.exe
$ dune exec ./bin/main.exe
```

## References
* http://ocamlverse.net/content/quickstart_ocaml_project_dune.html
* http://dev.realworldocaml.org/install.html

## Regular expressions

Using re library:

```
utop # #require "re"
;;
─( 11:15:10 )─< command 6 >──────────────────────────────────────{ counter: 0 }─
utop # Re.Perl.re {|\?[ \n\t\r]*$|};;
val _6 : Re.t = <abstr>
─( 11:28:46 )─< command 7 >──────────────────────────────────────{ counter: 0 }─
utop # Re.Perl.compile _6;;
val _7 : Re.re = <abstr>
─( 11:35:06 )─< command 8 >──────────────────────────────────────{ counter: 0 }─
utop # Re.execp _7 "yo? ";;
val _8 : bool = true
```

Using str library: 

```
utop # #require "str";;
─( 11:12:20 )─< command 3 >──────────────────────────────────────{ counter: 0 }─
utop # Str.regexp {|\?[ \n\t\r]*$|};;
val _3 : Str.regexp = <abstr>
utop # Str.search_forward _3 "yo? " 0;;
val _9 : int = 2
─( 11:35:38 )─< command 10 >─────────────────────────────────────{ counter: 0 }─
utop # Str.search_forward _3 "yo!" 0;;
Exception: Not_found.
```

```
  let re = Str.regexp {|\?[ \n\t\r]*$|} in 
  try
    Str.search_forward re s 0 >= 0
  with Not_found -> false
```

## Launching interactive REPL

```
$ utop -implicit-bindings
```

## Loading Jane Street Base in utop

```
utop # #require "core.top";;
─( 22:40:01 )─< command 9 >──────────────────────────────────────{ counter: 0 }─
utop # open Base;;
─( 22:41:22 )─< command 10 >─────────────────────────────────────{ counter: 0 }─
```
