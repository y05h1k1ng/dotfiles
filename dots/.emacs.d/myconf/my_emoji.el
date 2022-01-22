;; emacs-emoji-cheat-sheet-plus
(require 'emoji-cheat-sheet-plus)
(global-set-key (kbd "C-c C-e") 'emoji-cheat-sheet-plus-insert)
(add-hook 'org-mode-hook 'emoji-cheat-sheet-plus-display-mode)
(add-hook 'markdown-mode-hook 'emoji-cheat-sheet-plus-display-mode)
(add-hook 'magit-mode-hook 'emoji-cheat-sheet-plus-display-mode)
