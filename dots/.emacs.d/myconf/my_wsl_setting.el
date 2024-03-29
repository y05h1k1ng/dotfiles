;; mozc-setting
(require 'mozc-im)
(require 'mozc-popup)
;;(require 'mozc-cursor-color)
(require 'wdired)

;; frame size
(setq default-frame-alist (append (list '(width . 72) '(height . 40))))

(setq default-input-method "japanese-mozc-im")

;; popupスタイル を使用する
(setq mozc-candidate-style 'popup)

;; カーソルカラーを設定する
;;(setq mozc-cursor-color-alist '((direct        . "red")
;;                                (read-only     . "yellow")
;;                                (hiragana      . "green")
;;                                (full-katakana . "goldenrod")
;;                                (half-ascii    . "dark orchid")
;;                                (full-ascii    . "orchid")
;;                                (half-katakana . "dark goldenrod")))

;; カーソルの点滅を OFF にする
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

;; IME をトグルするキー設定
(global-set-key (kbd "M-`") 'toggle-input-method)
(define-key isearch-mode-map (kbd "M-`") 'isearch-toggle-input-method)
(define-key wdired-mode-map (kbd "M-`") 'toggle-input-method)

;; IME を無効にするキー設定
(global-set-key (kbd "C-<f1>") 'disable-input-method)
(define-key isearch-mode-map (kbd "C-<f1>") 'isearch-disable-input-method)
(define-key wdired-mode-map (kbd "C-<f1>") 'disable-input-method)

;; (global-set-key (kbd "C-j") 'disable-input-method)
;; (define-key isearch-mode-map (kbd "C-j") 'isearch-disable-input-method)
;; (define-key wdired-mode-map (kbd "C-j") 'disable-input-method)

;; IME を有効にするキー設定
(global-set-key (kbd "C-<f2>") 'enable-input-method)
(define-key isearch-mode-map (kbd "C-<f2>") 'isearch-enable-input-method)
(define-key wdired-mode-map (kbd "C-<f2>") 'enable-input-method)

;; (global-set-key (kbd "C-o") 'enable-input-method)
;; (define-key isearch-mode-map (kbd "C-o") 'isearch-enable-input-method)
;; (define-key wdired-mode-map (kbd "C-o") 'enable-input-method)

;; mozc-cursor-color を利用するための対策
;;(defvar-local mozc-im-mode nil)
;;(add-hook 'mozc-im-activate-hook (lambda () (setq mozc-im-mode t)))
;;(add-hook 'mozc-im-deactivate-hook (lambda () (setq mozc-im-mode nil)))
;;(advice-add 'mozc-cursor-color-update
;;            :around (lambda (orig-fun &rest args)
;;                      (let ((mozc-mode mozc-im-mode))
;;                        (apply orig-fun args))))

;; isearch を利用する前後で IME の状態を維持するための対策
(add-hook 'isearch-mode-hook (lambda () (setq im-state mozc-im-mode)))
(add-hook 'isearch-mode-end-hook
          (lambda ()
            (unless (eq im-state mozc-im-mode)
              (if im-state
                  (activate-input-method default-input-method)
                (deactivate-input-method)))))

;; wdired 終了時に IME を OFF にする
(advice-add 'wdired-finish-edit
            :after (lambda (&rest args)
                     (deactivate-input-method)))
