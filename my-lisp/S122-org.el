;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; org-todo-keywords 定义 todo 的状态
;; "|" 后面状态表示是终止状态，进入后不会再流转。
;; 
;; WAITING(w@/!): 特殊标记
;;  * w 指定了快捷键 w, 可通过 C-c C-t w 切换到此状态。
;;  * @ 要求在进入此状态时提示输入注释。
;;  * ! 表示切换到该状态时记录时间戳。
;;
(setq org-todo-keywords 
      '((sequence "TODO(t)" "DOING(i)" "|" "DONE(d@/!)" "CANCELLED(c@/!)")))

;; 定义颜色
(setq org-todo-keyword-faces
      '(("TODO" . "chocolate")
        ("DOING" . "orange")
        ("DONE" . "green")
        ("CANCELLED" . "gray")))


;; org-mode 中 C-, 冲突，重新定义
(define-key org-mode-map (kbd "C-,") 'undo)

;; 防止在代码块编辑的时候自动缩进
(setq org-src-preserve-indentation t)
