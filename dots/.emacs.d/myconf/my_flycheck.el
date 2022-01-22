;; flycheck
(require 'flycheck)
(global-flycheck-mode)
(define-key global-map (kbd "\C-c n") 'flycheck-next-error)
(define-key global-map (kbd "\C-c p") 'flycheck-previous-error)
(define-key global-map (kbd "\C-c d") 'flycheck-list-errors)
