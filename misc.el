
;; Default mode for .m files is objc-mode, but we want octave
(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))

;; Store all backup and autosave files in the tmp dir
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; Direct all save files to this directory, and create it if it doesn't exist
(defvar my-savefile-dir (expand-file-name "savefile" user-emacs-directory))
(unless (file-exists-p my-savefile-dir) (make-directory my-savefile-dir))

;; Remember your location in a file when saving files with saveplace
(require 'saveplace)
(setq save-place-file (expand-file-name "saveplace" my-savefile-dir))
;; activate it for all buffers
(setq-default save-place t)

;; savehist keeps track of some history
(require 'savehist)
(setq savehist-additional-variables
      ;; search entries
      '(search ring regexp-search-ring)
      ;; save every minute
      savehist-autosave-interval 60
      ;; keep the home clean
      savehist-file (expand-file-name "savehist" my-savefile-dir))
(savehist-mode +1)

;; save recent files
(require 'recentf)
(setq recentf-save-file (expand-file-name "recentf" my-savefile-dir)
      recentf-max-saved-items 500
      recentf-max-menu-items 15)
(recentf-mode +1)


(provide 'misc)
