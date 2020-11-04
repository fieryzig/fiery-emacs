;;; -*- lexical-binding: t; -*-

(use-package cc-mode
  :ensure nil
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

(use-package ggtags
  :hook
  (c-mode-common . (lambda ()
                     (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
                       (ggtags-mode 1)))))

(provide 'init-cpp)
