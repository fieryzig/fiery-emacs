;;; init-basic.el --- -*- lexical-binding: t -*-

;; tempbuf
(require 'tempbuf)
(add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'custom-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'view-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'find-file-hooks 'turn-on-tempbuf-mode)

;; ivy - counsel - swiper
(use-package ivy
  :diminish ivy-mode counsel-mode
  :hook
  (after-init . ivy-mode)
  :custom
  (ivy-use-virtual-buffers t)
  (ivy-count-format "(%d/%d) "))
(use-package counsel)
(use-package swiper
  :bind
  (("C-s" . swiper-isearch-thing-at-point)
   ("C-r" . swiper-isearch)
   ("M-x" . counsel-M-x)
   ("C-x C-f" . counsel-find-file)
   ("M-y" . counsel-yank-pop)))

;; crux
(use-package crux
  :bind
  (("C-a" . crux-move-beginning-of-line)
   ("C-x 4 t" . crux-transpose-windows)
   ("C-x K" . crux-kill-other-buffers)
   ("C-k" . crux-smart-kill-line))
  :config
  (crux-with-region-or-buffer indent-region)
  (crux-with-region-or-buffer untabify)
  (crux-with-region-or-point-to-eol kill-ring-save)
  (defalias 'rename-file-and-buffer #'crux-rename-file-and-buffer))

;; ui-basic
(use-package which-key
  :diminish
  :hook (after-init . which-key-mode))

(use-package ace-window
  :bind
  (("C-x o" . ace-window))
  :custom
  (aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-items '((agenda . 5)
                          (projects . 5)
			              (recents . 5)))
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-center-content t)
  (dashboard-modify-heading-icons
   '((recents . "file-text")
	 (bookmarks . "book")))
  (setq dashboard-set-navigator t)
  (setq dashboard-navigator-buttons
        `(;; row 1
          ((,(all-the-icons-material "settings" :height 1.1 :v-adjust 0.0)
            "Settings"
            "Customize fiery-emacs"
            (lambda (&rest _) (customize-group-other-window 'fiery)))
           )))
  (setq dashboard-footer-messages
        '("fiery-emacs")))

(use-package doom-themes
  :ensure t
  :config
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (load-theme 'doom-one t)

  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (setq doom-themes-treemacs-theme "doom-colors")
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

;; buffer
(use-package ibuffer
  :ensure nil
  :bind
  ("C-x C-b" . ibuffer)
  :init
  (setq ibuffer-filter-group-name-face '(:inherit (font-lock-string-face bold))))
(use-package ibuffer-vc
  :hook
  (ibuffer-mode .(lambda ()
                   (ibuffer-vc-set-filter-groups-by-vc-root))))

(provide 'init-basic)
