;;; package --- init-lsp
;;; Commentary:
;;; Code:
(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-,")
  :hook ((js2-mode . lsp-deferred)
         (js-mode . lsp-deferred)
         (typescript-mode . lsp-deferred)
         (c-mode . lsp-deferred)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package lsp-ivy
  :ensure t
  :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs
  :ensure t)

(use-package lsp-java
  :ensure t
  :config (add-hook 'java-mode-hook 'lsp))

(use-package dap-mode
  :ensure t
  :after lsp-mode :config (dap-auto-configure-mode))

;;(use-package company-lsp
;;  :ensure t
;;  :config
;;  (push 'company-lsp company-backends))

;; (use-package company-tabnine
;;  :ensure t
;;  :after 'company-mode 'company-tabnine-mode)


(provide 'init-lsp)
;;; init-lsp.el ends here
