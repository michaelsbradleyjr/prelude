(add-to-list 'auto-mode-alist '("[.]js$" . js2-mode))
(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("pages\\/.*\\.js\\'" . rjsx-mode))

;; (add-hook 'js2-mode-hook '(lambda ()
;;                             (local-set-key "\C-x\C-e" 'js-send-last-sexp)
;;                             (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
;;                             (local-set-key "\C-cb" 'js-send-buffer)
;;                             (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
;;                             (local-set-key "\C-cl" 'js-load-file-and-go)))

(add-hook 'js2-mode-hook
          (lambda ()
            (let ((map js2-mode-map))
              (define-key map (kbd "C-x C-e") 'nodejs-repl-send-last-sexp)
              (define-key map (kbd "C-c C-r") 'nodejs-repl-send-region)
              (define-key map (kbd "C-c C-l") 'nodejs-repl-load-file)
              (define-key map (kbd "C-c C-z") 'nodejs-repl-switch-to-repl))))
