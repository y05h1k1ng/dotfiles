;; all-the-icons
(require 'all-the-icons)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
(add-hook 'after-init-hook 'all-the-icons-ivy-setup)
;; TODO: check ivy-rich
