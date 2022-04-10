;;; init.el --- Initialization file for Emacs
;;; Commentary:
;;; Emacs Startup File --- initialization for Emacs

;;; Code:
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/myconf")

(load "my_general")
(load "my_company")
(load "my_ivy_swiper_counsel")
(load "my_flycheck")
(load "my_git")
(load "my_wgrep")
(load "my_ace_window")
(load "my_multiple_cursors")
(load "my_yasnippet")
(load "my_nyan")
(load "my_all_the_icons")
(load "my_undo_tree")
(load "my_markdown")
(load "my_rainbow-delimiters")
(load "my_web")
(load "my_org")
(load "my_emoji")
(load "my_avy")
;;(load "my_python")
(load "my_golang")
(load "my_playground")

;; wsl setting
(when (and (equal system-type 'gnu/linux)
           (string-match-p "microsoft" (shell-command-to-string "uname -r")))
  (load "my_wsl_setting"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company-go go-eldoc mozc-im mozc-popup go-mode lsp-python-ms yasnippet wgrep web-mode undo-tree rainbow-delimiters org nyan-mode multiple-cursors markdown-mode magit flycheck emoji-cheat-sheet-plus eglot counsel company color-theme-sanityinc-tomorrow all-the-icons-ivy-rich all-the-icons-ivy all-the-icons-dired ace-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here
