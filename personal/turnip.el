(defvar turnip:last-pane nil)
(defun turnip-send-region-and-enter ()
  (interactive)
  (call-interactively #'turnip-send-region)
  (call-process
   "/bin/sh" nil nil nil "-c"
   (format "sleep 0.1; tmux send-keys -t %s Enter" turnip:last-pane)))
