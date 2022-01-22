# dotfiles

## install
`sh deploy.sh`

## emacs
### List of ths Use Package
- `color-theme-sanityinc-tomorrow` - color theme
- `company`
- `ivy`
- `ivy-rich`
- `counsel`
- `swiper`
- `flycheck`
- `magit`
- `wgrep`
- `ace-window`
- `multiple-cursors`
- `yasnippet`
- `nyan-mode`
- `all-the-icons`
  - `M-x all-the-icons-install-fonts`
  - `$fc-cache -f -v`
- `all-the-icons-dired`
- `all-the-icons-ivy`
- `all-the-icons-ivy-rich`
- `undo-tree`
- `markdown-mode`
  - `sudo apt install pandoc`
- `rainbow-delimiters`
- `org`
- `emoji-cheat-sheet-plus`
  - `sudo apt install fonts-symbola`
  
### General Setting
- バックファイルの扱いは[ここ](http://yohshiy.blog.fc2.com/blog-entry-319.html)を参考に記述

### Programming Languages
- `elpy` (Python)
- `go-mode`, `company-go`, `go-eldoc`
  - `go get -u github.com/stamblerre/gocode`
  - `go get -u github.com/rogpeppe/godef`
- `web-mode`


## tmux
### Dependencies (Plugins)
- xsel
- [TPM](https://github.com/tmux-plugins/tpm)
- [tmux-conpycat](https://github.com/tmux-plugins/tmux-copycat)
- [tmux-battery](https://github.com/tmux-plugins/tmux-battery)
- [tmux-cpu](https://github.com/tmux-plugins/tmux-cpu)
- [tmux-plugin-mem](https://github.com/GROG/tmux-plugin-mem)

### Key Bindings
`prefix`
- `ctrl` + `o`

## 参考
- https://github.com/fabon-f/dotfiles
