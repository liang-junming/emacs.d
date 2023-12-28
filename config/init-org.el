;;; package --- init-org
;;; Commentary:
;;; Code:


(use-package org-modern
  :ensure t
  :custom
  (org-modern-star '("◉" "○" "◈" "◇" "●")) ;
  (org-ellipsis " ")
  (org-modern-checkbox '((88 . "☑") (45 . "☒") (32 . "☐")))
  :hook
  ((org-mode . org-modern-mode)
   (org-agenda-finalize . org-modern-agenda)))

(setq org-agenda-files '("~/.org-agenda/"))
(setq org-hide-emphasis-markers t)


(provide 'init-org)
;;; init-org.el ends here
