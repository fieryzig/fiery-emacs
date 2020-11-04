;;; -*- lexical-binding: t; -*-

(defconst fiery-org-todo-file
  (expand-file-name "todo.org" fiery-org-directory))

(defconst fiery-org-inbox-file
  (expand-file-name "inbox.org" fiery-org-directory))

(defconst fiery-org-note-file
  (expand-file-name "note.org" fiery-org-directory))

(defconst fiery-org-journal-file
  (expand-file-name "journal.org" fiery-org-directory))

(defconst fiery-archive-file
  (expand-file-name "archive.org" fiery-org-directory))

(use-package org
  :ensure nil
  :bind
  ("C-c a" . org-agenda)
  ("C-c l" . org-store-link)
  ("C-c c" . org-capture)
  (:map org-mode-map
        ("C-c f" . archive-done-tasks))
  :config
  (setq org-agenda-files `(,fiery-org-directory))
  (setq org-default-notes-file fiery-org-note-file)
  (setq org-archive-location fiery-archive-file)
  ;; org todo
  (setq org-todo-keywords
        '((sequence "TODO(t)" "|" "DONE(d@)")))
  (setq org-log-into-drawer t)
  (setq org-archive-subtree-save-file-p t)
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
  (setq org-capture-templates nil)
  (add-to-list 'org-capture-templates
               '("t" "Todo" entry
                 (file+headline fiery-org-todo-file "Tasks")
                 "* TODO %?\n SCHEDULED: %^t DEADLINE: %^t\n %a"))
  (add-to-list 'org-capture-templates
               '("i" "Idea" entry
                 (file+headline fiery-org-inbox-file "Ideas")
                 "* %?"))
  (add-to-list 'org-capture-templates
               '("j" "Journal" entry
                 (file+weektree fiery-org-journal-file)
                 "* %^{title} --- %U\n %?"))
  (add-to-list 'org-capture-templates
               '("n" "Note" entry
                 (file fiery-org-note-file)
                 "* %^{title} %^g\n %u\n %?"))
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
