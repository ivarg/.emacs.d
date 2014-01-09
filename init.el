;;; package --- Summary
;;; Commentary:
;;; Code:


;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "emacs-customize.el" user-emacs-directory))
(load custom-file)

;; No startup screen
(setq inhibit-startup-screen t)

;; Turning off mouse interface early
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(add-to-list 'load-path user-emacs-directory)

(require 'load-packages)
(require 'misc)
(require 'key-bindings)
(require 'setup-defaults)

(when (eq system-type 'darwin)
  (require 'osx))
(when (eq system-type 'windows-nt)
  (require 'windows)
  (require 'setup-pandoc-mode))

(require 'setup-helm)
(require 'setup-ace-jump)

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
(require 'setup-scss-mode)
(require 'setup-cpp-mode)
;; (require 'setup-python-mode)


;; (require 'help-fns+)

;; Helm, successor of anything
;;(require 'helm-config) WINDOWS

;; Keep modeline tidy with diminish
(require 'diminish)

;; visible mark WINDOWS
;;(require 'visible-mark)
;;(visible-mark-mode)

;; Highlight recent changes, such as yank or undo
;; (require 'volatile-highlights)
;; (volatile-highlights-mode t)
;; (diminish 'volatile-highlights-mode)


;; abbrev mode in text mode
;; (perhaps move to a 'text-mode section'...?)
(add-hook 'text-mode-hook 'abbrev-mode)





