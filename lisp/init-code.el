;;; init-code.el --- -*- lexical-binding: t -*-

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
        company-backends '((company-capf)
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
    (setq projectile-indexing-method 'alien))
  (add-to-list 'projectile-globally-ignored-directories "node_modules"))

(use-package treemacs
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :custom
  (treemacs-collapse-dirs 3)
  (treemacs-deferred-git-apply-delay 0.5)
  (treemacs-display-in-side-window t)
  (treemacs-file-event-delay 5000)
  (treemacs-file-follow-delay 0.2)
  (treemacs-follow-after-init t)
  (treemacs-follow-recenter-distance 0.1)
  (treemacs-git-command-pipe "")
  (treemacs-goto-tag-strategy 'refetch-index)
  (treemacs-indentation 2)
  (treemacs-indentation-string " ")
  (treemacs-is-never-other-window nil)
  (treemacs-max-git-entries 5000)
  (treemacs-no-png-images nil)
  (treemacs-no-delete-other-windows t)
  (treemacs-project-follow-cleanup nil)
  (treemacs-persist-file (expand-file-name ".cache/treemacs-persist" user-emacs-directory))
  (treemacs-recenter-after-file-follow nil)
  (treemacs-recenter-after-tag-follow nil)
  (treemacs-show-cursor nil)
  (treemacs-show-hidden-files t)
  (treemacs-silent-filewatch nil)
  (treemacs-silent-refresh nil)
  (treemacs-sorting 'alphabetic-desc)
  (treemacs-space-between-root-nodes t)
  (treemacs-tag-follow-cleanup t)
  (treemacs-tag-follow-delay 1.5)
  (treemacs-width 35)
  :config
  ;; The default width and height of the icons is 22 pixels. If you are
  ;; using a Hi-DPI display, uncomment this to double the icon size.
  ;;(treemacs-resize-icons 44)
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  (treemacs-fringe-indicator-mode t)
  :bind
  (("M-0"       . treemacs-select-window)
   ("C-x t 1"   . treemacs-delete-other-windows)
   ("C-x t t"   . treemacs)
   ("C-x t B"   . treemacs-bookmark)
   ("C-x t C-t" . treemacs-find-file)
   ("C-x t M-t" . treemacs-find-tag))
  (:map treemacs-mode-map ("C-p" . treemacs-previous-line)))

(use-package treemacs-magit
  :defer t
  :after (treemacs magit))

(use-package treemacs-projectile
  :defer t
  :after (treemacs projectile))

;; Some other useful tools

;; Indent
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
;; -HighLightIndentPac
;; IndentConfig
(setq-default indent-tabs-mode nil)
(setq-default indent-line-function 'insert-tab)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default js-switch-indent-offset 4)
(c-set-offset 'comment-intro 0)
(c-set-offset 'innamespace 0)
(c-set-offset 'case-label '+)
(c-set-offset 'access-label 0)
(c-set-offset (quote cpp-macro) 0 nil)
(defun smart-electric-indent-mode ()
  "Disable 'electric-indent-mode in certain buffers and enable otherwise."
  (cond ((and (eq electric-indent-mode t)
              (member major-mode '(erc-mode text-mode)))
         (electric-indent-mode 0))
        ((eq electric-indent-mode nil) (electric-indent-mode 1))))
(add-hook 'post-command-hook #'smart-electric-indent-mode)

(add-hook 'prog-mode-hook 'show-paren-mode)

(update-to-load-path (expand-file-name "lisp/code" user-emacs-directory))
(provide 'init-code)
