
;; This Windows specific package deals with OS 

;; Set default font and size
(set-face-attribute 'default nil :font "Consolas-12.0" :height 110)
(load "server")
(unless (server-running-p)
  (server-start))
(provide 'windows)
