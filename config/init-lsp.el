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
         (java-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :config
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-tramp-connection "clangd")
                    :major-modes '(c-mode)
                    :remote? t
                    :server-id 'clangd-remote))
  :commands (lsp))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package lsp-treemacs
  :ensure t)

(use-package dap-mode
  :ensure t
  :after lsp-mode
  :config (dap-auto-configure-mode))

(use-package lsp-java
  :ensure t)

(use-package dap-java
  :ensure nil)

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp))))  ; or lsp-deferred


(provide 'init-lsp)
;;; init-lsp.el ends here
