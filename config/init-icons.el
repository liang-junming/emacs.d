;;
;;
(use-package all-the-icons
  :ensure t)

(use-package all-the-icons-dired
  :ensure t
  :hook
  ('dired-mode . 'all-the-icons-dired-mode))

(use-package all-the-icons-ivy-rich
  :ensure t
  :init
  (all-the-icons-ivy-rich-mode 1))

(provide 'init-icons)
