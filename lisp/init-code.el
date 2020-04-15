(use-package python
  :ensure nil
  ;;:hook (inferior-python-mode . (lambda ()
  ;;                                (process-query-on-exit-flag
  ;;                                 (get-process "Python"))))
  ;;:init
  ;;(setq python-shell-completion-native-enable nil)

  :config
  (setq python-shell-interpreter "/usr/local/bin/python3")
  (setq lsp-clients-python-command "/usr/local/bin/pyls")
  (setq lsp-enable-snippet nil)

  (with-eval-after-load 'exec-path-from-shell
    (exec-path-from-shell-copy-env "PYTHONPATH"))

  ;;(use-package live-py-mode))
  )

(provide 'init-code)
