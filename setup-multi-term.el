(require 'multi-term)
(global-set-key (kbd "C-x m") 'multi-term)

(add-hook 'term-mode-hook (lambda ()
                            (setq yas-dont-activate t)))

(provide 'setup-multi-term)
