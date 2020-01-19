;;; init-magit.el --- Init configuration.

;;; Commentary:

;; This contains init configuration for the package magit.

;;; Code:

(require 'magit)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(setq magit-repository-directories
      '(("~/prj/emacs-config/" . 0)
	("~/AndroidStudioProjects/Ideate/". 0)
	("~/dev/masterlist-module/" . 0)))

(provide 'init-magit)
;;; init-magit.el ends here