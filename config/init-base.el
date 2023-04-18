;; 关闭工具栏
(tool-bar-mode -1)

;; 关闭滑动栏
(scroll-bar-mode -1)

;; 显示行号
(global-linum-mode 1)

;; 高亮光标所在行
(global-hl-line-mode +1)

;;pp 更改字体大小 15
(set-face-attribute 'default nil :font "Courier 15")
;; 加粗
;;(set-face-attribute 'default nil :font "Courier New Bold 18")

;; 单独设置中文字体
(set-fontset-font t 'han "Kaiti SC 18")

;; 设置光标颜色和样式
;; (setq-default cursor-type 'bar)
(setq-default cursor-type 'box)
(set-cursor-color "SeaGreen1")

;; 关闭文件自动备份
(setq make-backup-files nil)

;; 关闭锁文件
(setq create-lockfiles nil)

;; 总是加载最新的文件
(setq load-prefer-newer t)

;; 高亮匹配的括号
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 设置tab转空格
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; 设置超过一行内容换行显示
(set-default 'truncate-lines nil)
;; 部分major-mode需要单独设置
(add-hook 'magit-mode-hook (lambda () (setq truncate-lines nil)))

;; 更友好和平滑的滚动
(setq scroll-step 2
  scroll-margin 2
  hscroll-step 2
  hscroll-margin 2
  scroll-conservatively 101
  scroll-up-aggressively 0.01
  scroll-down-aggressively 0.01
  scroll-preserve-screen-position 'always)

;; 让'_'被视为单词的一部分
(add-hook 'after-change-major-mode-hook (lambda () 
                                          (modify-syntax-entry ?_ "w")))
;; "-" 同上)
(add-hook 'after-change-major-mode-hook (lambda () 
                                          (modify-syntax-entry ?- "w")))

;; 去除默认启动界面
(setq inhibit-startup-message nil)

;; 设置F12开启全屏
(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))

(global-set-key [f12] 'fullscreen)

;; 半透明
(global-set-key [(f8)] 'loop-alpha)  ;;注意这行中的F8 , 可以改成你想要的按键
(setq alpha-list '((100 100) (85 55) (65 45) (55 35)))
(defun loop-alpha ()
  (interactive)
  (let ((h (car alpha-list)))
    ((lambda (a ab)
       (set-frame-parameter (selected-frame) 'alpha (list a ab))
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))
       ) (car h) (car (cdr h)))
    (setq alpha-list (cdr (append alpha-list (list h))))
    ))

;;设置窗口位置
;;(set-frame-position (selected-frame) 0 0)
;;设置宽和高
;;(set-frame-size (selected-frame) maximized maximized)

;; 窗口最大化
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; 设置Mac meta键和super键
;;(setq mac-option-modifier 'super
;;      mac-command-modifier 'meta)

(provide 'init-base)
