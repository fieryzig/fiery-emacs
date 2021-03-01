;; -*- lexical-binding: t -*-

;; constant
(defconst *sys/win32*
  (eq system-type 'windows-nt))

;; custom
(defgroup fiery nil
  "fiery-emacs custom"
  :link '(url-link "https://github.com/fieryzig/fiery-emacs"))

(defcustom fiery-full-name "fieryzig"
  "user-full-name"
  :group 'fiery
  :type 'string)

(defcustom fiery-email-address "fieryzig@outlook.com"
  "user-email-address"
  :group 'fiery
  :type 'string)

(defcustom fiery-org-directory (expand-file-name "~/org/")
  "user-org-root"
  :group 'fiery
  :type 'string)

(defcustom fiery-blog-title "Fieryzig's Blog"
  "blog name"
  :group 'fiery
  :type 'string)

(defcustom fiery-blog-url "https://fieryzig.github.io"
  "blog url"
  :group 'fiery
  :type 'string)

(defcustom fiery-blog-directory "~/fiery-blog/"
  "blog local directory"
  :group 'fiery
  :type 'string)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(provide 'init-const)
