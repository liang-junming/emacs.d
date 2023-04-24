(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-,")
  :hook ((js2-mode . lsp-deferred)
         (js-mode . lsp-deferred)
         (typescript-mode . lsp-deferred)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package lsp-ivy
  :ensure t
  :commands lsp-ivy-workspace-symbol)


;;(use-package company-lsp
;;  :ensure t
;;  :config
;;  (push 'company-lsp company-backends))

;; (use-package company-tabnine
;;  :ensure t
;;  :after 'company-mode 'company-tabnine-mode)


(provide 'init-lsp)
