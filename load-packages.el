;;; package --- Load my selected packages
;;;
;;; Commentary:
;;;
;;; Code:
(require 'cl)
(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

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
    gitignore-mode
    jedi
    ido-ubiquitous
    magit
	multi-term
    multiple-cursors
    markdown-mode
    popup
    regex-tool
    smartparens
    smex
    undo-tree
    volatile-highlights
    web-mode
    multi-web-mode
    yasnippet
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
(install-if-not-present)

(provide 'load-packages)

;;; load-packages.el ends here

