;;; init-ediff.el --- Init configuration

;;; Commentary:

;; This contains init configuration for ediff.

;;; Code:

(defvar ediff-temp-buffer-a "*diff-a*")
(defvar ediff-temp-buffer-b "*diff-b*")

(setq ediff-window-setup-function 'ediff-setup-windows-plain
      ediff-split-window-function 'split-window-horizontally)

(defvar ediff-previous-window-config nil
  "Contains the previous window configuration, before ediff was ran.")

(defun ediff-restore-previous-window-config ()
  "Restore the previous window configuration stored in `ediff-previous-window-config'."
  (set-window-configuration ediff-previous-window-config)
  (kill-buffer ediff-temp-buffer-a)
  (kill-buffer ediff-temp-buffer-b))

(defun ediff-save-windows-config ()
  (setq ediff-previous-window-config (current-window-configuration)))

(add-hook 'ediff-before-setup-hook #'ediff-save-windows-config)
(add-hook 'ediff-quit-hook #'ediff-restore-previous-window-config)

(defun ediff-last-2-kills ()
  "Run ediff on the last 2 kills."
  (interactive)
  (let ((text-a (current-kill 1 t))
        (text-b (current-kill 0 t))
        (a (generate-new-buffer (generate-new-buffer-name ediff-temp-buffer-a)))
        (b (generate-new-buffer (generate-new-buffer-name ediff-temp-buffer-b))))
    (with-current-buffer a (insert text-a))
    (with-current-buffer b (insert text-b))
    (ediff-buffers a b)))

(global-set-key (kbd "C-c d k") #'ediff-last-2-kills)
(define-key dired-mode-map (kbd "C-c d d") #'ediff-dired-diff)

(provide 'init-ediff)
;;; init-ediff.el ends here
