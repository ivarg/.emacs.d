;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SCSS  stuff

(add-to-list 'load-path (concat user-emacs-directory "packages/scss-mode"))
(require 'scss-mode)

(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

(provide 'setup-scss-mode)
