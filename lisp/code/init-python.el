;;; -*- lexical-binding: t; -*-

(use-package python-mode
  :ensure nil
  :mode "\\.py\\'"
  :custom
  (python-indent-offset 4)
  (python-shell-interpreter "python3"))

(provide 'init-python)
