;;; init-env.el --- -*- lexical-binding: t -*-

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


;;
(use-package all-the-icons)



(provide 'init-env)
