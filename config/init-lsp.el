;;; package --- init-lsp
;;; Commentary:
;;; Code:
(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-,")
  :hook ((js2-mode . lsp)
         (js-mode . lsp)
         (typescript-mode . lsp)
         (c-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

;;(use-package lsp-treemacs
;;  :ensure t)
;;
;;(use-package lsp-java
;;  :ensure t)

;;(use-package lsp-ivy
;;  :ensure t
;;  :commands lsp-ivy-workspace-symbol)

(provide 'init-lsp)
;;; init-lsp.el ends here
