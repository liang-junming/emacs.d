;;; package --- init-translate
;;; Commentary:
;;; Code:
(use-package go-translate
  :ensure t
  :config
  (setq gts-translate-list '(("en" "zh")))
  (setq gts-default-translator
        (gts-translator

         :picker ; 用于拾取初始文本、from、to，只能配置一个
         (gts-noprompt-picker)
         ;;(gts-noprompt-picker :texter (gts-whole-buffer-texter))
         ;;(gts-prompt-picker)
         ;;(gts-prompt-picker :single t)
         ;;(gts-prompt-picker :texter (gts-current-or-selection-texter) :single t)

         :engines ; 翻译引擎，可以配置多个。另外可以传入不同的 Parser 从而使用不同样式的输出
         (list
          (gts-bing-engine)
          (gts-google-engine :parser (gts-google-summary-parser))
          (gts-google-engine)
          ;;(gts-google-rpc-engine)
          ;;(gts-deepl-engine :auth-key [YOUR_AUTH_KEY] :pro nil)
          ;;(gts-google-engine :parser (gts-google-parser))
          ;;(gts-google-rpc-engine :parser (gts-google-rpc-summary-parser))
          ;;(gts-google-rpc-engine :parser (gts-google-rpc-parser))
          ;;(gts-youdao-dict-engine)
          ;;(gts-stardict-engine)
          )

         :render ; 渲染器，只能一个，用于输出结果到指定目标。如果使用 childframe 版本的，需自行安装 posframe
         (gts-buffer-render)
         ;;(gts-posframe-pop-render)
         ;;(gts-posframe-pop-render :backcolor "#333333" :forecolor "#ffffff")
         ;;(gts-posframe-pin-render)
         ;;(gts-posframe-pin-render :position (cons 1200 20))
         ;;(gts-posframe-pin-render :width 80 :height 25 :position (cons 1000 20) :forecolor "#ffffff" :backcolor "#111111")
         ;;(gts-kill-ring-render)

         :splitter ; 分割器，可选。如果设置了，将会分段按照提供的规则分段进行翻译。可以选择定制 Render 混合输出分段翻译的结果
         (gts-paragraph-splitter)
         ))
  :bind ("C-c t" . gts-do-translate))

(provide 'init-translate)
;;; init-translate.el ends here
