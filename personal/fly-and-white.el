(setq prelude-flyspell nil)
;; (setq prelude-whitespace nil)

;; (global-flycheck-mode -1)

;; (setq-default flycheck-c/c++-gcc-executable "/usr/local/bin/gcc-6")
;; (setq-default flycheck-c/c++-clang-executable "/usr/local/bin/clang-omp")

(setq-default flycheck-highlighting-mode 'lines)
(set-face-attribute 'flycheck-info nil :foreground "yellow" :background "blue")
(set-face-attribute 'flycheck-warning nil :foreground "blue" :background "yellow")
(set-face-attribute 'flycheck-error nil :foreground "yellow" :background "red")

;; (eval-after-load 'flycheck
;;   '(progn
;;      (require 'flycheck-cstyle)
;;      (flycheck-cstyle-setup)
;;      ;; chain after cppcheck since this is the last checker in the upstream
;;      ;; configuration
;;      (flycheck-add-next-checker 'c/c++-cppcheck '(warning . cstyle))))

;; (add-hook 'c-mode-hook 'flycheck-mode)
