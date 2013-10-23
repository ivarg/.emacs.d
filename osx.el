
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

(provide 'osx)
