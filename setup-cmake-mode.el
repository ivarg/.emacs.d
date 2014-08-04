
;; Download cmake-mode.el
(setq cmake-dir (concat user-emacs-directory "/packages/cmake"))
(unless (file-exists-p cmake-dir)
  (make-directory cmake-dir))
(unless (file-exists-p (concat cmake-dir "/cmake-mode.el"))
  (url-copy-file "http://www.cmake.org/CMakeDocs/cmake-mode.el"
                 (concat cmake-dir "/cmake-mode.el") t))

(unless (file-exists-p (concat cmake-dir "/andersl-cmake-font-lock.el"))
  (url-copy-file "https://raw.githubusercontent.com/Lindydancer/cmake-font-lock/master/andersl-cmake-font-lock.el"
                 (concat cmake-dir "/andersl-cmake-font-lock.el") t))

(add-to-list 'load-path (concat user-emacs-directory "packages/cmake"))

(autoload 'cmake-mode "cmake-mode" "CMake Mode" t)
(autoload 'andersl-cmake-font-lock-activate "andersl-cmake-font-lock" nil t)
(add-hook 'cmake-mode-hook 'andersl-cmake-font-lock-activate)

;; Add cmake listfile names to the mode list.
(setq auto-mode-alist
      (append
	   '(("CMakeLists\\.txt\\'" . cmake-mode))
	   '(("\\.cmake\\'" . cmake-mode))
	   auto-mode-alist))

;; (autoload 'cmake-mode "~/CMake/cmake-mode.el" t)


(provide 'setup-cmake-mode)
