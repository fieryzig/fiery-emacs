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

(set-exec-path-from-shell-PATH)

;; use-package
(setq package-archives
      '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
	("melpa" . "http://elpa.emacs-china.org/melpa/")))
;; (unless (bound-and-true-p package--initialized)
;;   (setq package-enable-at-startup nil)
;;   (package-initialize))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t)
  (setq use-package-expand-minimally t)
  (setq use-package-compute-statistics t)
  (setq use-package-enable-imenu-support t))
;; (use-package diminish)
;;

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


;; font & icons
(use-package all-the-icons)
(use-package cnfonts
  :after all-the-icons
  :hook (cnfonts-set-font-finish
	 . (lambda (fontsizes-list)
	     (set-fontset-font t 'unicode (font-spec :family "all-the-icons") nil 'append)
	     (set-fontset-font t 'unicode (font-spec :family "file-icons") nil 'append)
	     (set-fontset-font t 'unicode (font-spec :family "Material Icons") nil 'append)
	     (set-fontset-font t 'unicode (font-spec :family "github-octicons") nil 'append)
	     (set-fontset-font t 'unicode (font-spec :family "FontAwesome") nil 'append)
	     (set-fontset-font t 'unicode (font-spec :family "Weather Icons") nil 'append)))
  :init
  (cnfonts-enable))

(provide 'init-env)
