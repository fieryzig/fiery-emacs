;;; init.el --- -*- lexical-binding: t -*-

(cond ((version< emacs-version "26.1")
       (warn "Emacs 26.1 or above is required!")))

;; LoadPath
(defun update-to-load-path (folder)
  "Update FOLDER and its subdirectories to `load-path'."
  (let ((base folder))
    (unless (member base load-path)
      (add-to-list 'load-path base))
    (dolist (f (directory-files base))
      (let ((name (concat base "/" f)))
        (when (and (file-directory-p name)
                   (not (equal f ".."))
                   (not (equal f ".")))
          (unless (member base load-path)
            (add-to-list 'load-path name)))))))

(update-to-load-path (expand-file-name "lisp" user-emacs-directory))
;; -LoadPath

;; Basic configs(edit, ui, etc.)
(require 'init-const)
(require 'init-env)
(require 'init-basic)

;; Code
(require 'init-code)
(require 'init-python)
(require 'init-cpp)
(require 'init-markdown)

;; Org
(require 'init-org)
;; Misc

;; Custom
