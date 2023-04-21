(use-package magit
  :ensure t)

(use-package try
  :ensure t)

(use-package goto-last-change
  :ensure t
  :bind (("C-c l" . goto-last-change)))

(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll 1)
  :config
  (evil-mode 1))

(use-package undo-tree
  :ensure t
  :hook (after-init . global-undo-tree-mode)
  :init
  (setq undo-tree-visualizer-timestamps t
        undo-tree-enable-undo-in-region nil
        undo-tree-auto-save-history nil)

  ;; HACK: keep the diff window
  (with-no-warnings
    (make-variable-buffer-local 'undo-tree-visualizer-diff)
    (setq-default undo-tree-visualizer-diff t)))


(provide 'init-tools)
