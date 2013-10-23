
;; Unset keybinding to avoid accidently closing frame
(global-unset-key (kbd "s-w"))

;; Trying to find keybinding for simple toggling active window
(global-unset-key (kbd "M-o"))


;;;;;;;;;;;;;;;;;;;;;;;;
;; Global key bindings

(global-set-key (kbd "M-o") 'other-window)

(global-set-key (kbd "C-q") 'comment-or-uncomment-region-or-line)

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

(provide 'key-bindings)
