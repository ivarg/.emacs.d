(require 'ace-jump-mode)

;; Allow for slow pinky release when pressing space
(define-key global-map (kbd "C-c C-SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(provide 'setup-ace-jump)
