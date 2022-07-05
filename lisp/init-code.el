;;; init-code.el --- -*- lexical-binding: t -*-

(use-package rg
  :init
  (rg-enable-default-bindings))

;; quickrun
(use-package quickrun
  :init
  (quickrun-add-command
   "c++/c1z"
   '((:command . "g++")
     (:exec . ("%c -std=c++1z -Wall %o -o %e %s"
               "%e %a"))
     (:remove . ("%e")))
   :default "c++")
  :bind
  ("C-c r" . quickrun-shell))

;; Project
(use-package magit
  :if (executable-find "git")
  :bind
  (("C-x g" . magit-status)
   (:map magit-status-mode-map
	 ("M-RET" . magit-diff-visit-file-other-window)))
  :config
  (defun magit-log-follow-current-file ()
    (interactive)
    (magit-log-buffer-file t)))

(use-package projectile
  :bind
  ("C-c p" . projectile-command-map)
  :custom
  (projectile-completion-system 'ivy)
  :config
  (projectile-mode 1)
  (when (and *sys/win32*
             (executable-find "tr"))
    (setq projectile-indexing-method 'alien)))

;; LSP
;; No! I don't use lsp
(use-package citre
  :bind
  (("C-x c j" . citre-jump)
   ("C-x c k" . citre-jump-back)
   ("C-x c p" . citre-peek)
   ("C-x c a" . citre-ace-peek)
   ("C-x c u" . citre-update-this-tags-file))
  :init
  (require 'citre-config)
  (setq citre-auto-enable-citre-mode-modes '(prog-mode))
  :config
  (with-no-warnings
    (with-eval-after-load 'projectile
      (setq citre-project-root-function #'projectile-project-root))))

;; Completion
(use-package company
  :diminish
  :defines (company-dabbrev-ignore-case company-dabbrev-downcase)
  :init
  (setq company-tooltip-align-annotations t
        company-tooltip-limit 12
        company-idle-delay 0
        company-echo-delay (if (display-graphic-p) nil 0)
        company-minimum-prefix-length 1
        company-require-match nil
        company-dabbrev-ignore-case nil
        company-dabbrev-downcase nil
        company-global-modes '(not message-mode help-mode eshell-mode shell-mode)
        company-backends '((company-capf company-dabbrev-code company-keywords)
                           (company-dabbrev-code company-keywords company-files)
                           company-dabbrev))
  :bind
  ((:map company-active-map
         ("C-n" . company-select-next-or-abort)
         ("C-p" . company-select-previous-or-abort)))
  :hook (after-init . global-company-mode))
(use-package company-prescient
  :init
  (company-prescient-mode 1))

;; Some other useful tools

(use-package highlight-indent-guides
  :if (display-graphic-p)
  :diminish
  ;; Enable manually if needed, it a severe bug which potentially core-dumps Emacs
  ;; https://github.com/DarthFennec/highlight-indent-guides/issues/76
  :hook
  (prog-mode . highlight-indent-guides-mode)
  :commands (highlight-indent-guides-mode)
  :custom
  (highlight-indent-guides-method 'character)
  (highlight-indent-guides-responsive 'top)
  (highlight-indent-guides-delay 0)
  (highlight-indent-guides-auto-character-face-perc 7))

(use-package tree-sitter)
(use-package tree-sitter-langs)
(use-package tree-sitter-indent)
(add-hook 'prog-mode-hook #'tree-sitter-mode)

;; Languages
(update-to-load-path (expand-file-name "lisp/code" user-emacs-directory))

(provide 'init-code)
