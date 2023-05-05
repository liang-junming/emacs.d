;;; package --- init
;;; Commentary:
;;; Code:
(add-to-list 'image-types 'svg)

(setq gc-cons-threshold most-negative-fixnum)
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

(require 'init-base)
;;(require 'init-ivy-swiper-counsel)
(require 'init-vertico-orderless-consult)
(require 'init-dashboard)
(require 'init-icons)
(require 'init-company)
(require 'init-tools)
(require 'init-theme)
(require 'init-lsp)
(require 'init-lang-mode)
(require 'init-flycheck)
(require 'init-translate)
(require 'init-meow)


;; 以下代码是emacs自动添加

;;; init.el ends here
