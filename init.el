;;; package --- init
;;; Commentary:
;;; Code:
;; (add-to-list 'image-types 'svg)

;;(setq gc-cons-threshold most-negative-fixnum)
(setq gc-cons-threshold 200000000)
(setq file-name-handler-alist nil)

;;(let (;; 加载的时候临时增大`gc-cons-threshold'以加速启动速度。
;;      (gc-cons-threshold most-positive-fixnum)
;;      ;; 清空避免加载远程文件的时候分析文件。
;;      (file-name-handler-alist nil))
;;  ;; Emacs配置文件内容写到下面.
;;  )

(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(package-initialize)

;; update the package metadata is the local cache is missing
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))


(add-to-list 'load-path "~/.emacs.d/config/")

(add-to-list 'custom-theme-load-path
             (file-name-as-directory "~/.emacs.d/themes"))

(setq my-lsp-client "lsp-mode")

(require 'init-base)
;;(require 'init-ivy-swiper-counsel)
(require 'init-vertico-orderless-consult)
(require 'init-dashboard)
(require 'init-icons)
;;(require 'init-corfu)
(require 'init-company)
(require 'init-tools)
(require 'init-theme)
(require 'init-lang-mode)
(require 'init-flycheck)
(require 'init-translate)
(require 'init-meow)
(require 'init-term)
(require 'init-hydra)
(if (equal my-lsp-client "lsp-mode")
    (require 'init-lsp))
(if (equal my-lsp-client "ggtags")
    (require 'init-ggtags))


;; 以下代码是emacs自动添加
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(hydra vterm cape kind-icon svg-lib meow go-translate flycheck typescript-mode js2-mode doom-modeline doom-themes smartparens hungry-delete which-key avy undo-tree goto-last-change try magit all-the-icons-dired all-the-icons dashboard embark-consult embark consult-projectile consult marginalia orderless vertico use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here
