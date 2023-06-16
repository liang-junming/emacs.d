
;;; package --- init-company
;;; Commentary:
;;; Code:
(use-package company
  :ensure t
  :init
  (setq company-idle-delay 0)
  (setq company-echo-delay 0)
  (setq company-tooltip-limit 10)
  (setq company-minimum-prefix-length 3)
  (setq company-tooltip-align-annotations t)
  (setq company-tooltip-flip-when-above t)
  (setq completion-ignore-case t) ;; for company-capf
  (setq company-dabbrev-ignore-case t)
  (setq company-dabbrev-code-ignore-case t)
  (setq company-keywords-ignore-case t)
  (setq company-backends '((company-gtags company-capf company-dabbrev-code company-keywords company-files)
                           company-dabbrev))
  ;;:bind
  ;;(("C-c C-/" . company-other-backend))
  :hook
  (prog-mode . (lambda () (setq company-backends '((company-gtags company-dabbrev-code company-keywords company-files)))))
  (emacs-lisp-mode . (lambda () (setq company-backends '((company-capf company-dabbrev-code company-keywords company-files)))))
  :config
  (global-company-mode))

(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))

(use-package flx
  :ensure t)

(use-package company-fuzzy
  :ensure t
  :hook (company-mode . company-fuzzy-mode)
  :init
  (setq company-fuzzy-sorting-backend 'flx
        company-fuzzy-prefix-on-top nil
        company-fuzzy-trigger-symbols '("." "->" "<" "\"" "'" "@")))

(provide 'init-company)
;;; init-company.el ends here
