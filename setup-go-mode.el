
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Go programming language stuff

;; go-mode
(setq go-mode-dir (concat user-emacs-directory "packages/go-mode"))
;; Generate autoload file for go-mode if it does not exist
(let ((generated-autoload-file (concat go-mode-dir "/go-mode-load.el")))
  (unless (file-exists-p generated-autoload-file)
    (update-file-autoloads (concat go-mode-dir "/go-mode.el"))))

(add-to-list 'load-path go-mode-dir)
(require 'go-mode-load)


;; gocode and autocompletion with company-mode
(add-to-list 'load-path (concat (getenv "GOPATH") "/src/github.com/nsf/gocode/emacs-company"))
(require 'company)
(require 'company-go)
(setq company-idle-delay nil)

(custom-set-faces
 '(company-preview
   ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common
   ((t (:inherit company-preview))))
 '(company-tooltip
   ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-selection
   ((t (:background "steelblue" :foreground "white"))))
 '(company-tooltip-common
   ((((type x)) (:inherit company-tooltip :weight bold))
    (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection
   ((((type x)) (:inherit company-tooltip-selection :weight bold))
    (t (:inherit company-tooltip-selection)))))

(add-hook 'go-mode-hook (lambda()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (local-set-key (kbd "M-SPC") 'company-complete)
                          (company-mode)))


;; go-eldoc
(add-to-list 'load-path (concat user-emacs-directory "packages/emacs-go-eldoc"))
(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)
(set-face-attribute 'eldoc-highlight-function-argument nil :underline t)

;; Goipmorts
(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda()
                          ;; (local-set-key (kbd "C-j") 'go-mode-insert-and-indent)
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
                          (local-set-key (kbd "C-c C-i") 'go-goto-imports)
                          (local-set-key (kbd "M-.") 'godef-jump)
                          (smartparens-mode)
                          ))

;; go-flymake
(add-to-list 'load-path (concat (getenv "GOPATH") "/src/github.com/dougm/goflymake"))
(require 'go-flymake)
(require 'go-flycheck)

;; Make the flymake error message appear in minibuffer
(custom-set-variables
     '(help-at-pt-timer-delay 0.5)
     '(help-at-pt-display-when-idle '(flymake-overlay)))


;; Go Oracle
(load (concat (getenv "GOPATH") "/src/code.google.com/p/go.tools/cmd/oracle/oracle.el"))
(add-hook 'go-mode-hook 'go-oracle-mode)

;; END Go programming language stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'setup-go-mode)
