;;; package --- init-org
;;; Commentary:
;;; Code:


(use-package org-modern
  :ensure t
  :disabled
  :custom
  ;;(org-modern-star '("◉" "○" "◈" "◇" "●")) ;
  (org-modern-star '("" "" "" "" "")) ;
  ;;(org-ellipsis " ")
  (org-ellipsis " ")
  (org-modern-checkbox '((88 . "☑") (45 . "☒") (32 . "☐")))
  (org-modern-list '((43 . "•") (45 . "•") (42 . "•")))
  :hook
  ((org-mode . org-modern-mode)
   (org-agenda-finalize . org-modern-agenda)))

(setq org-agenda-files '("~/.org-agenda/"))
(setq org-hide-emphasis-markers t)


(provide 'init-org)
;;; init-org.el ends here
