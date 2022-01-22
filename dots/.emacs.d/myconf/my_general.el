;; color theme
(load-theme 'sanityinc-tomorrow-blue t)

;; 行番号
(require 'linum)
(global-linum-mode 1)

;; メニューバーを非表示
(menu-bar-mode 0)

;; ツールバーを非表示
(tool-bar-mode 0)

;;スクロールバーを非表示
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
