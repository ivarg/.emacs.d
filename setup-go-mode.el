
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Go programming language stuff

;; (add-to-list 'load-path (concat user-emacs-directory "packages/go-mode"))
(add-to-list 'load-path (concat (getenv "GOROOT") "/libexec/misc/emacs"))
(add-to-list 'load-path (concat (getenv "GOROOT") "/misc/emacs"))
(add-to-list 'load-path (concat (getenv "GOPATH") "/src/github.com/nsf/gocode/emacs"))
(add-to-list 'load-path (concat (getenv "GOPATH") "/src/github.com/dougm/goflymake"))

(require 'go-mode-load)

(require 'go-autocomplete)
(require 'auto-complete-config)

(require 'go-flymake)
(require 'go-flycheck)

(global-auto-complete-mode)

(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'go-mode-hook (lambda()
                          ;; (local-set-key (kbd "C-j") 'go-mode-insert-and-indent)
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
                          (local-set-key (kbd "C-c C-i") 'go-goto-imports)
                          (local-set-key (kbd "M-.") 'godef-jump)
                          ;; (smartparens-mode)
                          ))



;; END Go programming language stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'setup-go-mode)
