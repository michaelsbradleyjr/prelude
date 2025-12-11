(declare-function turnip:normalize-and-check-target-pane "turnip")
(defun turnip-paste-region-and-enter (start end target)
  (interactive
   (append
    (if (use-region-p)
        (list (region-beginning) (region-end))
      (list (point-min) (point-max)))
    (list (call-interactively #'turnip-choose-pane))))
  (unless (called-interactively-p 'any)
    (setq target (turnip:normalize-and-check-target-pane target)))
  (let* ((pane (format "%s" target))
         (buf (format "turnip-%d" (emacs-pid)))
         (src (current-buffer)))
    (with-temp-buffer
      (insert "\e[200~")
      (insert-buffer-substring src start end)
      (insert "\e[201~\r")
      (call-process-region (point-min) (point-max) "tmux" nil nil nil "load-buffer" "-b" buf "-"))
    (call-process "tmux" nil nil nil "paste-buffer" "-r" "-d" "-b" buf "-t" pane)))
