(use-package ivy
  :ensure t
  :init
  ;; recentf bookmark 加入buffer list
  (setq ivy-use-virtual-buffers t
	;; 显示当前选中 index 和 count 值
	ivy-count-format "(%d/%d) "
	;; 输入行可选中
	ivy-use-selectable-prompt t

	;; 设置查找算法
	;; ivy--regex-plus:
	;; "foo bar" like "foo.*bar", "foo  bar" like "foo .*bar"(注意后面多了一个空格)
	;; ivy--regex-ignore-order:
	;; 忽略顺序 "foo bar" = "bar foo"
	;; ivy--regex-fuzzy:
	;; 它会在每个字符后面都插入.*, 如 "abc" = "a.*b.*c.*"

	;; t => ivy  swiper => swiper
	;; 还可以设置counsel-ag counsel-grep等命令的查找算法
	ivy-re-builders-alist '((t . ivy--regex-ignore-order)
				(swiper . ivy--regex-ignore-order)))
  ;; 默认快捷键
  ;; "M-o" -> ivy-dispatching-done 列出可操作的action
  :bind (("C-x b" . ivy-switch-buffer)
	 ;; 功能尚不明确
	 ("C-c v" . ivy-push-view)
	 ;; 功能尚不明确
	 ("C-c V" . ivy-pop-view)
	 ;; 恢复上一次操作
	 ("C-c C-r" . ivy-resume)
	 ;; 停止匹配并将当前的匹配项列到一个新的buffer中
	 ("C-c C-o". ivy-occur)
	 ;; 标记每条list 可供快速选中
	 ("C--" . ivy-avy)
	 ;; 清空输入，可将当前结果作为候选继续输入关键字过滤，并且可连续使用，一步步缩小范围
	 ("C-c SPC" . ivy-restrict-to-matches))

  :config
  (ivy-mode 1))

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)))

(use-package counsel
  :ensure t
  ;; based interface to standard commands
  :bind (("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)
	 ("M-y" . counsel-yank-pop)
	 ("<f1> f" . counsel-describe-function)
	 ("<f1> v" . counsel-describe-variable)
	 ("<f1> l" . counsel-find-library)
	 ("<f2> i" . counsel-info-lookup-symbol)
	 ("<f2> u" . counsel-unicode-char)
	 ("<f2> j" . counsel-set-variable)
	 ;; based interface to shell and system tools
	 ("C-c c" . counsel-compile)
	 ("C-c g" . counsel-git)
	 ("C-c j" . counsel-git-grep)
	 ("C-c L" . counsel-git-log)
	 ("C-c k" . counsel-rg)
	 ("C-c m" . counsel-linux-app)
	 ("C-c n" . counsel-fzf)
	 ("C-x l" . counsel-locate)
	 ("C-c J" . counsel-file-jump)
	 ("C-S-o" . counsel-rhythmbox)
	 ("C-c w" . counsel-wmctrl)
	 ;; other commands
	 ("C-c b" . counsel-bookmark)
	 ("C-c d" . counsel-descbinds)
	 ("C-c g" . counsel-git)
	 ("C-c o" . counsel-outline)
	 ("C-c t" . counsel-load-theme)
	 ("C-c F" . counsel-org-file)))

(use-package counsel-projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode 1)
  (counsel-projectile-mode 1))

;; 让ivy显示的内容更丰富
(use-package ivy-rich
  :ensure t
  :config
  (ivy-rich-mode 1)
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
  '(ivy-switch-buffer
    (:columns
     ((ivy-switch-buffer-transformer (:width 30))    ; add face by the original transformer
      (ivy-rich-switch-buffer-size (:width 7))  ; return buffer size
      (ivy-rich-switch-buffer-indicators (:width 4 :face error :align right))  ; return buffer indicator
      (ivy-rich-switch-buffer-major-mode (:width 12 :face warning))            ; return major mode info
      (ivy-rich-switch-buffer-project (:width 15 :face success))               ; return project name `projectile'
      (ivy-rich-switch-buffer-path (:width (lambda (x) (ivy-rich-switch-buffer-shorten-path x (ivy-rich-minibuffer-width 0.3))))))  ; return file path relative to project root or `default-directory' if project is nil
     :predicate
     (lambda (cand) (get-buffer cand)))
    counsel-find-file
    (:columns
     ((ivy-read-file-transformer)
      (ivy-rich-counsel-find-file-truename (:face font-lock-doc-face))))
    counsel-M-x
    (:columns
     ((counsel-M-x-transformer (:width 40))
      (ivy-rich-counsel-function-docstring (:face font-lock-doc-face)))) ; return docstring of the command
    counsel-describe-function
    (:columns
     ((counsel-describe-function-transformer (:width 40))
      (ivy-rich-counsel-function-docstring (:face font-lock-doc-face))))  ; return docstring of the function
    counsel-describe-variable
    (:columns
     ((counsel-describe-variable-transformer (:width 40))
      (ivy-rich-counsel-variable-docstring (:face font-lock-doc-face))))  ; return docstring of the variable
    counsel-recentf
    (:columns
     ((ivy-rich-candidate (:width 0.8))
      (ivy-rich-file-last-modified-time (:face font-lock-comment-face))))  ; return last modified time of the file
    package-install
    (:columns
     ((ivy-rich-candidate (:width 30))
      (ivy-rich-package-version (:width 16 :face font-lock-comment-face))  ; return package version
      (ivy-rich-package-archive-summary (:width 7 :face font-lock-builtin-face))  ; return archive summary
      (ivy-rich-package-install-summary (:face font-lock-doc-face)))))  ; return package description
  (defun ivy-rich-switch-buffer-icon (candidate)
    (with-current-buffer
	(get-buffer candidate)
      (let ((icon (all-the-icons-icon-for-mode major-mode)))
	(if (symbolp icon)
	    (all-the-icons-icon-for-mode 'fundamental-mode)
	  icon))))
  (setq ivy-rich-display-transformers-list
	'(ivy-switch-buffer
	  (:columns
	   ((ivy-rich-switch-buffer-icon (:width 2))
	    (ivy-rich-candidate (:width 30))
	    (ivy-rich-switch-buffer-size (:width 7))
	    (ivy-rich-switch-buffer-indicators (:width 4 :face error :align right))
	    (ivy-rich-switch-buffer-major-mode (:width 12 :face warning))
	    (ivy-rich-switch-buffer-project (:width 15 :face success))
	    (ivy-rich-switch-buffer-path (:width (lambda (x) (ivy-rich-switch-buffer-shorten-path x (ivy-rich-minibuffer-width 0.3))))))
	   :predicate
	   (lambda (cand) (get-buffer cand))))))

;;(use-package ivy-posframe
;;  :ensure t
;;  :init
;;  (ivy-posframe-mode 1)
;;  :custom
;;  (ivy-posframe-parameters
;;   '((left-fringe . 8)
;;     (right-fringe . 8)))
;;  (ivy-posframe-height-alist
;;        '((swiper . 20)
;;          (t . 30)))
;;  (ivy-posframe-display-functions-alist
;;        '((swiper . ivy-display-function-fallback)
;;          (t . ivy-posframe-display-at-frame-center))))


(provide 'init-ivy-swiper-counsel)
