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

;; 设置org标题1-8级的字体大小和颜色
(custom-set-faces
  '(org-level-1 ((t (:inherit defualt :bold t :height 1.6))))
  '(org-level-2 ((t (:inherit defualt :bold t :height 1.42))))
  '(org-level-3 ((t (:inherit defualt :bold t :height 1.36))))
  '(org-level-4 ((t (:inherit defualt :bold t :height 1.2))))
  '(org-level-5 ((t (:inherit defualt :bold t :height 1.1))))
  '(org-level-6 ((t (:inherit defualt :bold t :height 1.1))))
  '(org-level-7 ((t (:inherit defualt :bold t :height 1.1))))
  '(org-level-8 ((t (:inherit defualt :bold t :height 1.1))))
 ) ;; end custom-set-faces

(add-hook 'org-mode-hook 'org-indent-mode)


(provide 'init-org)
;;; init-org.el ends here
