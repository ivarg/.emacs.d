
(add-to-list 'load-path (concat user-emacs-directory "packages/git-modes"))
(add-to-list 'load-path (concat user-emacs-directory "packages/magit"))
(eval-after-load 'info
  '(progn (info-initialize)
          (add-to-list 'Info-directory-list (concat user-emacs-directory "packages/magit"))))

(require 'magit)

(provide 'setup-magit)
