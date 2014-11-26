
;; Download cmake-mode.el
(setq cmake-dir (concat user-emacs-directory "/packages/cmake-mode"))

(unless (file-exists-p (concat user-emacs-directory "/andersl-cmake-font-lock.el"))
  (url-copy-file "https://raw.githubusercontent.com/Lindydancer/cmake-font-lock/master/andersl-cmake-font-lock.el"
                 (concat user-emacs-directory "/andersl-cmake-font-lock.el") t))

(add-to-list 'load-path cmake-dir)
(require 'cmake-mode)

(autoload 'andersl-cmake-font-lock-activate "andersl-cmake-font-lock" nil t)
(add-hook 'cmake-mode-hook 'andersl-cmake-font-lock-activate)

;; Add cmake listfile names to the mode list.
(setq auto-mode-alist
      (append
	   '(("CMakeLists\\.txt\\'" . cmake-mode))
	   '(("\\.cmake\\'" . cmake-mode))
	   auto-mode-alist))

(provide 'setup-cmake-mode)
