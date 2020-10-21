;;; init-basic.el --- -*- lexical-binding: t -*-

;; ivy - counsel - swiper
(use-package counsel
  :diminish ivy-mode counsel-mode
  :bind
  (("C-s" . swiper-isearch)
   ("C-r" . swiper-isearch-backward))
  :hook
  ((after-init . ivy-mode)(ivy-mode . counsel-mode))
  :custom
  (enable-recursive-minibuffers t)
  (ivy-use-virtual-buffers t)
  (ivy-use-selectable-prompt t)
  (ivy-height 10)
  (ivy-fixed-height-minibuffer t)
  (ivy-on-del-error-function nil)
  (ivy-count-format "[%d/%d]")
  (ivy-initial-inputs-alist nil)
  :init
  (with-no-warnings
    (defun my-ivy-format-function-arrow(cands)
      "Transform CANDS into a string for minibuffer."
      (ivy--format-function-generic
       (lambda (str)
	 (concat (if (display-graphic-p)
		     (all-the-icons-octicon
		      "chevron-right"
		      :height 0.8 :v-adjust -0.05)
		   ">")
		 (propertize " " 'display `(space :align-to 2))
		 (ivy--add-face str 'ivy-current-match)))
       (lambda (str)
	 (concat (propertize " " 'display `(space :align-to 2)) str))
       cands
       "\n"))
    (setq ivy-format-functions-alist '((counsel-describe-face . counsel--faces-format-function)
				       (t . my-ivy-format-function-arrow)))))

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

(use-package windmove
  :ensure nil
  :hook (after-init . windmove-default-keybindings))

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents . 5)
			  (bookmarks . 5)
			  (agenda . 5)))
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (dashboard-modify-heading-icons '((recents . "file-text")
				    (bookmarks . "book")))
  (setq dashboard-set-navigator t))

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


(provide 'init-basic)
