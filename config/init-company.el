;;; package --- init-company
;;; Commentary:
;;; Code:
(use-package company
  :ensure t
  :init
  (setq company-idle-delay 0)
  (setq company-echo-delay 0)
  (setq company-show-quick-access t)
  (setq company-tooltip-limit 10)
  (setq company-minimum-prefix-length 1)
  (setq company-tooltip-align-annotations t)
  (setq company-tooltip-flip-when-above t)
  (setq company-backends '(company-capf
                           (company-dabbrev-code company-keywords company-files)
                           company-dabbrev))
;;  :bind
;;  (("C-c C-/" . company-other-backend))
  :config
  (global-company-mode))

;;(use-package company-box
;;  :ensure t
;;  :hook (company-mode . company-box-mode))


(provide 'init-company)
;;; init-company.el ends here
