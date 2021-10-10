;;; bespoke-themes-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "bespoke-modeline" "bespoke-modeline.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from bespoke-modeline.el

(autoload 'bespoke-themes-visual-bell-fn "bespoke-modeline" "\
Blink the mode-line red briefly. Set `ring-bell-function' to this to use it." nil nil)

(autoload 'bespoke-themes-visual-bell-config "bespoke-modeline" "\
Enable flashing the mode-line on error." nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "bespoke-modeline" '("bespoke" "buffer-menu-mode-header-line" "shorten-directory" "vc-project-branch")))

;;;***

;;;### (autoloads nil "bespoke-theme" "bespoke-theme.el" (0 0 0 0))
;;; Generated autoloads from bespoke-theme.el

(when (and (boundp 'custom-theme-load-path) load-file-name) (add-to-list 'custom-theme-load-path (file-name-as-directory (file-name-directory load-file-name))))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "bespoke-theme" '("--l/d" "bespoke")))

;;;***

;;;### (autoloads nil "bespoke-themes" "bespoke-themes.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from bespoke-themes.el

(autoload 'bespoke/toggle-theme "bespoke-themes" "\
Toggle between dark and light variants" t nil)

(autoload 'bespoke/light-theme "bespoke-themes" "\
Set light variant of bespoke-theme" t nil)

(autoload 'bespoke/dark-theme "bespoke-themes" "\
Set dark variant of bespoke-theme" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "bespoke-themes" '("bespoke-")))

;;;***

(provide 'bespoke-themes-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; bespoke-themes-autoloads.el ends here
