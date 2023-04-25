(use-package js2-mode
  :ensure t
  :config
  (setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist)))

(use-package typescript-mode
  :ensure t
  :config
  (setq auto-mode-alist
      (append
       '(("\\.ts\\'" . typescript-mode))
       auto-mode-alist)))


(provide 'init-lang-mode)
