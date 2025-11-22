;; This will make sure that nothing in your personal directory will be
;; forced through the emacs-lisp-checkdoc flychecker. That's a great
;; checker for real modules, but these are just config files, and you
;; deserve not to get warnings all the time

;; -- Michael Bradley
;; also suppress warnings re: lexical-binding in personal/*.el

((emacs-lisp-mode
  . ((flycheck-disabled-checkers . (emacs-lisp-checkdoc))
     (lexical-binding . t))))
