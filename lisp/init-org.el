;;; init-org.el --- Init configuration

;;; Commentary:

;; This contains init configuration for the package org.

;;; Code:

(require 'org)

(setq org-startup-indented 1
      org-default-notes-file (concat org-directory "/notes.org")
      org-refile-targets '((nil :maxlevel . 3)
                           (org-agenda-files :maxlevel . 2)))

(setq org-capture-templates '(("c" "Just some item" entry
                               (file+headline "~/org/gtd.org" "Inbox")
                               "* %?")
                              ("D" "Distraction" item
                               (file "~/org/distraction.org")
                               "- %? %U")))

(setq org-tag-alist '(("@dev" . ?d)
                      ("@idea" . ?i)
                      ("@learn" . ?l)
                      ("@home" . ?h)))

(defun org-insert-filetags ()
  (interactive)
  (insert "#+FILETAGS: "))

(defun org-mode-my-custom-keys ()
  (define-key org-mode-map (kbd "C-c C--") #'org-ctrl-c-minus)
  (define-key org-mode-map (kbd "C-c C-8") #'org-ctrl-c-star)
  (define-key org-mode-map (kbd "C-c o f") #'org-insert-filetags))
(add-hook 'org-mode-hook #'org-mode-my-custom-keys)

(global-set-key (kbd "C-c o l") #'org-store-link)
(global-set-key (kbd "C-c o c") #'org-capture)
(global-set-key (kbd "C-c o a") #'org-agenda)
(global-set-key (kbd "C-c o b") #'org-switchb)

(provide 'init-org)
;;; init-org.el ends here
