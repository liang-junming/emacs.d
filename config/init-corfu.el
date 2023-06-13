;;; package --- init-corfu
;;; Commentary:
;;; Code:
(use-package corfu
  :ensure t
  :custom
  ;; (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  (corfu-auto t)                 ;; Enable auto completion
  (corfu-auto-delay 0)
  (corfu-auto-prefix 2)
  ;; (corfu-separator ?\s)          ;; Orderless field separator
  (corfu-quit-at-boundary 'separator)   ;; Quit at boundary if no `corfu-separator' has been inserted
  (corfu-quit-no-match 'separator)      ;; Only stay alive if there is no match and `corfu-separator' has been inserted
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin
  ;;(corfu-separator ?_) ;; Set to orderless separator, if not using space
  :bind
  ;; Another key binding can be used, such as S-SPC.
  (:map corfu-map (("TAB" . corfu-complete)))
  :init
  (global-corfu-mode)
  :hook
  (corfu-mode . corfu-history-mode))

(use-package kind-icon
  :ensure t
  :after corfu
  :custom
  (kind-icon-default-face 'corfu-default) ; to compute blended backgrounds correctly
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(use-package cape
  :ensure t
  ;; Bind dedicated completion commands
  ;; Alternative prefix keys: C-c p, M-p, M-+, ...
  :bind (("C-c p p" . completion-at-point) ;; capf
         ("C-c p t" . complete-tag)        ;; etags
         ("C-c p d" . cape-dabbrev)        ;; or dabbrev-completion
         ("C-c p h" . cape-history)
         ("C-c p f" . cape-file)
         ("C-c p k" . cape-keyword)
         ("C-c p s" . cape-symbol)
         ("C-c p a" . cape-abbrev)
         ("C-c p l" . cape-line)
         ("C-c p w" . cape-dict)
         ("C-c p \\" . cape-tex)
         ("C-c p _" . cape-tex)
         ("C-c p ^" . cape-tex)
         ("C-c p &" . cape-sgml)
         ("C-c p r" . cape-rfc1345))
  :init
  ;; Add `completion-at-point-functions', used by `completion-at-point'.
  ;; NOTE: The order matters!
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-elisp-block)
  ;;(add-to-list 'completion-at-point-functions #'cape-history)
  ;;(add-to-list 'completion-at-point-functions #'cape-keyword)
  ;;(add-to-list 'completion-at-point-functions #'cape-tex)
  ;;(add-to-list 'completion-at-point-functions #'cape-sgml)
  ;;(add-to-list 'completion-at-point-functions #'cape-rfc1345)
  ;;(add-to-list 'completion-at-point-functions #'cape-abbrev)
  ;;(add-to-list 'completion-at-point-functions #'cape-dict)
  ;;(add-to-list 'completion-at-point-functions #'cape-symbol)
  ;;(add-to-list 'completion-at-point-functions #'cape-line)
  :hook
  (c-mode . (lambda () (setq completion-at-point-functions
                             (list (cape-super-capf #'ggtags-completion-at-point #'cape-dabbrev #'cape-keyword) #'cape-file #'cape-dict))))
  (js2-mode . (lambda () (setq completion-at-point-functions
                             (list (cape-super-capf #'ggtags-completion-at-point #'cape-dabbrev #'cape-keyword) #'cape-file #'cape-dict))))
  (emacs-lisp-mode . (lambda () (setq completion-at-point-functions
                                      (list (cape-super-capf #'elisp-completion-at-point #'cape-dabbrev #'cape-keyword) #'cape-file #'cape-dict))))
  (text-mode . (lambda () (setq completion-at-point-functions
                                (list #'cape-dabbrev #'cape-file #'cape-dict))))
)


(provide 'init-corfu)
;;; init-corfu.el ends here
