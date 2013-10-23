
;; Enable some really cool extensions like C-x C-j(dired-jump)
(require 'dired-x)

;; Delete and copy recursively
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; If there is a dired buffer displayed in the next window, use its
;; current subdir, instead of the current subdir of this dired buffer
(setq dired-dwim-target t)

(provide 'setup-dired)
