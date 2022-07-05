;;; -*- lexical-binding: t; -*-

(use-package rust-mode
  :config
  (setq rust-format-on-save t))

(use-package cargo
  :hook ((rust-mode . cargo-minor-mode))
  :config
  (defun my/cargo-test-current ()
    (interactive)
    (setenv "RUST_LOG" "debug")
    (cargo-process-current-test))
  :bind (:map rust-mode-map
         (("C-c C-t" . my/cargo-test-current)))
  :custom ((cargo-process--command-current-test "test --color never")
           (cargo-process--enable-rust-backtrace t)
           (cargo-process--command-flags "--  --nocapture")))

(provide 'init-rust)
  
