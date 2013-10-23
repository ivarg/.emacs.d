
;;;;;;;;;;;;;;;;;;;;;;
;;;; Python stuff ;;;;;
;; move out to c++ config file


;; jedi mode
(require 'jedi)
(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional
(setq jedi:get-in-function-call-delay 50)


;;;; END Python stuff ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'setup-python-mode)
