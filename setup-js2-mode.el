
(add-to-list 'load-path (concat user-emacs-directory "packages/js2-mode"))
(require 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(provide 'setup-js2-mode)
