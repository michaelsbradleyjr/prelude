(defvar flash-mode-line--active nil)
(defun flash-mode-line ()
  (unless flash-mode-line--active
    (setq flash-mode-line--active t)
    (invert-face 'mode-line)
    (run-with-timer
     0.1 nil
     (lambda ()
       (invert-face 'mode-line)
       (setq flash-mode-line--active nil)))))

(setopt visible-bell nil ring-bell-function #'flash-mode-line)
