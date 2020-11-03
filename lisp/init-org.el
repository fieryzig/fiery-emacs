(use-package org
  :ensure nil
  :bind
  ("C-c a" . org-agenda)
  ("C-c l" . org-store-link)
  ("C-c c" . org-capture)
  (:map org-mode-map
        ("C-c f" . archive-done-tasks))
  :config
  (setq org-agenda-files `(,fiery-org-files))
  ;; org todo
  (setq org-todo-keywords
        '((sequence "TODO(t)" "|" "DONE(d@)")))
  (setq org-log-into-drawer t)
  (defun archive-done-tasks ()
    (interactive)
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward
              (concat "\\* " (regexp-opt org-done-keywords) " ")
              nil
              t)
        (goto-char (line-beginning-position))
        (org-archive-subtree))))
  ;; org capture

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
