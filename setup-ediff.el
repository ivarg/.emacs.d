
;; Simple diff with ediff
;; Customizable with ediff-diff-options, ensure diff(1) is ediff-diff-program
(require 'ediff)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(provide 'setup-ediff)
