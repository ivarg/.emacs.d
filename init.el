;;; package --- Summary
;;; Commentary:
;;; Code:

;; Emacs options
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(default-frame-alist (quote ((menu-bar-lines . 1) (tool-bar-lines . 0) (width . 110) (height . 54))))
 '(emulate-mac-finnish-keyboard-mode t))



(add-to-list 'load-path (file-name-directory load-file-name))
(require 'load-packages)
(install-if-not-present)


;;;;;;;;;;;;;;;;;;;;;;;;
;; Global key bindings

;; Try moving help command away from C-h
(global-set-key (kbd "C-<backspace>") 'help-command)


;; Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)

;; Font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)


;; Window switching. (C-x o goes to the next window)
;; Switch to other (previous?) window
(global-set-key (kbd "C-x O") (lambda ()
                                (interactive)
                                (other-window -1))) ;; back one



;; Moving down and up a paragraph
(global-set-key "\M-n" 'forward-paragraph)
(global-set-key "\M-p" 'backward-paragraph)


(global-set-key "\M-g" 'goto-line)

;; save my right pinky by making deleting easier
;; http://www.emacswiki.org/emacs/BackspaceKey
(global-set-key (kbd "C-x h") 'help-command)
;; (global-set-key "\M-?" 'mark-paragraph)
(global-set-key (kbd "M-h") 'backward-kill-word)

;; This doesn't work. Need to set through emacs customization I think...
(global-set-key (kbd "C-h") 'delete-backward-char)

;; replace buffer-menu with ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)



;; Emacs help shortcuts
;; (global-set-key (kbd "C-h C-f") 'find-function)
;; (global-set-key (kbd "C-h C-k") 'find-function-on-key)
;; (global-set-key (kbd "C-h C-v") 'find-variable)
;; (global-set-key (kbd "C-h C-l") 'find-library)


;; ;; Activate occur easily inside isearch
;; TODO: This doesn't work. Fix it!
;; (define-key isearch-mode-map (kbd "C-o")
;;   (lambda () (interactive)
;;     (let ((case-fold-search isearch-case-fold-search))
;;       (occur (if isearch-regexp
;;                  isearch-string
;;                (regexp-quote isearch-string))))))



;; Magit git stuff. TODO: Learn about magit
;; (global-set-key (kbd "C-x g") 'magit-status)


;; Ace jump stuff. TODO: Try it out
;; (global-set-key (kbd "C-c SPC") 'ace-jump-mode)
;; (global-set-key (kbd "C-x SPC") 'ace-jump-mode-pop-mark)


;; END Global key bindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;
;; Special functions

;; These nifty functions are shamelessly ripped from the Prelude packages

(defun prelude-search (query-url prompt)
  "Open the search url constructed with the QUERY-URL.
PROMPT sets the `read-string prompt."
  (browse-url
   (concat query-url
           (url-hexify-string
            (if mark-active
                (buffer-substring (region-beginning) (region-end))
              (read-string prompt))))))

(defun prelude-google ()
  "Googles a query or region if any."
  (interactive)
  (prelude-search "http://www.google.com/search?q=" "Google: "))

(defun prelude-youtube ()
  "Search YouTube with a query or region if any."
  (interactive)
  (prelude-search "http://www.youtube.com/results?search_query="
                  "Search YouTube: "))

(defun prelude-github ()
  "Search GitHub with a query or region if any."
  (interactive)
  (prelude-search "https://github.com/search?q=" "Search GitHub: "))


(defun prelude-swap-windows ()
  "If you have 2 windows, it swaps them."
  (interactive)
  (if (/= (count-windows) 2)
      (message "You need exactly 2 windows to do this.")
    (let* ((w1 (car (window-list)))
           (w2 (cadr (window-list)))
           (b1 (window-buffer w1))
           (b2 (window-buffer w2))
           (s1 (window-start w1))
           (s2 (window-start w2)))
      (set-window-buffer w1 b2)
      (set-window-buffer w2 b1)
      (set-window-start w1 s2)
      (set-window-start w2 s1)))
  (other-window 1))


(defun prelude-kill-other-buffers ()
  "Kill all buffers but the current one.
Doesn't mess with special buffers."
  (interactive)
  (-each
   (->> (buffer-list)
     (-filter #'buffer-file-name)
     (--remove (eql (current-buffer) it)))
   #'kill-buffer))


(defun prelude-create-scratch-buffer ()
  "Create a new scratch buffer."
  (interactive)
  (progn
    (switch-to-buffer
     (get-buffer-create (generate-new-buffer-name "*scratch*")))
    (emacs-lisp-mode)))



;; END Special functions
;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;
;; Editor UI settings

;; I like my font a little bigger
(set-face-attribute 'default nil :height 130)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(menu-bar-mode -1)

;; the blinking cursor is nothing, but an annoyance
(blink-cursor-mode 1)

;; disable startup screen
(setq inhibit-startup-screen t)

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; Turn on global Line Number Mode
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



;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Global editor settings


(require 'multi-term)
(global-set-key (kbd "C-x m") 'multi-term)

(require 'help-fns+)

(defvar my-savefile-dir (expand-file-name "savefile"
                                          (file-name-directory load-file-name))
  "This folder stores all the automatically generated save/history-files.")

(unless (file-exists-p my-savefile-dir)
		(make-directory my-savefile-dir))

;; How to deal with tabs
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)


;; Store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


;; Revert buffers automatically when underlying files are changed externally?
(global-auto-revert-mode t)


;; Smart pairing of parenthesis config
(require 'smartparens-config)
(setq sp-base-key-bindings 'paredit)
(setq sp-autoskip-closing-pair 'always)
(setq sp-hybrid-kill-entire-symbol nil)
(sp-use-paredit-bindings)
(show-smartparens-global-mode +1)


;; Enable annoying blink-matching-paren
(setq blink-matching-paren 1)


;; Keep modeline tidy with diminish
(require 'diminish)


;; Meaningful names for buffers with the same name
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)    ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers


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


;; Cycle between visible buffers with shortcut keys
(require 'windmove)
(global-set-key (kbd "M-;")  'windmove-left)
(global-set-key (kbd "M-'") 'windmove-right)
;; (global-set-key (kbd "C-c <up>")    'windmove-up)
;; (global-set-key (kbd "C-c <down>")  'windmove-down)


;; Highlight the current line
(global-hl-line-mode -1)


;; Highlight recent changes, such as yank or undo
(require 'volatile-highlights)
(volatile-highlights-mode t)
(diminish 'volatile-highlights-mode)


;; ido-mode ;;;;;;;;;;;;;;;;;;;;;;;;
;; TODO: Learn this, or icicles
(require 'ido)
(require 'ido-ubiquitous)
(require 'ido-at-point)
(require 'flx-ido)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10
      ido-save-directory-list-file (expand-file-name "ido.hist" my-savefile-dir)
      ido-default-file-method 'selected-window
      ido-auto-merge-work-directories-length -1)
(ido-mode +1)
(ido-everywhere 1)
(ido-ubiquitous-mode +1)
;; smarter fuzzy matching for ido
(flx-ido-mode +1)
;; disable ido faces to see flx highlights
(setq ido-use-faces nil)



;; smex, remember recently and most frequently used commands
(require 'smex)
(setq smex-save-file (expand-file-name ".smex-items" my-savefile-dir))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)


;; Spell-checking on the fly as you type with flyspell-mode
;; TODO: Read up on this!
(require 'flyspell)
;; (flyspell-mode-on)


;; Semantically select regions with expand-region
;; TODO: Try this out!
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)


;; bookmarks
;; TODO: Try this out!
(setq bookmark-default-file (expand-file-name "bookmarks" my-savefile-dir)
      bookmark-save-flag 1)


;; Enhance isearch by showing total matches and current match position with anzu
(require 'anzu)
(diminish 'anzu-mode)
(global-anzu-mode)


;; Dired stuff ;;;;;;;;;;;;;;;

;; Enable some really cool extensions like C-x C-j(dired-jump)
(require 'dired-x)

;; Delete and copy recursively
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; If there is a dired buffer displayed in the next window, use its
;; current subdir, instead of the current subdir of this dired buffer
(setq dired-dwim-target t)


;; Simple diff with ediff
;; Customizable with ediff-diff-options, ensure diff(1) is ediff-diff-program
(require 'ediff)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)


;; abbrev mode in text mode
;; (perhaps move to a 'text-mode section'...?)
(add-hook 'text-mode-hook 'abbrev-mode)


;; Re Builder -- regex syntax helper
(require 're-builder)
(setq reb-re-syntax 'string)


;; Sensible undo
(global-undo-tree-mode)
(diminish 'undo-tree-mode)


;; END Global editor settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; OSX specific stuff ;;;;;;;;;;;;;;;;;;;

(when (eq system-type 'darwin)

  ;; This OSX specific package adds environment variables to Emacs
  ;; Also depends on package exec-path-from-shell
  (require 'exec-path-from-shell)
  (exec-path-from-shell-initialize)


  ;; Switch command and option keys
  (defun command-to-meta ()
	(setq mac-command-modifier 'meta)
	(setq mac-option-modifier 'super)
	(message "Command is now bound to META and Option is bound to SUPER."))

  (defun option-to-meta ()
	(setq mac-command-modifier 'super)
	(setq mac-option-modifier 'meta)
	(message "Command is now bound to SUPER and Option is bound to META."))


  (defun prelude-swap-meta-and-super ()
	"Swap the mapping of Meta and Super.
Very useful for people using their Mac with a
Windows external keyboard from time to time."
	(interactive)
	(if (eq mac-command-modifier 'super)
		(command-to-meta)
	  (option-to-meta)))

  ;; TODO: Doesn't work. Fix it!
  ;;(define-key prelude-mode-map (kbd "C-c w") 'prelude-swap-meta-and-super)
  (command-to-meta)

  )

;; END OSX specific stuff ;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





;; Function for toggling comment of region or line
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

(global-set-key (kbd "C-q") 'comment-or-uncomment-region-or-line)


;; Unset keybinding to avoid accidently closing frame
(global-unset-key (kbd "s-w"))

;; Trying to find keybinding for simple toggling active window
(global-unset-key (kbd "M-o"))
(global-set-key (kbd "M-o") 'other-window)


;; Swapping keybindings for C-h to enable easy backspace
;; (define-key key-translation-map [?\C-h] [?\C-?])


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Go programming language stuff

(require 'auto-complete-config)
(require 'go-autocomplete)
(global-auto-complete-mode)

(add-hook 'go-mode-hook (lambda()
                          (setq tab-width 4)
                          (local-set-key (kbd "C-j") 'go-mode-insert-and-indent)
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
                          (local-set-key (kbd "C-c C-i") 'go-goto-imports)
                          (smartparens-mode)
                          ))


(add-hook 'before-save-hook 'gofmt-before-save)

;; END Go programming language stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; C++ mode stuff ;;;;;
;; move out to c++ config file

;; compile without prompting for command
(setq compilation-read-command nil)

;; .h files are C++ files
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; Tabs and linux style
(setq-default c-basic-offset 4
	      tab-width 4
	      indent-tabs-mode nil)
  
(setq c-default-style "linux"
          c-basic-offset 4)

;; End C++ stuff ;;
;;;;;;;;;;;;;;;;;;;


;; Markdown mode
(require 'markdown-mode)
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))







