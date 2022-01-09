(defun michael-compile-finish (buffer outstr)
  (unless (string-match "finished" outstr)
    (switch-to-buffer-other-window buffer))
  t)

(setq compilation-finish-functions 'michael-compile-finish)

(defadvice compilation-start
    (around inhibit-display
            (command &optional mode name-function highlight-regexp))
  (if (not (string-match "^\\(find\\|grep\\)" command))
      (cl-letf ((display-buffer   #'ignore)
                (set-window-point #'ignoreco)
                (goto-char        #'ignore))
        (save-window-excursion
          ad-do-it))
    ad-do-it))

(ad-activate 'compilation-start)

(provide 'only-display-compile-on-error)
