;;; init-utils.el --- -*- lexical-binding: t -*-

(defun kill-other-buffers()
  "Kill other buffer"
  (interactive)
  (mapc 'kill-buffer (seq-difference (buffer-list)
                                     (list (current-buffer)
                                          (get-buffer "*scratch*")))))

(defun dashboard-and-kill-buffers()
  (interactive)
  (dashboard-refresh-buffer)
  (delete-other-windows)
  (kill-other-buffers))

(define-prefix-command 'fiery-map)
(global-set-key (kbd "C-z") 'fiery-map)
(global-set-key (kbd "C-z d") 'dashboard-refresh-buffer)
(global-set-key (kbd "C-z z") 'dashboard-and-kill-buffers)


(provide 'init-utils)


