;;; package --- init-evil
;;; Commentary:
;;; Code:
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(use-package evil-org
  :ensure t
  :hook (org-mode . evil-org-mode))

(provide 'init-evil)
;;; init-evil.el ends here
