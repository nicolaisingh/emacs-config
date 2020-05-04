;;; init-hippie-expand.el --- Init configuration.

;;; Commentary:

;; This contains init configuration for the package company.

;;; Code:

(require 'company)

(setq company-lighter nil
      company-minimum-prefix-length 2
      company-idle-delay 0.3
      company-selection-wrap-around 1)

(setq company-transformers '(company-sort-by-occurrence
			     company-sort-by-backend-importance))

(eval-after-load 'company
  '(progn (define-key company-active-map (kbd "C-n") 'company-select-next)
	  (define-key company-active-map (kbd "C-p") 'company-select-previous)))

(add-hook 'after-init-hook 'global-company-mode)

(provide 'init-company)
;;; init-company.el ends here