;;; early-init.el --- -*- lexical-binding: t -*-

(setq gc-cons-threshold 100000000)

(menu-bar-mode -1)
(unless (and (display-graphic-p) (eq system-type 'darwin))
  (push '(menu-bar-lines . 0) default-frame-alist))
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; edit emacs config for short
(defun edit-configs()
  (interactive)
  (find-file (concat user-emacs-directory "init.el")))

;; straight
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; use-package
(setq load-prefer-newer t)
(setq package-archives
      '(("gnu"   . "http://1.15.88.122/gnu/")
	    ("melpa" . "http://1.15.88.122/melpa/")
        ("stable-melpa" . "http://1.15.88.122/stable-melpa/")))
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

;; font & icons
(use-package nerd-icons)
(set-face-attribute 'default nil :family "FiraCode Nerd Font" :height 130)

(provide 'early-init)
