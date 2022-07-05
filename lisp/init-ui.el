(use-package modus-themes
  :ensure t
  :init
  ;; Add all your customizations prior to loading the themes
  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs t
        modus-themes-region '(bg-only no-extend)
	modus-themes-syntax '(faint alt-syntax)
	modus-themes-mode-line '(borderless 3d accented)
	modus-themes-hl-line '(accented intense)
	modus-themes-subtle-line-numbers t)

  ;; Load the theme files before enabling a theme
  (modus-themes-load-themes)
  :config
  ;; Load the theme of your choice:
  (modus-themes-load-operandi))

(provide 'init-ui)
