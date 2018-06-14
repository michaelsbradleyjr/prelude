(elpy-enable)

(define-key elpy-mode-map (kbd "C-c ;") 'elpy-shell-send-current-statement)

(defun elpy-hook ()
  (setq tab-always-indent t))

(add-hook 'elpy-mode-hook 'elpy-hook)
