;;; package --- init-hydra
;;; Commentary:
;;; Code:
(use-package hydra
  :ensure t)

;; (defhydra hydra-move ()
;;   ("p" previous-line "prev")
;;   ("n" next-line "next")
;;   ("f" forward-char "forward char")
;;   ("b" backward-char "backward char")
;;   ("q" nil "quit"))

;; (define-key global-map (kbd "C-n")
;;   '(lambda ()
;;      (interactive)
;;      (next-line)
;;      (hydra-move/body)))

;; (define-key global-map (kbd "C-p")
;;   '(lambda ()
;;      (interactive)
;;      (previous-line)
;;      (hydra-move/body)))

;; (define-key global-map (kbd "C-f")
;;   '(lambda ()
;;      (interactive)
;;      (forward-char)
;;      (hydra-move/body)))

;; (define-key global-map (kbd "C-b")
;;   '(lambda ()
;;      (interactive)
;;      (backward-char)
;;      (hydra-move/body)))

(global-set-key
 (kbd "C-(")
 (defhydra hydra-pair (:color pink)
   "pair"
   ("a" sp-beginning-of-sexp "begin of sexp")
   ("e" sp-end-of-sexp "end of sexp")
   ("w" sp-forward-sexp "forward")
   ("b" sp-backward-sexp "backward")
   ("u" sp-backward-unwrap-sexp "unwrap")
   ("l" sp-down-sexp "left in")
   ("L" sp-backward-up-sexp "left out")
   ("r" sp-backward-down-sexp "right in")
   ("R" sp-up-sexp "Right out")
   ("q" nil "quit")))

(global-set-key
 (kbd "C-z")
 (defhydra hydra-vi (:pre (set-cursor-color "SteelBlue1")
                          :post (set-cursor-color "RoyalBlue2")
                          :color pink
                          :hint nil)
   "
   ^_c_^     for_w_ard       _d_elchar     _s_ave          _m_ark
 _h_ + _n_   _b_ackward      [k]ill        _y_(_Y_)ank
   ^_t_^     _a_head/_e_nd                 _u_ndo/_r_edo
"
   ("h" backward-char)
   ("t" next-line)
   ("c" previous-line)
   ("n" forward-char)
   ("w" forward-word)
   ("b" backward-word)
   ("m" set-mark-command)
   ("a" mwim-beginning-of-code-or-line)
   ("e" mwim-end-of-code-or-line)
   ("d" delete-char)
   ("kr" kill-region)
   ("kl" kill-whole-line)
   ("s" kill-ring-save)
   ("y" yank)
   ("Y" consult-yank-pop)
   ("u" undo)
   ("r" undo-redo)
   ("q" nil "quit")))

(defhydra hydra-zoom ()
  "zoom"
  ("g" text-scale-increase "in")
  ("l" text-scale-decrease "out"))

(global-set-key
 (kbd "C-x w")
 (defhydra hydra-window (:color amaranth)
   "window"
   ("h" split-window-horizontally "split horizontally" :column "new&delete")
   ("v" split-window-vertically "split vertically")
   ("k" delete-window "delete window")
   ("K" delete-other-windows "delete others")
   ("u" hydra-move-splitter-up "resize up" :column "resize")
   ("d" hydra-move-splitter-down "resize down")
   ("l" hydra-move-splitter-left "resize left")
   ("r" hydra-move-splitter-right "resize right")
   ("U" windmove-swap-states-up "swap up" :column "swap")
   ("D" windmove-swap-states-down "swap down")
   ("L" windmove-swap-states-left "swap left")
   ("R" windmove-swap-states-right "swap right")
   ("o" other-window "other" :column "focus move")
   ("q" nil "quit")
   ))


(require 'windmove)

(defun hydra-move-splitter-left (arg)
  "Move window splitter left."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'right))
      (shrink-window-horizontally arg)
    (enlarge-window-horizontally arg)))

(defun hydra-move-splitter-right (arg)
  "Move window splitter right."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'right))
      (enlarge-window-horizontally arg)
    (shrink-window-horizontally arg)))

(defun hydra-move-splitter-up (arg)
  "Move window splitter up."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'up))
      (enlarge-window arg)
    (shrink-window arg)))

(defun hydra-move-splitter-down (arg)
  "Move window splitter down."
  (interactive "p")
  (if (let ((windmove-wrap-around))
        (windmove-find-other-window 'up))
      (shrink-window arg)
    (enlarge-window arg)))


(provide 'init-hydra)
;;; init-hydra.el ends here
