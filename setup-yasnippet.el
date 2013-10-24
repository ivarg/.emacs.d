
(require 'yasnippet)

(add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets")
;; (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets/yasnippet-golang")

(yas-global-mode 1)

;; No dropdowns please, yas
(setq yas-prompt-functions '(yas/ido-prompt yas/completing-prompt))

(provide 'setup-yasnippet)
