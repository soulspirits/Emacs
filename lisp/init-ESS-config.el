;;activate ess for statistics
;;(load "ess-autoloads")

;;设置ESS的Working目录
(setq ess-ask-for-ess-directory nil)
(setq ess-set-working-directory "~/R/")
;;设置默认语言
;;(setq ess-ask-for-dialect nil)
(setq ess-dialect "R")

;;(add-to-list ‘auto-mode-alist ‘("\\.R$" . R-mode))
;;(add-to-list ‘auto-mode-alist ‘("\\.r$" . R-mode))

;; (setq ess-local-process-name "R")
;; (setq ansi-color-for-comint-mode ‘filter)
;; (setq comint-prompt-read-only t)
;; (setq comint-scroll-to-bottom-on-input t)
;; (setq comint-scroll-to-bottom-on-output t)
;; (setq comint-move-point-for-output t)

;; (global-set-key [(meta i)] ‘ess-eval-line)
;; (global-set-key [(meta o)] ‘ess-eval-region)
;; (global-set-key [(meta p)] ‘ess-eval-buffer)

;;Make ‘M-h’ to display quick help:
;;(define-key company-active-map (kbd "M-h") 'company-show-doc-buffer)

;;load org-R mode ;; Active the R language in Babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)))

;; Controlling buffer display
(setq display-buffer-alist
      `(("*R Dired"
         (display-buffer-reuse-window display-buffer-in-side-window)
         (side . right)
         (slot . -1)
         (window-width . 0.33)
         (reusable-frames . nil))
        ("*R"
         (display-buffer-reuse-window display-buffer-at-bottom)
         (window-width . 0.5)
         (reusable-frames . nil))
        ("*Help"
         (display-buffer-reuse-window display-buffer-in-side-window)
         (side . right)
         (slot . 1)
         (window-width . 0.33)
         (reusable-frames . nil))))




;;ESS的代码缩进设置
(add-hook 'ess-mode-hook
          (lambda ()
            (ess-set-style 'C++ 'quiet)
            (setq comment-column 4) ; 把以#开始的行缩进4空格，免得难看
            (show-paren-mode t)     ; 自动加亮跟踪括号
            ess-indent-level 2
            ess-continued-statement-offset 2
            ;;ess-brace-offset 0
            ess-arg-function-offset 4
            ess-expression-offset 2
            ess-else-offset 0
            ess-close-brace-offset 0
	    ))

;;sovle < in ess 
(require 'ess-smart-underscore)


;; Auto complete for ess 
(require 'auto-complete-config)
(ac-config-default)
;;(require 'company)




(provide 'init-ESS-config)


