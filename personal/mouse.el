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
(global-set-key [wheel-down] 'personal-scroll-up)
(global-set-key [wheel-up] 'personal-scroll-down)
