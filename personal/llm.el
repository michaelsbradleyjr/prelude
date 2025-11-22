;; gptel
(require 'gptel-integrations)

(let* ((curl (or (and (eq system-type 'darwin)
                      (seq-find #'file-executable-p
                                '("/opt/homebrew/opt/curl/bin/curl" ; aarch64
                                  "/usr/local/opt/curl/bin/curl"))) ; x86_64
                 (executable-find "curl"))))
  (when curl
    (setopt gptel-use-curl curl)))

(setq gptel-model 'gpt-5)

;; mcp.el
(defconst michael/mcp-filesystem-root (expand-file-name "~/repos"))

(defvar mcp-hub-servers)
(setq mcp-hub-servers
      `(("filesystem" . (:command "npx"
                         :args ("-y" "@modelcontextprotocol/server-filesystem")
                         :roots (,michael/mcp-filesystem-root)))))

(defun michael/mcp-ensure-filesystem-root ()
  (unless (file-directory-p michael/mcp-filesystem-root)
    (make-directory michael/mcp-filesystem-root t)))

(with-eval-after-load 'mcp-hub
  (if (fboundp 'mcp-hub--start-server)
      (advice-add 'mcp-hub--start-server
                  :before
                  (lambda (server &rest _args)
                    (when (string= (car server) "filesystem")
                      (michael/mcp-ensure-filesystem-root))))
    (message "Warning: mcp-hub--start-server not found; filesystem root not ensured.")))

;; agent-shell
(require 'agent-shell)
;; assume auth is setup during a TUI run outside of Emacs
