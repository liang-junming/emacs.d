;;
;;
(use-package company
  :ensure t
  :init
  (setq company-idle-delay 0)
  (setq company-echo-delay 0)
  (setq company-show-numbers t)
  (setq company-tooltip-limit 15)
  (setq company-minimum-prefix-length 1)
  (setq company-tooltip-align-annotations t)
  (setq company-tooltip-flip-when-above t)
  :config
  (global-company-mode))

(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))


(provide 'init-company)
