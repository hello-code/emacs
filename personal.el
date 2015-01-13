;;; personal.el --- Personal configuration entry point.

;;; Commentary:

;; This file simply sets up the default load path and requires
;; the various modules defined within Emacs Prelude.

;;; Code:
;; 背景色
(set-background-color "#1E1E1E")

;; 去掉响铃
(setq ring-bell-function 'ignore)

;;分别设置中英文字体
;(set-frame-font "DejaVu Sans Mono-11")
;(set-fontset-font "fontset-default" 'unicode "WenQuanYi Bitmap Song 12")

;; 开启行号
(global-linum-mode t)

;;关闭其他buffer：kill-other-buffers
;; (defun kill-other-buffers ()
;;   "Kill all other buffers."
;;   (interactive)
;;   (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))
;; prelude有自带的关闭其他buffer： C-c k

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
                                        ;(insert (format-tim>e-string "%Y/%m/%d %H:%M:%S" (current-time))))
  (insert (format-time-string "%H:%M:%S" (current-time))))
(global-set-key "\C-xt" 'insert-current-time)
;;==end 输入当前日期和时间==

;; 提醒
(require 'appt)
(appt-activate t);启用约会提醒
(setq appt-display-format 'window);提醒出现的方式
(setq appt-message-warning-time '5);在到期前5分钟提醒
(setq appt-display-duration '30);提醒持续时间（秒）
(setq appt-audible t)  ;声音提醒 -->没有响声!!
(setq appt-display-mode-line t);在状态栏显示时间（分钟）

;; org-agenda目录-统一管理
(require 'org)
(setq org-agenda-files (list "~/org/"
                                        ;"~/Dropbox/notebook.org"
                             ))

;; TODO 任务到时间后提醒
;;(C-c C-s后，把Schedule的单词删除，那么就是一个时间戳的概念)
(org-agenda-to-appt)

;;org-mode中换行
(setq org-startup-truncated nil)

;; org-Capture
(require 'org-capture)

;; notes 保存位置
;; (setq org-default-notes-file (concat org-directory "/notes.org"))
;; 绑定热键
;; (define-key global-map "\C-cc" 'org-capture)
(define-key global-map [f8] 'org-capture)
;;模板
(setq org-capture-templates
      '(("i" "Inbox" entry (file+headline "~/org/gtd.org" "Inbox")
         "* TODO %?\n Quote:%a\n Added:%U\n")
        ("t" "Todo" entry (file+headline "~/org/gtd.org" "Task")
         "* TODO %?\n Added:%U")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
                                        ;"* %?\n%U\n" :clock-in t :clock-resume t
         "* %<%T> %?";:empty-lines 1
         )

        ("l" "Log Time" entry (file+datetree "~/org/timelog.org")
         "** [%<%Y-%m-%d %H:%M:%S>] - %^{Activity} :TIME:")
        ("n" "Study notebook" entry (file+datetree "~/org/notebook.org")
         "** %U - %^{Activity} :TIME:")
        ))
;; 大纲视图缩进
                                        ;(setq org-startup-indented t)

;;多窗口
                                        ;(window-numbering-mode t)

;; tea-time
(require 'tea-time)
(setq tea-time-sound "~/music/duanxin.wav")

(provide 'personal)
;;; personal.el ends here
;;test
