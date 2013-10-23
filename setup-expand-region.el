
;; Semantically select regions with expand-region
;; TODO: Try this out!
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(provide 'setup-expand-region)
