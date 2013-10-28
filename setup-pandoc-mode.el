
(add-to-list 'load-path (concat user-emacs-directory "packages/pandoc-mode"))
(require 'pandoc-mode)

(add-hook 'markdown-mode-hook 'turn-on-pandoc)
(add-hook 'pandoc-mode-hook 'pandoc-load-default-settings)

(provide 'setup-pandoc-mode)
