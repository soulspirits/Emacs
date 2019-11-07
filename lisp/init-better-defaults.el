

;;save the layout of window and restore after lanuch
;;(desktop-save-mode 1)

;;(eyebrowse-mode t)

;;enable latex-preview-pane




;;enalbe neotree package
(require 'neotree)
(global-set-key [f4] 'neotree-toggle)

;;enable icons and themes 
;;(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;;install icons and arrows for neo-themes
;(use-package all-the-icons)


;;Session saved package pespectives
;(persp-mode t)
;
;    (with-eval-after-load "persp-mode-autoloads"
;      (setq wg-morph-on nil) ;; switch off animation
;      (setq persp-autokill-buffer-on-remove 'kill-weak)
;      (add-hook 'after-init-hook #'(lambda () (persp-mode 1))))



;;use mark to cover password
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)


;;config calendar to use
;;show calendar at startup
(calendar)
;;show Monday as first day of calendar
(setq calendar-week-start-day 1)



;;enable chinese luna calendar
(add-to-list 'load-path "~/.emacs.d/lisp/cal-china-x/") 

(require 'cal-china-x)
(setq mark-holidays-in-calendar t) 
(setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
(setq calendar-holidays cal-china-x-important-holidays)


;;recently opened file
(require 'recentf)
(setq recentf-max-saved-items 10)
(recentf-mode 1)


;;关闭文件滑动控件
(scroll-bar-mode -1)


;;display line number mode
(global-linum-mode 1)



;;enabe helm mode

;(require 'helm-config) .Only works on GUN/Emacs,not spacemacs








;;load monokai theme automaticlly.only works on GUN/Emacs,not spacemacs
;;(load-theme 'monokai t)

;高亮当前行，当文本内容很多时可以很容易找到光标的位置。;
(global-hl-line-mode 1)

;;enalbe automaticlly fill parenthesis
;;(electric-pair-mode)
;;display matching parentheses
;;(require 'highlight-parentheses)

;;show cursor bar style
(setq-default cursor-type 'bar)



;;使用polymode 实现在同一个buffer中语法高亮多种编程语言
(unless (package-installed-p 'polymode)
  (package-install 'poly-markdown))

;;use projectile
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)




;; 关闭缩进 (第二天中被去除)
(electric-indent-mode 1)

;;display time
(display-time)
(setq display-time-24hr-format t) ;;格式 
(setq display-time-day-and-date t) ;;显示时间、星期、日期

;;隐藏菜单栏工具栏滚动条
(tool-bar-mode 0) 
(menu-bar-mode 1) 
;;(scroll-bar-mode 0) 
;;注: 新版改成使用0，旧版使用nil的做法已失效，但 (set-scroll-bar-mode nil) 仍可使用



;;enable Outline Mode. 
(defun turn-on-outline-minor-mode ()
(outline-minor-mode 1))


;;enable synatx check


(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))



;;enable ivy
(ivy-mode 1)



;;basic config for ivy
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")




;; enable this if you want `swiper' to use it


;;全局使用company mode

(add-hook 'after-init-hook 'global-company-mode)

;;enable auto-complete
(ac-config-default)


;;active english-dic package
;(require 'company-english-helper)

;;enalbe fuzz search for the english-dic package.Waring!this may cause performance
;(setq company-english-helper-fuzz-search-p t)


;;pdf-tools  install. Cause emacs choke at using it.

;;(pdf-tools-install)

;(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
;TeX-source-correlate-start-server t)



;;Autorevert works by polling the file-system every auto-revert-interval seconds, 
;;optionally combined with some event-based reverting via file notification. But this 
;;currently does not work reliably, such that Emacs may revert the PDF-buffer while the 
;;corresponding file is still being written to (e.g. by LaTeX), leading to a potential 
;;error.

;;With a recent auctex installation, you might want to put the following somewhere in 
;;your dotemacs, which will revert the PDF-buffer after the TeX compilation has 
;;finished.
(add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)



;;resolve confict of pdf-tools and linum mode

(add-hook 'pdf-view-mode-hook (lambda() (linum-mode -1)))







(provide 'init-better-defaults)






