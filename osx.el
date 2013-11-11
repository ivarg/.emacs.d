
;; This OSX specific package adds environment variables to Emacs
;; Also depends on package exec-path-from-shell
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)


;; Switch command and option keys
(defun command-to-meta ()
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super)
  (message "Command is now bound to META and Option is bound to SUPER."))

(command-to-meta)

(provide 'osx)
