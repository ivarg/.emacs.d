
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Go programming language stuff

(setq go-mode-dir (concat user-emacs-directory "packages/go-mode"))

;; Generate autoload file for go-mode if it does not exist
(let ((generated-autoload-file (concat go-mode-dir "/go-mode-load.el")))
  (unless (file-exists-p generated-autoload-file)
    (update-file-autoloads (concat go-mode-dir "/go-mode.el"))))

(add-to-list 'load-path go-mode-dir)
(add-to-list 'load-path (concat (getenv "GOPATH") "/src/github.com/nsf/gocode/emacs"))
(add-to-list 'load-path (concat (getenv "GOPATH") "/src/github.com/dougm/goflymake"))

(require 'go-mode-load)
(require 'go-autocomplete)
(require 'auto-complete-config)
(require 'go-flymake)
(require 'go-flycheck)

(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'go-mode-hook (lambda()
                          ;; (local-set-key (kbd "C-j") 'go-mode-insert-and-indent)
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
                          (local-set-key (kbd "C-c C-i") 'go-goto-imports)
                          (local-set-key (kbd "M-.") 'godef-jump)
                          (smartparens-mode)
                          ))

;; END Go programming language stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'setup-go-mode)
