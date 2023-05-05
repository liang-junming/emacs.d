;;; package --- init-lang-mode
;;; Commentary:
;;; Code:
(use-package js2-mode
  :ensure t
  :custom
  (js2-mode-show-parse-errors nil)
  (js2-mode-show-strict-warnings nil)
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
;;; init-lang-mode.el ends here
