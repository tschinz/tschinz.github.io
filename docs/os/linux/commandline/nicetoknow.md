---
tags:
- os
- operating system
- linux
- unix
- commandline
- rust
---
# Nice to Know
Herafter a list of handy nict to know CLI tools. Many of them are written in rust.

Check out also [Rust Utils](https://rustutils.com/)

| Tool                                                | Replaces   | Type                  | Example                         | Description                                            |
|-----------------------------------------------------|------------|-----------------------|---------------------------------|--------------------------------------------------------|
| [starhip](https://starship.rs/)                     | -          | Cross-Shell Prompt    | -                               | Customizable shell prompt for any shell                |
| [procs](https://github.com/dalance/procs)           | `ps`       | Process Viewer        | `procs -a`                      | List all processes with a concise and readable format    |
| [atuin](https://atuin.sh/)                          | -          | Shell history         | -                               | Sync, search and backup shell history |
| [hyperfine](https://github.com/sharkdp/hyperfine)   | -          | Benchmark             | `hyperfine 'cargo build'`       | Measure the execution time of 'cargo build' command      |
| [duf](https://github.com/muesli/duf)                | `du`       | Disk Usage            | `duf -s`                        | Display disk usage with a simple and interactive interface |
| [dust](https://github.com/bootandy/dust)            | `du`       | Disk Usage            | `dust -n 10`                    | Visualize disk usage of the current directory            |
| [diskonaut](https://github.com/imsnif/diskonaut)    | `dust`     | Disk Space Navigator  | `diskonaut`                     | Visualize disk usage of the current directory            |
| [broot](https://github.com/Canop/broot)             | `cd` `ls`  | Navigate Directories  | `br`                            | A new way to see and navigate directory trees |
| [exa](https://github.com/ogham/exa)                 | `ls`       | Listing               | `exa -l -G`                     | List files with extended details and colored output     |
| [ripgrep](https://github.com/BurntSushi/ripgrep)    | `grep`     | Search                | `rg -i TODO src/ --glob "*.md"` | Recursively searches directories within markdown files for a regex pattern |
| [sd](https://github.com/chmln/sd)                   | `sed`      | Search and Replace    | `sd before after file.txt`      | Painless seardh and replace with regex |
| [bat](https://github.com/sharkdp/bat)               | `cat`      | Pager                 | `bat src/main.rs`               | View files with syntax highlighting and Git integration |
| [btop](https://github.com/aristocratos/btop)         | `top`      | Resource viewer       | `zenith`                        | Zenith - sort of like top or htop but with zoom-able charts, network, and disk usage. |
| [zenith](https://github.com/bvaisvil/zenith)        | `top`      | Resource viewer       | `zenith`                        | Zenith - sort of like top or htop but with zoom-able charts, network, and disk usage. |
| [delta](https://github.com/dandavison/delta)        | `diff`     | Visual Diff           | `git diff | delta`              | Enhance the git diff output with improved layout and styling |
| [tokei](https://github.com/XAMPPRocky/tokei)        | -          | Code Statistics       | `tokei src/`                    | Generate code statistics for the Rust source directory  |
| [shellcheck](https://www.shellcheck.net/)           | -          | Shell Script Linter   | `shellcheck myscript.bash`      | Finds bugs in your shell scripts |
| [numbat](https://github.com/sharkdp/numbat)         | -          | Scientific Calculator | `numbat`                        | A statically typed programming language for scientific computations with first class support for physical dimensions and units |
| [tealdear](https://github.com/tealdeer-rs/tealdeer) | `man`      | tldr                  | `tldr hyperfine`                | Communicty driven man pages |
| [thefuck](https://github.com/nvbn/thefuck)          | -          | CLI Corrector         | `f`                             | corrects automagially your previous console command |

**Finder tools**

| Tool                                               | Replaces     | Type            | Example                        | Description                                            |
|----------------------------------------------------|--------------|-----------------|--------------------------------|--------------------------------------------------------|
| [fd](https://github.com/sharkdp/fd)                | `find`       | Search          | `fd '*.rs'`                    | Find files, user-friendlier than `find` |
| [fzf](https://github.com/junegunn/fzf)             | -            | Fuzzy Finder    | `fzf`                          | Fuzzy Finder, integrated with commands for interactive file selection  |
| [skim](https://github.com/lotabout/skim)           | `fzf`        | Fuzzy Finder    | `sk`                           | Fuzzy Finder, integrated with commands for interactive file selection  |
| [tv](https://github.com/alexpasmantier/television) | `fzf` `sk`   | Fuzzy Finder    | `tv`                          | Fuzzy Finder, with tui allow finding env vars, files, file content, git repos, alias |

**Multimedia tools**

| Tool                                               | Replaces   | Type                | Example                                                                       | Description                                                                  |
|----------------------------------------------------|------------|---------------------|-------------------------------------------------------------------------------|------------------------------------------------------------------------------|
| [codesnap](https://github.com/mistricky/codesnap)  | -          | Code Images         | `codesnap -c "echo 'Hello, World!'" -o clipboard --title "Hello, World!"s` | Created images of code via a terminal CLI                                    |
| [t-rec](https://github.com/sassman/t-rec-rs)       | -          | Terminal Recording  | `t-rec -o session.gif`                                                        | A tool to record your terminal sessions as animated GIFs                     |
| [asciinema](https://asciinema.org/)                | -          | Terminal Recording  | `asciinema rec`                                                               | Record and share terminal sessions, with playback options (web or terminal)  |

**CodeSnap Configuration**
```json title="~/.config/CodeSnap/config.json"
{
  "window": {
    "mac_window_bar": true,
    "shadow": 10,
    "margin": {
      "x": 20,
      "y": 40
    }
  },
  "code": {
    "font_family": "CaskaydiaCove Nerd Font",
    "theme": "candy"
  },
  "watermark": {
    "content": "",
    "font_family": "Pacifico",
    "color": "#ffffff"
  },
  "background": {
    "start": {
      "x": 0,
      "y": 0
    },
    "end": {
      "x": 0,
      "y": 0
    },
    "stops": [
      {
        "position": 0,
        "color": "#ffffff"
      }
    ]
  }
}
```

## Commonly used commands

skim in interactive mode with preview script and bind `Ctrl-Y` to copy filename and `F4` open in Sublime Text
```bash
sk --ansi -i -c 'ag --color "{}"' --preview "./preview.sh {}" --bind 'f3:execute(subl -f {}),ctrl-y:execute-silent(echo {} | pbcopy)+abort'
```

```bash
exa -la
```
