
;; Revert buffers automatically when underlying files are changed externally?
(global-auto-revert-mode t)

;; How to deal with tabs
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)

;; Add newlines when moving past end of file
(setq next-line-add-newlines t)


;; Meaningful names for buffers with the same name
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)    ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers



(provide 'defaults)
