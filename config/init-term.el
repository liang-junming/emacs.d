;;; package --- init-term
;;; Commentary:
;;; Code:
(use-package vterm
  :ensure t
  :custom
  (vterm-shell "/usr/local/bin/fish")
  :bind (:map vterm-mode-map
              ("<escape>" . vterm-copy-mode)))


(provide 'init-term)
;;; init-term.el ends here
