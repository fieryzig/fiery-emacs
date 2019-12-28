(add-to-list 'load-path "~/.emacs.d/lisp")
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(load-theme 'tango-dark)

(require 'init-package)

(require 'init-ivy)

(use-package company
  :ensure t
  :diminish company-mode
  :hook (after-init . global-company-mode))

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (load-theme 'doom-one t)

  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (setq doom-themes-treemacs-theme "doom-colors")
  (doom-themes-treemacs-config)
  (doom-themes-org-config))
