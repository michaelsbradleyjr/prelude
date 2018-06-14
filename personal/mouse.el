(require 'mouse)
(xterm-mouse-mode t)

(defun personal-scroll-down ()
  (interactive)
  (scroll-down 1))

(defun personal-scroll-up ()
  (interactive)
  (scroll-up 1))

(global-set-key [mouse-4] 'personal-scroll-down)
(global-set-key [mouse-5] 'personal-scroll-up)

(defun track-mouse (e)) 
(setq mouse-sel-mode t)
