(use-package bespoke-themes
  :straight (:host github :repo "mclear-tools/bespoke-themes" :branch "main")
  :config
  ;; Set header line
  (setq bespoke-set-mode-line 'footer)
  ;; Set mode line height
  (setq bespoke-set-mode-line-size 3)
  ;; Show diff lines in modeline
  (setq bespoke-set-git-diff-mode-line t)
  ;; Set mode-line cleaner
  (setq bespoke-set-mode-line-cleaner t)
  ;; Set evil cursor colors
  (setq bespoke-set-evil-cursors nil)
  ;; Use mode line visual bell
  (setq bespoke-set-visual-bell t)
  ;; Set use of italics
  (setq bespoke-set-italic-comments t
        bespoke-set-italic-keywords t)
  ;; Set variable pitch
  (setq bespoke-set-variable-pitch t)
  ;; Set initial theme variant
  (setq bespoke-set-theme 'light)
  ;; Load theme
  (load-theme 'bespoke t))

;; Dim inactive windows
(use-package dimmer
  :straight (:host github :repo "gonewest818/dimmer.el")
  :hook (after-init . dimmer-mode)
  :config
  (setq dimmer-fraction 0.5)
  (setq dimmer-adjustment-mode :foreground)
  (setq dimmer-use-colorspace :rgb)
  (setq dimmer-watch-frame-focus-events nil)
  (dimmer-configure-which-key)
  (dimmer-configure-magit)
  (dimmer-configure-posframe))

(provide 'init-ui)
