(message "- Setting up ido")

;; ido-mode ;;;;;;;;;;;;;;;;;;;;;;;;
;; TODO: Learn this, or icicles
(require 'ido)
(require 'ido-ubiquitous)
;;(require 'ido-at-point) WINDOWS
(require 'flx-ido)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10
      ido-default-file-method 'selected-window
      ido-auto-merge-work-directories-length -1)
(ido-mode +1)
(ido-everywhere 1)
(ido-ubiquitous-mode +1)
;; smarter fuzzy matching for ido
(flx-ido-mode +1)
;; disable ido faces to see flx highlights
(setq ido-use-faces nil)

(when (boundp 'my-savefile-dir)
    (message "--  adding session handling to ido")
    (setq ido-save-directory-list-file (expand-file-name "ido.hist" my-savefile-dir)))

(provide 'setup-ido)
