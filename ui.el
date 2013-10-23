;;;;;;;;;;;;;;;;;;;;;;;
;; Editor UI settings

;; I like my font a little bigger
;; (set-face-attribute 'default nil :height 130)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; Blinking cursor - yes? no?
(blink-cursor-mode nil)

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; Global Line Number Mode, plus formatting
(global-linum-mode 1)
(setq linum-format "%3d\u2502")

;; Mode line settings
(column-number-mode 1)
(size-indication-mode t)

;; Make the fringe (gutter) smaller
;; the argument is a width in pixels (the default is 8)
(if (fboundp 'fringe-mode)
    (fringe-mode 4))

;; Enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; More useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '("Ivars " invocation-name " @ " (:eval (if (buffer-file-name)
                                            (abbreviate-file-name (buffer-file-name))
                                          "%b"))))


;; END Editor UI settings
;;;;;;;;;;;;;;;;;;;;;;;

(provide 'ui)
