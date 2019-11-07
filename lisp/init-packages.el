;;config the repos URL mirrors
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
			 ))

(package-initialize)
;;must add this line.Or emacs cannot recognize the following lisp statments 
;;cl - Common Lisp Extension
(require 'cl)


;;add whatever packages you want here
(defvar my/packages '(
			use-package
			yasnippet
			anaconda-mode
			highlight-parentheses
			find-file-in-project
			elpy
			all-the-icons
			python
                        ;ipython-shell-send
			;ob-ipython
			websocket
			request
			ein
			;pyvenv
			;pyvenv-mode
			flycheck
			flycheck-pycheckers
			py-autopep8 
			jupyter ;emacs-jupyter
			helm
			cdlatex
         		;persp-mode
			;eyebrowse 
			;anaconda-mode
			company
			auto-complete			
			;company-anaconda
			company-jedi
			;company-capf
			company-auctex
			;;company-lisp
			;;auto-complete 
			py-autopep8 
			org			
			org-ref
			org-pretty-tags  
			org-bullets			
			ess			
			ess-smart-underscore 
			poly-R 
			poly-org 
			magic-latex-buffer 
		        counsel 
			swiper
			auctex
			latex-pretty-symbols 
			latex-preview-pane 
			latex-extra 
			projectile
			neotree
			recentf   
			monokai-theme  
			allout 
			;;highligh-parentheses ;;emacs display not avaliable 
			tablist ;;for pdf-tools
			pdf-tools
				 
				 )  "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))


(provide 'init-packages)
