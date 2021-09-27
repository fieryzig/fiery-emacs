;;; init-env.el --- -*- lexical-binding: t -*-

(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match
that used by the user's shell.

This is particularly useful under Mac OS X and macOS, where GUI
apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string
			  "[ \t\n]*$" "" (shell-command-to-string
					  "$SHELL --login -c 'echo $PATH'"
						    ))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(if (eq system-type 'darwin)
    (set-exec-path-from-shell-PATH))

;; basic config
(save-place-mode 1)
(setq-default create-lockfiles nil)
(setq echo-keystrokes 0.1)
(setq make-backup-files nil)
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)

;; History
(use-package recentf
  :ensure nil
  :hook (after-init . recentf-mode)
  :custom
  (recentf-auto-cleanup "07:00am")
  (recentf-max-saved-items 50)
  (recentf-exclude '((expand-file-name package-user-dir)
                     ".cache"
                     ".cask"
                     ".elfeed"
                     "bookmarks"
                     "cache"
                     "ido.*"
                     "persp-confs"
                     "recentf"
                     "undo-tree-hist"
                     "url"
                     "COMMIT_EDITMSG\\'")))
(setq-default history-length 500)

(provide 'init-env)
