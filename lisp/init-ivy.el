(use-package counsel
  :ensure t
  :diminish ivy-mode counsel-mode
  :bind (("C-s" . swiper-isearch)
	 ("C-r" . swiper-isearch-backward)
	 ("s-f" . swiper)
	 ("C-S-s" . swiper-all)

	 ("C-c C-r" . ivy-resume)
	 ("C-c v p" . ivy-push-view)
	 ("C-c v o" . ivy-pop-view)
	 ("C-c v ." . ivy-switch-view)

	 :map counsel-mode-map
	 ([remap swiper] . counsel-grep-or-swiper)
	 ([remap swiper-backward] . counsel-grep-or-swiper-backward)
	 ([remap dired] . counsel-dired)
	 ([remap set-variable] . counsel-set-variable)
	 ([remap insert-char] . counsel-unicode-char)

	 ("C-x C-r" . counsel-buffer-or-recentf)
	 ("C-x j" . counsel-mark-ring)
	 ("C-h F" . counsel-describe-face)

	 ("C-c L" . counsel-load-library)
	 ("C-c P" . counsel-package)
	 ("C-c f" . counsel-find-library)
	 ("C-c g" . counsel-grep)
	 ("C-c h" . counsel-command-history)
	 ("C-c i" . counsel-git)
	 ("C-c j" . counsel-git-grep)
	 ("C-c l" . counsel-locate)
	 ("C-c r" . counsel-rg)
	 ("C-c z" . counsel-fzf)

	 ("C-c c F" . counsel-faces)
	 ("C-c c L" . counsel-load-library)
	 ("C-c c P" . counsel-package)
	 ("C-c c a" . counsel-apropos)
	 ("C-c c e" . counsel-colors-emacs)
	 ("C-c c f" . counsel-find-library)
	 ("C-c c g" . counsel-grep)
	 ("C-c c h" . counsel-command-history)
	 ("C-c c i" . counsel-git)
	 ("C-c c j" . counsel-git-grep)
	 ("C-c c l" . counsel-locate)
	 ("C-c c m" . counsel-minibuffer-history)
	 ("C-c c o" . counsel-outline)
	 ("C-c c p" . counsel-pt)
	 ("C-c c r" . counsel-rg)
	 ("C-c c s" . counsel-ag)
	 ("C-c c t" . counsel-load-theme)
	 ("C-c c u" . counsel-unicode-char)
	 ("C-c c w" . counsel-colors-web)
	 ("C-c c z" . counsel-fzf)

	 :map ivy-minibuffer-map
	 ("C-w" . ivy-yank-word)

	 :map counsel-find-file-map
	 ("C-h" . counsel-up-directory)

	 :map swiper-map
	 ("M-s" . swiper-isearch-toggle)
	 ("M-%" . swiper-query-replace)

	 :map isearch-mode-map
	 ("M-s" . swiper-isearch-toggle))
  :hook ((after-init . ivy-mode)
	 (ivy-mode . counsel-mode))
  
  :init
  (setq enable-recursive-minibuffers t) ; Allow commands in minibuffers
  (setq ivy-use-selectable-prompt t
	ivy-use-virtual-buffers t    ; Enable bookmarks and recentf
	ivy-height 10
	ivy-fixed-height-minibuffer t
	ivy-count-format "(%d/%d) "
	ivy-on-del-error-function nil
	ivy-initial-inputs-alist nil)
  (with-no-warnings
    (defun my-ivy-format-function-arrow (cands)
      "Transform CANDS into a string for minibuffer."
      (ivy--format-function-generic
       (lambda (str)
	 (concat (if (display-graphic-p)
		     (all-the-icons-octicon "chevron-right" :height 0.8 :v-adjust -0.05)
		   ">")
		 (propertize " " 'display `(space :align-to 2))
		 (ivy--add-face str 'ivy-current-match)))
       (lambda (str)
	 (concat (propertize " " 'display `(space :align-to 2)) str))
       cands
       "\n"))
    (setq ivy-format-functions-alist '((counsel-describe-face . counsel--faces-format-function)
				       (t . my-ivy-format-function-arrow)))))

(provide 'init-ivy)
