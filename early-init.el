;;; early-init.el --- -*- lexical-binding: t -*-

(setq gc-cons-threshold 100000000)

(menu-bar-mode -1)
(unless (and (display-graphic-p) (eq system-type 'darwin))
  (push '(menu-bar-lines . 0) default-frame-alist))
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)


(provide 'early-init)
