;;; init-go.el --- Init configuration

;;; Commentary:

;; This contains init configuration for programming in Go/Golang.

;;; Code:

(require 'go-mode)

(defun init-go-lsp ()
  (require 'lsp-mode)
  (lsp-deferred))

(defun go-mode-my-save-buffer ()
  "Call `gofmt' before `save-buffer'."
  (interactive)
  (gofmt)
  (save-buffer))

(defun go-mode-my-custom-keys ()
  (let ((map go-mode-map))
    (define-key map (kbd "C-x C-s") #'go-mode-my-save-buffer)))

(add-hook 'go-mode-hook #'init-go-lsp)
(add-hook 'go-mode-hook #'go-mode-my-custom-keys)

(provide 'init-go)
;;; init-go.el ends here
