
;; Smart pairing of parenthesis config
(require 'smartparens-config)
(setq sp-base-key-bindings 'paredit)
(setq sp-autoskip-closing-pair 'always)
(setq sp-hybrid-kill-entire-symbol nil)
(sp-use-paredit-bindings)
(show-smartparens-global-mode +1)


;; Enable/disable annoying blink-matching-paren
(setq blink-matching-paren nil)


(provide 'setup-smartparens)
