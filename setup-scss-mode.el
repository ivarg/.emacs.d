;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SCSS  stuff

(add-to-list 'load-path (concat user-emacs-directory "packages/scss-mode"))
(require 'scss-mode)

(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

;; Supress compilation at save
(setq scss-compile-at-save nil)

(provide 'setup-scss-mode)
