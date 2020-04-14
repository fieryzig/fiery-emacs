(setq lsp-keymap-prefix "s-l")

(use-package lsp-mode
  :hook (
	 (python-mode . lsp-deferred)
	 (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred)
  :init
  (setq read-process-output-max (* 1024 1024))
  (setq lsp-prefer-capf t)
  (setq lsp-idle-delay 0.500))


(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package lsp-ivy
  :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs
  :commands lsp-treemacs-errors-list)

(provide 'init-lsp)
