(add-to-list 'load-path "~/.emacs.d/lisp")
(load "init-gc.el")
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(require 'init-package)

(use-package lsp-python-ms
  :ensure t
  :hook (python-mode . (lambda ()
			 (require 'lsp-python-ms)
			 (lsp-deferred))))
(require 'init-lsp)
(require 'init-basic)
(require 'init-ivy)
(put 'dired-find-alternate-file 'disabled nil)
