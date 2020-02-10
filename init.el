(add-to-list 'load-path "~/.emacs.d/lisp")
(load "init-gc.el")
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
(scroll-bar-mode -1)

(require 'init-package)
(require 'init-basic)
(require 'init-ivy)
