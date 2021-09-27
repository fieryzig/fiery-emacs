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


(provide 'early-init)
