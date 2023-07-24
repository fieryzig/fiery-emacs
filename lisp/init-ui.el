;; (use-package modus-themes
;;   :ensure t
;;   :init
;;   ;; Add all your customizations prior to loading the themes
;;   (setq modus-themes-italic-constructs t
;;         modus-themes-bold-constructs t
;;         modus-themes-region '(bg-only no-extend)
;; 	modus-themes-syntax '(faint alt-syntax)
;; 	modus-themes-mode-line '(borderless 3d accented)
;; 	modus-themes-hl-line '(accented intense)
;; 	modus-themes-subtle-line-numbers t)

;;   ;; Load the theme files before enabling a theme
;;   (modus-themes-load-themes)
;;   :config
;;   ;; Load the theme of your choice:
;;   (modus-themes-load-operandi))

(use-package ef-themes
  :ensure t
  :init
  (setq ef-themes-to-toggle '(ef-summer ef-winter))

  (setq ef-themes-headings ; read the manual's entry or the doc string
	'((0 variable-pitch light 1.9)
          (1 variable-pitch light 1.8)
          (2 variable-pitch regular 1.7)
          (3 variable-pitch regular 1.6)
          (4 variable-pitch regular 1.5)
          (5 variable-pitch 1.4) ; absence of weight means `bold'
          (6 variable-pitch 1.3)
          (7 variable-pitch 1.2)
          (t variable-pitch 1.1)))

  ;; They are nil by default...
  (setq ef-themes-mixed-fonts t
	ef-themes-variable-pitch-ui t)

  ;; Read the doc string or manual for this one.  The symbols can be
  ;; combined in any order.
  (setq ef-themes-region '(intense no-extend neutral))

  ;; Disable all other themes to avoid awkward blending:
  (mapc #'disable-theme custom-enabled-themes)

  ;; Load the theme of choice:
  (load-theme 'ef-summer :no-confirm)

  ;; OR use this to load the theme which also calls `ef-themes-post-load-hook':
  (ef-themes-select 'ef-spring)

  ;; The themes we provide are recorded in the `ef-themes-dark-themes',
  ;; `ef-themes-light-themes'.

  ;; We also provide these commands, but do not assign them to any key:
  ;;
  ;; - `ef-themes-toggle'
  ;; - `ef-themes-select'
  ;; - `ef-themes-select-dark'
  ;; - `ef-themes-select-light'
  ;; - `ef-themes-load-random'
  ;; - `ef-themes-preview-colors'
  ;; - `ef-themes-preview-colors-current'
  )

(provide 'init-ui)
