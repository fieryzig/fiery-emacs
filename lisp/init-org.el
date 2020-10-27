(use-package org
  :ensure nil
  :bind
  ("C-c a" . org-agenda)
  ("C-c l" . org-store-link)
  ("C-c c" . org-capture)
  :config
  (setq org-agenda-files `(,fiery-org-files))
  ;; UI
  (unless (eq system-type 'windows-nt)
    (use-package org-bullets
      :hook
      (org-mode . org-bullets-mode))
    (use-package org-fancy-priorities
      :hook
      (org-mode . org-fancy-priorities-mode)))

  ;; enhance
  (use-package org-rich-yank
    :bind
    (:map org-mode-map
          ("C-M-y" . org-rich-yank)))

  (use-package toc-org
    :hook (org-mode . toc-org-mode))

  (use-package org-preview-html
    :diminish t))


(provide 'init-org)
