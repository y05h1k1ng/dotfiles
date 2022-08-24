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

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  )
(eval-when-compile
  (require 'use-package)
  )

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

;; 警告音もフラッシュもすべて無効
(setq ring-bell-function 'ignore)

;;; バックアップファイル(*.~)
(setq backup-directory-alist '((".*" . "~/.backup_emacs"))) ;; ~/.backup_emacs 以下に配置
(setq version-control t) ;; 複数保存
(setq kept-new-versions 5) ;; 最新の保持数
(setq kept-old-versions 1) ;; 最古の保持数
(setq delete-old-versions t) ;; 範囲外削除
(setq auto-save-timeout 10) ;; default 30s
(setq auto-save-interval 100) ;; default 300type

;;; lock file(.#*) は作成しない
(setq create-lockfiles nil)

;; dismiss startup screen
(setq inhibit-startup-screen t)

;; tab -> space
(setq-default indent-tabs-mode nil)

;; 日本語フォント
(set-language-environment "Japanese")

(use-package underwater-theme
  :ensure t
  :config
  (load-theme 'underwater t)
  )

(use-package linum
  :config
  (global-linum-mode t)
  )

(use-package winner
  :config
  (winner-mode t)
  )

(use-package use-package-ensure-system-package
  :ensure t
  )

(use-package company
  :ensure t
  :init (global-company-mode)
  :bind (
         :map company-active-map
              ("C-n" . company-selection-next)
              ("C-p" . company-selection-previous)
         )
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2)
  (setq company-selection-wrap-around t)
  )

(use-package ivy
  :ensure t
  :init (ivy-mode)
  :bind (
         ("C-c C-r" . ivy-resume)
         )
  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  )

(use-package swiper
  :ensure t
  :bind (
         ("C-s" . swiper)
         )
  :config
  (setq search-default-mode #'char-fold-to-regexp)
  )

(use-package counsel
  :ensure t
  :ensure-system-package
  (ag . "sudo apt -y install silversearcher-ag")
  :bind (
         ("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-c i f" . counsel-describe-function)
         ("C-c i v" . counsel-describe-variable)
         ("C-c i o" . counsel-describe-symbol)
         ("C-c i l" . counsel-find-library)
         ("C-c i i" . counsel-info-lookup-symbol)
         ("C-c i u" . counsel-unicode-char)
         ("C-c g" . counsel-git)
         ("C-c j" . counsel-git-grep)
         ("C-c k" . counsel-ag)
         ("C-x l" . counsel-locate)
         ("C-c r" . counsel-recentf)
         :map minibuffer-local-map
         ("C-r" . counsel-minibuffer-history)
         )
  )

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :bind (
         :map global-map
         ("C-c n" . flycheck-next-error)
         ("C-c p" . flycheck-previous-error)
         ("C-c d" . flycheck-list-errors)
         )
  )

(use-package magit
  :ensure t
  :bind (
         ("C-x g" . magit-status)
         )
  )

(use-package wgrep
  :ensure t
  :config
  (setf wgrep-enable-key "e")
  (setq wgrep-auto-save-buffer t)
  (setq wgrep-change-readonly-file t)
  )

(use-package ace-window
  :ensure t
  :bind (
         ("M-o" . ace-window)
         )
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  )

(use-package multiple-cursors
  :ensure t
  :bind (
         ("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)
         )
  )

(use-package nyan-mode
  :ensure t
  :init (nyan-mode t)
  )

(use-package undo-tree
  :init (global-undo-tree-mode t)
  :bind (
         ("M-/" . undo-tree-redo)
         )
  :config
  (setq undo-tree-auto-save-history nil)
  )

(use-package markdown-mode
  :ensure t
  :ensure-system-package (pandoc . "sudo apt -y install pandoc")
  :mode ("\\.md\\'" . gfm-mode)
  :config
  (setq markdown-command "pandoc")
  )

(use-package rainbow-delimiters
  :ensure t
  :init
  (use-package cl-lib)
  (use-package color)
  :hook (prog-mode . rainbow-delimiters-mode)
  :config
  (defun rainbow-delimiters-using-stronger-colors()
    (interactive)
    (cl-loop
     for index from 1 to rainbow-delimiters-max-face-count
     do
     (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
       (cl-callf color-saturate-hsl (face-foreground face) 30)
       )
     )
    )
  (add-hook 'emacs-startup-hook 'rainbow-delimiters-using-stronger-colors)
  )

(use-package web-mode
  :ensure t
  :mode (
         "\\.phtml\\'"
         "\\.tpl\\.php\\'"
         "\\.[agj]sp\\'"
         "\\.as[cp]x\\'"
         "\\.erb\\'"
         "\\.mustache\\'"
         "\\.djhtml\\'"
         "\\.html?\\'"
         )
  )

(use-package emoji-cheat-sheet-plus
  :ensure t
  :bind (
         "C-c C-e" . emoji-cheat-sheet-plus-insert
         )
  :hook (
         (org-mode-hook . emoji-cheat-sheet-plus-display-mode)
         (markdown-mode-hook . emoji-cheat-sheet-plus-display-mode)
         (magit-mode-hook . emoji-cheat-sheet-plus-display-mode)
         )
  )

(use-package avy
  :ensure t
  :bind (
         ("C-'" . avy-goto-char-2)
         ("C-:" . avy-goto-char-timer)
         ("M-g f" . avy-goto-line)
         ("M-g w" . avy-goto-word-1)
         )
  )

(use-package highlight-symbol
  :ensure t
  :hook (
         (prog-mode . highlight-symbol-mode)
         (prog-mode . highlight-symbol-nav-mode)
         )
  :bind (
         ("C-c C-l" . highlight-symbol-at-point)
         )
  :config
  (setq highlight-symbol-idle-delay 1.0)
  )

(use-package mozc-im
  :ensure t
  :if (and (equal system-type 'gnu/linux)
           (string-match-p "microsoft" (shell-command-to-string "uname -r")))
  :init
  (use-package mozc-popup)
  (use-package wdired)
  :bind (
         ("M-`" . toggle-input-method)
         ("C-<f1>" . disable-input-method)
         ("C-<f2>" . enable-input-method)
         :map isearch-mode-map
         ("M-`" . isearch-toggle-input-method)
         ("C-<f1>" . isearch-disable-input-method)
         ("C-<f2>" . isearch-enable-input-method)
         :map wdired-mode-map
         ("M-`" . toggle-input-method)
         ("C-<f1>" . disable-input-method)
         ("C-<f2>" . enable-input-method)
         )
  :hook (
         (isearch-mode-hook . (lambda () (setq im-state mozc-im-mode)))
         (isearch-mode-end-hook . (lambda ()
                                  (unless (eq im-state mozc-im-mode)
                                    (if im-state
                                        (activate-input-method default-input-method)
                                      (deactivate-input-method)))))
         )
  :config
  (setq default-frame-alist (append (list '(width . 72) '(height . 40))))
  (setq default-input-method "japanese-mozc-im")
  (setq mozc-candidate-style 'popup)
  (blink-cursor-mode 0)
  (defun enable-input-method (&optional arg interactive)
    (interactive "P\np")
    (if (not current-input-method)
        (toggle-input-method arg interactive)))

  (defun disable-input-method (&optional arg interactive)
    (interactive "P\np")
    (if current-input-method
        (toggle-input-method arg interactive)))

  (defun isearch-enable-input-method ()
    (interactive)
    (if (not current-input-method)
        (isearch-toggle-input-method)
      (cl-letf (((symbol-function 'toggle-input-method)
                 (symbol-function 'ignore)))
        (isearch-toggle-input-method))))

  (defun isearch-disable-input-method ()
    (interactive)
    (if current-input-method
        (isearch-toggle-input-method)
      (cl-letf (((symbol-function 'toggle-input-method)
                 (symbol-function 'ignore)))
        (isearch-toggle-input-method))))
  
  (advice-add 'wdired-finish-edit
              :after (lambda (&rest args)
                       (deactivate-input-method)))
  )

(use-package recentf-ext
  :ensure t
  :config
  (recentf-mode 1)
  (setq recentf-max-saved-items 2000)
  (setq recentf-exclude '(".recentf"))
  (setq recentf-auto-cleanup 10)
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(use-package zenburn-theme company-go go-eldoc mozc-im mozc-popup go-mode lsp-python-ms yasnippet wgrep web-mode undo-tree rainbow-delimiters org nyan-mode multiple-cursors markdown-mode magit flycheck emoji-cheat-sheet-plus eglot counsel company color-theme-sanityinc-tomorrow all-the-icons-ivy-rich all-the-icons-ivy all-the-icons-dired ace-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here
