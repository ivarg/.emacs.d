
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


(provide 'setup-cpp-mode)
