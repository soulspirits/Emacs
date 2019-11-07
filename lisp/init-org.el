;;自动换行
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))




;;active synatx highligh for source code block
(require 'org)
(setq org-src-fontify-natively t)


;;增加org mode 导出到freelancer到后端
;;(require 'ox-freemind.el)
;;(setq org-export-backends '(freemind odt latex icalendar html ascii))


;;set org-mode export to doc automatically
(setq org-odt-preferred-output-format "doc")



;;activate org-mode
;; The following lines are always needed. Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)


(setq org-log-done 'time) ;;record todo list complete time
(setq org-log-done 'note) ;;record related note to the timestamp list



;;Org BibTeX references cause error when launch
;(require 'org-ref)
;(org-ref-define-citation-link "citeA" ?a)

;;org export latex pdf config
(setq org-latex-pdf-process
      '("xelatex -interaction nonstopmode -output-directory %o %f"
	"bibtex %b"
	"xelatex -interaction nonstopmode -output-directory %o %f"
	))

;;sample of the org-latex pdf  export
;;(setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f"
;;                              "xelatex -interaction nonstopmode %f"))

;; Org Mode Latex Templates
(require 'ox-latex)

;; American Psychological Association papers
(add-to-list 'org-latex-classes '("apa6"
    "\\documentclass[a4paper, jou]{apa6}
     [NO-DEFAULT-PACKAGES]
     \\usepackage[hidelinks]{hyperref}
     \\usepackage{apacite}
     \\usepackage[british]{babel}
     \\usepackage{ccicons}"
	       ("\\section{%s}" . "\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%Rs}")
	       ))


;;org capture feature 
(setq org-default-notes-file (concat org-directory "~/demo/notes.org"))
(define-key global-map "\C-cc" 'org-capture)




;;orgmode support babel language


(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (emacs-lisp . t)
   ;(julia . t)
   ;(ipython . t)
   ))


;;pdf-tools for orgm-mode
;;(eval-after-load 'org '(require 'org-pdfview))

;;(add-to-list 'org-file-apps 
;;             '("\\.pdf\\'" . (lambda (file link)
;;                                     (org-pdfview-open link))))


(provide 'init-org)














