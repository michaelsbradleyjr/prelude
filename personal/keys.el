(defadvice terminal-init-xterm (after select-shift-up activate)
  (define-key input-decode-map "\e[1;2A" [S-up]))
(defadvice terminal-init-screen (after select-shift-up activate)
  (define-key input-decode-map "\e[1;2A" [S-up]))
(defadvice terminal-init-xterm (after select-shift-down activate)
  (define-key input-decode-map "\e[1;2B" [S-down]))
(defadvice terminal-init-screen (after select-shift-down activate)
  (define-key input-decode-map "\e[1;2B" [S-down]))

;; at startup disable key-chord-mode since (ideally) evil-mode will be used more
;; and more frequently, but continue to define some helpful chords for when I'm
;; not in evil-mode and wish to make use of key-chord-mode
;; (key-chord-mode 0)

(defun personal-reset-terminal ()
  (interactive)
  (term-reset-terminal))

;; (key-chord-define-global "kk" 'personal-reset-terminal)
;; (key-chord-define-global "hj" 'ace-jump-line-mode)
;; (key-chord-define-global "jl" nil)
;; (key-chord-define-global ",." 'org-mac-message-insert-selected)
;; (key-chord-define-global "qp" 'prelude-create-scratch-buffer)

;; (defun personal-toggle-key-chord-mode ()
;;   "Toggle key-chord-mode globally."
;;   (interactive)
;;   (if key-chord-mode
;;       (key-chord-mode 0)
;;     (key-chord-mode 1)))

;; (global-set-key (kbd "C-c C-j") 'personal-toggle-key-chord-mode)
(global-set-key (kbd "C-x M-a") 'auto-complete-mode)
(global-set-key (kbd "C-@") 'set-mark-command)
(global-set-key (kbd "M-#") 'easy-mark)
(global-set-key (kbd "C-x M-n") 'new-frame)
(global-set-key (kbd "C-c C-k") 'helm-show-kill-ring)
(global-set-key (kbd "C-M-w") 'sp-copy-sexp)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c M-;") 'org-mu4e-compose-org-mode)
(global-set-key (kbd "C-c M-:") 'mu4e-compose-mode)
(global-set-key (kbd "C-c M-i") 'ibuffer-list-buffers)

;; scroll buffer instead of point
(global-set-key "\M-n" "\C-u1\C-v")
(global-set-key "\M-p" "\C-u1\M-v")

;; show buffer with recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-saved-items 500)
(setq recentf-max-menu-items 60)
(global-set-key [(meta f12)] 'recentf-open-files)
(global-set-key [(meta +)] 'recentf-open-files)

(global-unset-key (kbd "s-q"))
(global-unset-key (kbd "s-w"))

;; Shift the selected region right if distance is postive, left if
;; negative
(defun shift-region (distance)
  (let ((mark (mark)))
    (save-excursion
      (indent-rigidly (region-beginning) (region-end) distance)
      (push-mark mark t t)
      ;; Tell the command loop not to deactivate the mark
      ;; for transient mark mode
      (setq deactivate-mark nil))))

(defun shift-right ()
  (interactive)
  (shift-region 1))

(defun shift-left ()
  (interactive)
  (shift-region -1))

;; Bind (shift-right) and (shift-left) function to your favorite keys. I use
;; the following so that Ctrl-Shift-Right Arrow moves selected text one
;; column to the right, Ctrl-Shift-Left Arrow moves selected text one
;; column to the left:

(global-set-key [(control meta \])] 'shift-right)
(global-set-key [(control meta \[)] 'shift-left)
