;;; package --- init-tools
;;; Commentary:
;;; Code:
(use-package magit
  :ensure t)

(use-package try
  :ensure t)

(use-package goto-last-change
  :ensure t
  :bind (("C-c l" . goto-last-change)))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

;; A few more useful configurations...
(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

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
;;; init-tools.el ends here
