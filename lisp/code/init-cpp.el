;;; -*- lexical-binding: t; -*-

(use-package cc-mode
  :bind
  (:map c-mode-base-map
        ("C-c c" . compile))
  :hook
  (c-mode-common . (lambda () (c-set-style "stroustrup")))
  :init
  (setq-default c-basic-offset 4)
  :config
  (use-package modern-cpp-font-lock
    :diminish t
    :init (modern-c++-font-lock-global-mode t)))

(use-package cmake-mode
  :ensure nil)

(provide 'init-cpp)
