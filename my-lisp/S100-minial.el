;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; minial config file do not need to install any external package
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; UI setting
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 在状态栏显示行号和列号
(setq line-number-mode t)
(setq column-number-mode t)		; has been openned
;; 在左侧显示行号, 注意从 29 版本开始 global-linum-mode 函数被舍弃。
(global-display-line-numbers-mode t)

;; 隐藏工具栏
(tool-bar-mode -1)

;; 隐藏菜单栏
(menu-bar-mode -1)

;; 禁用滚动条
(set-scroll-bar-mode nil)

;; Set window's title 
(setq frame-title-format "emacs@%b")

;; Inhibits the startup screen
(setq inhibit-startup-message t)

;; Support full screen
(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
			 (if (equal 'fullboth current-value)
			     (if (boundp 'old-fullscreen) old-fullscreen nil)
			   (progn (setq old-fullscreen current-value)
				  'fullboth)))))
(global-set-key [f9] 'toggle-fullscreen)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; utils setting
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Cutting and pasting uses the clipboard
(setq x-select-enable-clipboard t)

;; Dont ask user a yes-or-no question, ask a y-no-n question.
(fset 'yes-or-no-p 'y-or-n-p)

;; Highlighting matching parenthesis, 大小中括号等。
(show-paren-mode t)

;; Display time, 在状态栏显示日期时间
(display-time-mode 1)
;; Time should be displayed as hh:mm, 0 <= hh <= 23
(setq display-time-24hr-format t)
;; Display day and date
(setq display-time-day-and-date t)

;; Automatic reload file when the file changes on disk.
(global-auto-revert-mode t)

;; Automatic Indent according to major mode when enter RET.
(global-set-key "\r" 'newline-and-indent)

;; Set the default width of tab
;; (setq tab-width 4) ;; have no effect
(custom-set-variables '(tab-width 4))

;; disable tab
(setq-default indent-tabs-mode nil)

;; Dont backup file
(setq make-backup-files nil)

;; Set the file used for storing customization information.
(setq custom-file (concat temporary-path "my-custom.el"))

;; Aoto complete the pair
(setq skeleton-pair t)
(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "`") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "'") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "<") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)

;; TODO: browse
;; (setq browse-url-browser-function 'browse-url-default-browser)

;; Auto saves after 100 input events
(setq auto-save-interval 100)

;; Enable font-lock mode
(global-font-lock-mode t)

;; Enabe image mode
;; (auto-image-file-mode)
;; (setq mm-inline-large-images t)
;; (add-to-list 'mm-attachment-override-types "image/*")

;; Close the noise when enter tab
(setq visible-bell t)

;; Enable ido mode
(ido-mode t)

;; Set text-mode is the default mode
(custom-set-variables
 '(major-mode (quote text-mode)))

;; Better experience of page up and down
(setq scroll-margin 3 scroll-conservatively 10000)

;; If the cursor gets too close to the mouse, shows steps along the way
;; for illusion of motion
(mouse-avoidance-mode 'animate)

;; 当有两个文件名相同的缓冲时, 使用前缀的目录名做 buffer 名字.
(setq uniquify-buffer-name-style 'forward)

;; C-k delete the line
(setq-default kill-whole-line t)

;; Auto add a new line to end of file
(setq require-final-newline t)

;; Start emacs server default.
(server-start)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; profile setting
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq user-mail-address "riegamaths@gmail.com")
(setq user-full-name "mathslinux")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; desktop setting
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'desktop)

; Add temporary-path to desktop file searching list.
(add-to-list 'desktop-path temporary-path)

;; Set the directory in which the desktop file should be saved.
(setq desktop-dirname temporary-path)

;; Set the base name of the desktop file.
(setq desktop-base-file-name "emacs.desktop")

;; auto save mode
(desktop-save-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; keymap setting: must be loaded after all setting loaded
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; close window
(global-set-key [f4] 'delete-window)

;; 拷贝当前行
(defun copy-line (&optional arg)
  "Save current line into Kill-Ring without mark the line"
  (interactive "P")
  (let ((beg (line-beginning-position))
        (end (line-end-position arg)))
    (copy-region-as-kill beg end))
  )
(define-key global-map (kbd "C-c y") 'copy-line)

;; undo, redo need other package
;; C-. 在大多数终端下无效
(global-set-key (kbd "C-;") 'undo)
(global-set-key (kbd "C-,") 'undo)
(global-set-key (kbd "C-'") 'undo-redo)
(global-set-key (kbd "C-.") 'undo-redo)

;; close current buffer
(defun kill-buffer-and-save-desktop ()
  "Save desktop save after saving buffer."
  (interactive)
  (progn
    (kill-this-buffer)
    (desktop-save-in-desktop-dir)))
(global-set-key [C-f9] 'kill-buffer-and-save-desktop)

;;跳到指定行
(global-set-key "\M-g" 'goto-line)

;;各窗口间切换
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)

;; VI 的 % 括号匹配
(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))
(global-set-key "%" 'match-paren)

;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)


;; hungruy 模式设置
;; emacs 默认在 cc 模式下对hungry支持得比较好，但是其他模式无法使用。
;; 另外 emacs 内置 fixup-whitespace, cycle-spacing, delete-horizontal-space, just-one-space 等
;; 为了方便，使用直接绑定到 backspace 上封装好的库
;; 使用的版本为 d919e55
(require 'hungry-delete)
(global-hungry-delete-mode)
