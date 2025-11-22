(when (eq system-type 'darwin)
  (when-let ((gls (executable-find "gls")))
    (setopt dired-use-ls-dired t
            insert-directory-program gls
            dired-listing-switches "-aBhl --group-directories-first")))
