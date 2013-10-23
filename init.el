;;; package --- Summary
;;; Commentary:
;;; Code:

;; Turning off mouse interface early
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No startup screen
(setq inhibit-startup-screen t)

(add-to-list 'load-path user-emacs-directory)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "emacs-customize.el" user-emacs-directory))
(load custom-file)


(require 'misc-functions)
(require 'load-packages)
(require 'key-bindings)

(require 'ui)

(require 'defaults)
(require 'misc)

(when (eq system-type 'darwin)
  (require 'osx))

(require 'setup-multi-term)
(require 'setup-smartparens)
(require 'setup-ido)
(require 'setup-smex)
(require 'setup-flyspell)
(require 'setup-expand-region)
(require 'setup-bookmarks)
(require 'setup-anzu)
(require 'setup-dired)
(require 'setup-ediff)
(require 'setup-rebuilder)
(require 'setup-undo-tree)
(require 'setup-web-mode)
(require 'setup-yasnippet)
(require 'setup-markdown)

(require 'setup-go-mode)
(require 'setup-cpp-mode)
(require 'setup-python-mode)


;; (require 'help-fns+)

;; Helm, successor of anything
(require 'helm-config)

;; Keep modeline tidy with diminish
(require 'diminish)

;; visible mark
(require 'visible-mark)
(visible-mark-mode)

;; Highlight recent changes, such as yank or undo
;; (require 'volatile-highlights)
;; (volatile-highlights-mode t)
;; (diminish 'volatile-highlights-mode)


;; abbrev mode in text mode
;; (perhaps move to a 'text-mode section'...?)
(add-hook 'text-mode-hook 'abbrev-mode)





