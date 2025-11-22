;; shift the selected region right if distance is postive, left if negative
(defun shift-region (distance)
  (interactive "p")
  (unless (use-region-p)
    (user-error "No active region"))
  (let ((beg (region-beginning))
        (end (region-end))
        (mark (mark)))
    (save-excursion
      (indent-rigidly beg end distance)
      (push-mark mark t t)
      ;; tell command loop not to deactivate the mark for transient mark mode
      (setq deactivate-mark nil))))

(defun shift-right ()
  (interactive)
  (shift-region 1))

(defun shift-left ()
  (interactive)
  (shift-region -1))

(global-set-key (kbd "C-M-]") #'shift-right)
(global-set-key (kbd "C-M-[") #'shift-left)

;; consult-ripgrep
(with-eval-after-load 'prelude-vertico
  (global-set-key (kbd "C-x C-g") #'consult-ripgrep))

;; Dired
(defvar dired-mode-map)
(with-eval-after-load 'dired
  (define-key dired-mode-map
              (kbd "C-c +")
              'dired-create-empty-file))
