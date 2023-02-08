(use-package typescript-mode
	     :ensure t
	     :hook
	     (typescript-mode . lsp))

(defun prettier ()
  "Run prettier on file save via pnpm script."
  (when (eq major-mode 'typescript-mode)
    (shell-command-to-string (format "prettier --plugin-search-dir . --write . %s" buffer-file-name))))

(add-hook 'after-save-hook #'prettier)
