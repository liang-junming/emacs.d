(use-package magit
  :ensure t)

(use-package try
  :ensure t)

(use-package goto-last-change
  :ensure t
  :bind (("C-c l" . goto-last-change)))

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

(use-package avy
  :ensure t
  :init
  (setq avy-keys '(?a ?o ?e ?u ?h ?t ?n ?s))
  :bind (("C-c a c" . avy-goto-char)
	 ("C-c a C" . avy-goto-char-2)
	 ("C-c a l" . avy-goto-line)
	 ("C-c a w" . avy-goto-word-1)
	 ("C-c a W" . avy-goto-word-0)
	 ("C-c a r" . avy-resume))
  :config
  (avy-setup-default))

(use-package which-key
  :ensure t
  :custom
  (which-key-popup-type 'side-window)
  (which-key-idle-delay 0.5)
  (which-key-idle-secondary-delay 0)
  (which-key-side-window-max-height 0.4)
  :config
  (which-key-mode))

(use-package hungry-delete
  :ensure t
  :hook ('prog-mode . 'global-hungry-delete-mode))

(use-package smartparens
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook 'smartparens-strict-mode)
  (add-hook 'prog-mode-hook 'smartparens-strict-mode))


(provide 'init-tools)
