;;; init-utils.el --- -*- lexical-binding: t -*-

(defun kill-other-buffers()
  "Kill other buffer"
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(defun show-dashboard-and-kill-buffers()
  (interactive)
  (dashboard-refresh-buffer)
  (kill-other-buffers))

(define-prefix-command 'fiery-map)
(global-set-key (kbd "C-z") 'fiery-map)
(global-set-key (kbd "C-z d") 'dashboard-refresh-buffer)
(global-set-key (kbd "C-z z") 'dashboard-and-kill-buffers)


(provide 'init-utils)


