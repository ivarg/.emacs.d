;;; package --- Load my selected packages
;;;
;;; Commentary:
;;;
;;; Code:
(require 'cl)
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

;; (defvar my-packages
;;   '(ace-jump-mode ack-and-a-half anzu dash diminish elisp-slime-nav
;;     expand-region flx-ido flycheck gist
;;     git-commit-mode gitconfig-mode gitignore-mode grizzl
;;     guru-mode helm helm-projectile ido-ubiquitous
;;     key-chord magit move-text rainbow-mode
;;     smartparens smex undo-tree
;;     volatile-highlights zenburn-theme))

(defvar my-packages
  '(
    ace-jump-mode
    ack-and-a-half
    anzu
    auto-complete
    browse-kill-ring
    diminish
    elisp-slime-nav
    exec-path-from-shell
    expand-region
    flx-ido
    flycheck
    git-commit-mode
    gitconfig-mode
    gitignore-mode
    go-mode
    go-autocomplete
    helm
    jedi
    icicles
    helm
    help-fns+
    ido-ubiquitous
    ido-at-point
    magit
	multi-term
    multiple-cursors
    markdown-mode
    popup
    regex-tool
    smartparens
    smex
    undo-tree
    visible-mark
    volatile-highlights
    yasnippet
    ;; simple-httpd
    ;; htmlize
    )
  "A list of packages to ensure are installed at launch.")



(defun install-if-not-present ()
  "Check all listed packages and reinstall if any of them are not present."
  (unless (every #'package-installed-p my-packages)
	;; check for new packages (package versions)
	(message "%s" "Emacs Prelude is now refreshing its package database...")
	(package-refresh-contents)
	(message "%s" " done.")
	;; install the missing packages
	(dolist (p my-packages)
	  (when (not (package-installed-p p))
		(package-install p)))))

(package-initialize)

(provide 'load-packages)

;;; load-packages.el ends here
