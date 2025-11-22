(setopt flycheck-highlighting-mode 'lines)

(defun michael/flycheck-extend-line-region (orig err mode)
  (let ((region (funcall orig err mode)))
    (when region
      (if (eq mode 'lines)
          (cons (car region) (min (point-max) (1+ (cdr region))))
        region))))

(advice-add 'flycheck-error-region-for-mode :around #'michael/flycheck-extend-line-region)

(defun michael/flycheck-apply-faces ()
  (custom-theme-set-faces
   'user
   '(flycheck-info ((t (:foreground "white" :background "blue" :underline nil :extend t))))
   '(flycheck-warning ((t (:foreground "blue" :background "yellow" :underline nil :extend t))))
   '(flycheck-error ((t (:foreground "yellow" :background "red" :underline nil :extend t))))))

(with-eval-after-load 'flycheck
  (michael/flycheck-apply-faces)
  (add-hook 'after-load-theme-hook #'michael/flycheck-apply-faces))
