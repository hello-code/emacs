;;; custom.el --- 用户自定义
;;; Commentary:
;; 在这里配置自己的代码
;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes (quote ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;==================================================
;常规设置
;==================================================
;设置读写中文环境
(setq buffer-file-coding-system 'utf-8);写文件
(prefer-coding-system 'utf-8);读文件

;分别设置中英文字体
(set-frame-font "DejaVu Sans Mono-11")
(set-fontset-font "fontset-default" 'unicode "WenQuanYi Bitmap Song 12")

;;上/下移动一行
(global-set-key [(C-up)] 'md/move-lines-up)
(global-set-key [(C-down)] 'md/move-lines-down)

;; 开启行号
(global-linum-mode t)

;;光标形状
(setq-default cursor-type 'bar);bar:竖线 box:方块

;;高亮当前行
(global-hl-line-mode t)
;取消高亮当前行的下划线
;(set-face-attribute hl-line-face nil :underline nil)

;;关闭其他buffer：kill-other-buffers
(defun kill-other-buffers ()
"Kill all other buffers."
(interactive)
(mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

;;==输入当前日期和时间==
;;insert-current-date
(defun insert-current-date ()
"Insert the current date."
(interactive "*")
(insert (format-time-string "[%Y/%m/%d %H:%M:%S]" (current-time))))
;(insert (format-time-string "[%Y/%m/%d]" (current-time))))
(global-set-key "\C-xd" 'insert-current-date)
;;insert-current-time
(defun insert-current-time ()
"Insert the current time."
(interactive "*")
;(insert (format-time-string "%Y/%m/%d %H:%M:%S" (current-time))))
(insert (format-time-string "%H:%M:%S" (current-time))))
(global-set-key "\C-xt" 'insert-current-time)
;;==end 输入当前日期和时间==

;; Calendar
;显示当前日期
(require 'calendar)
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)
(setq calendar-week-start-day 1) ; 每周第一天是周一
(setq calendar-mark-diary-entries-flag t) ; 标记有记录的日子
(setq calendar-mark-holidays-flag t)      ; 标记节假日
(setq calendar-latitude +31.475);维度
(setq calendar-longitude +104.727);经度

;==================================================
;插件配置
;==================================================
;;多窗口
(window-numbering-mode t)

;; org-agenda目录-统一管理
(require 'org)
(setq org-agenda-files (list
                        ;; "/mnt/hgfs/iemacs/journal.org"
                        ;; "/mnt/hgfs/Project/Finance/org"
                        "~/org"
                        ))

;; jedi
(autoload 'jedi:setup "jedi" nil t)
(setq jedi:setup-keys t);注意这句的位置要靠前
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t) ; optional
;(add-to-list 'company-backends 'company-anaconda);给python补全

;;yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;;vim 模式
;(evil-mode 1)

;; auto-complete (主要是弹出menu和help的时间设置)
(setq ac-auto-start t);开启自动补全
; 补全菜单显示速度
(setq ac-auto-show-menu 0.2) ; completion menu
; 对于补全项的解释
(setq ac-use-quick-help t)
(setq ac-quick-help-delay 0.3) ; help显示速度
;; ;;菜单
;; (setq ac-menu-height 12)
;; (set-face-background 'ac-candidate-face "lightgray")
;; (set-face-underline 'ac-candidate-face "darkgray")
;; (set-face-background 'ac-selection-face "steelblue")
(require 'pos-tip);帮助菜单的显示位置
(setq ac-quick-help-prefer-pos-tip t)

;==================================================
;可被 auto-complete-clang-extension 代替
;--------------------------------------------------
;; ; auto-complete-c-headers and gets called for c/c++ hooks
;; ; gcc -xc++ -E -v -
;; (defun my:ac-c-header-init()
;; (require 'auto-complete-c-headers)
;; (add-to-list 'ac-sources 'ac-source-c-headers)
;; (add-to-list 'achead:include-directories '"/usr/include/c++/4.7")
;; (add-to-list 'achead:include-directories '"/usr/include/c++/4.7/x86_64-linux-gnu")
;; (add-to-list 'achead:include-directories '"/usr/include/c++/4.7/backward")
;; (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/4.7/include")
;; (add-to-list 'achead:include-directories '"/usr/local/include")
;; (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/4.7/include-fixed")
;; (add-to-list 'achead:include-directories '"/usr/include/x86_64-linux-gnu")
;; (add-to-list 'achead:include-directories '"/usr/include")
;; (add-to-list 'achead:include-directories '".")
;; )
;; (add-hook 'c++-mode-hook 'my:ac-c-header-init)
;; (add-hook 'c-mode-hook 'my:ac-c-header-init)
;==================================================

;; ;;绑定热键-举例
;; (define-key global-map [f12] 'cscope-find-global-definition-no-prompting)
;; (define-key global-map [S-f12] 'cscope-pop-mark)

;; org-Capture
; notes 保存位置
;(setq org-default-notes-file (concat org-directory "/notes.org"))
; 绑定热键
;(define-key global-map "\C-cc" 'org-capture)
(define-key global-map [f8] 'org-capture)
; 模板
(setq org-capture-templates '(
("a" "Appointment" entry (file+headline "~/org/appointment.org" "Calendar")
"* APPT %^{Description} %^g
%?
Added: %U")

("j" "Journal" entry (file+datetree "~/org/journal.org")
"* %<%T> %?" :empty-lines 1)

("l" "Log Time" entry (file+datetree "~/org/timelog.org" )
"** %U - %^{Activity} :TIME:")

("m" "Memo" entry (file+datetree "~/org/memo.org")
"* %^{Description} %^g\nQuote:%a
%?\nAdded:%U" :empty-lines 1)

("n" "Notes" entry (file+datetree "~/org/notes.org")
"* %^{Description} %^g
%?\nAdded:%U" :empty-lines 1)

("t" "Todo" entry (file+headline "~/org/gtd.org" "Inbox")
"* TODO %?\nQuote:%a\nAdded:%U" :empty-lines 1)

("r" "Tommorrow Todo" entry
(file+headline "~/org/gtd.org" "Tomorrow")
"** TODO %^{Description} %^g\nSCHEDULED: <%(org-read-date nil nil \"+1d\")>%?\nAdded:%U"
:empty-lines 1)

("u" "Url Link" plain (file "~/org/links.org")
 "* %?\n %x\n")
))

;; 大纲视图缩进
;(setq org-startup-indented t)
(setq org-hide-leading-stars t)

;==================================================
;; 第三方插件的路径： site-lisp
;==================================================
(add-to-list 'load-path "~/.emacs.d/site-lisp/")

;; for c/c++
(require 'auto-complete-clang-extension)

;; 中文日历
(require 'cal-china-x)
(setq calendar-mark-holidays-flag t)
(setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
(setq calendar-holidays cal-china-x-important-holidays)

(provide 'custom)
;;; custom.el ends here
