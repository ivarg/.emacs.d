
(add-to-list 'load-path (concat user-emacs-directory "packages/helm"))

(require 'helm-config)

(global-set-key (kbd "C-c h") 'helm-mini)
(helm-mode 1)

(provide 'setup-helm)
