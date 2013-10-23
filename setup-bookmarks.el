
;; bookmarks
;; TODO: Try this out!

(when (boundp 'my-savefile-dir)
    ;; (message "--  adding session handling to bookmarks")
    (setq bookmark-default-file (expand-file-name "bookmarks" my-savefile-dir)
          bookmark-save-flag 1))


(provide 'setup-bookmarks)
