;;; package --- init-icons
;;; Commentary:
;;; Code:
(use-package all-the-icons
  :ensure t)

(use-package all-the-icons-dired
  :ensure t
  :hook
  ('dired-mode . 'all-the-icons-dired-mode))


(provide 'init-icons)
;;; init-icons.el ends here
