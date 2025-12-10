(setq custom-file (make-temp-file "emacs-custom"))
(add-hook 'kill-emacs-hook
          (lambda ()
            (when (and custom-file (file-exists-p custom-file))
              (ignore-errors (delete-file custom-file)))))

(declare-function prelude-require-packages "prelude-packages")
(prelude-require-packages
 '(agent-shell
   clipetty
   gptel
   mcp
   svelte-mode
   turnip
   vterm))
