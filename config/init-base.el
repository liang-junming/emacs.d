;;; package --- init-base
;;; Commentary:
;;; Code:
;; 关闭工具栏
(tool-bar-mode -1)

;; 关闭菜单栏
(menu-bar-mode -1)

;; 关闭滑动栏
(if (display-graphic-p)
    (scroll-bar-mode -1))

;; 显示行号
(global-display-line-numbers-mode 1)

;; 高亮光标所在行
(global-hl-line-mode +1)

;; 记录并回到上一次文件打开的位置
(save-place-mode 1)

;;pp 更改字体大小 15
(set-face-attribute 'default nil :font "CourierNew Nerd Font Mono 20")
;; 加粗
;;(set-face-attribute 'default nil :font "Courier New Bold 18")

;; 单独设置中文字体
;; (if (display-graphic-p)
;;     (set-fontset-font t 'han "Kaiti SC"))

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

;; 窗口大小
;;(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq default-frame-alist '((width . 120)
                            (height . 40)))

;; 窗口位置
(defun center-frame ()
  "Center the current frame on the screen."
  (interactive)
  (let* ((frame (selected-frame))
         (width (frame-pixel-width frame))
         (height (frame-pixel-height frame))
         (pos-x (/ (- (x-display-pixel-width) width) 2))
         (pos-y (/ (- (x-display-pixel-height) height) 2)))
    (set-frame-position frame pos-x pos-y)))

(add-hook 'window-setup-hook 'center-frame)


;; 设置Mac meta键和super键
(if (display-graphic-p)
    (setq mac-option-modifier 'meta
          mac-command-modifier 'super))


(provide 'init-base)
;;; init-base.el ends here
