;; AucTex: Require AucTex
(require 'tex-site) 

;;确保auctex被加载，这样可以使用在emacs中使用auctex。
(load "auctex.el" nil t t)

(latex-preview-pane-enable)


;;activate tex fold mode 	
(add-hook 'TeX-mode-hook (lambda ()
                             (TeX-fold-mode 1)))


;;LaTeX: Enable LaTeX Math mode by default
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;;install dvipng by apt-get and config org mode to use xelatex to compile latex doc.
(executable-find "dvipng")
(executable-find "dvisvgm")
(setq org-latex-compiler "xelatex")


;;实现latex支持，添加路径寻找latex的可执行文件
(setq exec-path (append exec-path '("/usr/local/texlive/2019/bin/x86_64-linux/")))





(add-hook 'LaTeX-mode-hook
              #'(lambda ()
                  (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex --synctex=1%(mode)%' %t" TeX-run-TeX nil t))))

(setq TeX-command-default "XeLaTeX")



;;set variables to sovle confict of pdf-view with linum-mode
(add-hook 'pdf-view-mode-hook (lambda() (linum-mode -1)))
(add-hook 'find-file-hook 'linum-mode)

(add-hook 'text-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook 'linum-mode)



(require 'cdlatex)
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)

;with AUCTeX LaTeX mode
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)

;with LaTeX mode
;(add-hook 'latex-mode-hook 'turn-on-cdlatex)


;;enable latex-extra package
;;(add-hook 'LaTeX-mode-hook #'latex-extra-mode)


;;; Query for master file.when you use multifile documents for the latex 	
(setq-default TeX-master nil)

;;启用交叉引用包reftex
(add-hook 'LaTeX-mode-hook 'turn-on-reftex) 


;; to use pdfview with auctex
 (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
    TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
    TeX-source-correlate-start-server t) ;; not sure if last line is neccessary

 ;; to have the buffer refresh after compilation
 (add-hook 'TeX-after-compilation-finished-functions
        #'TeX-revert-document-buffer)


;;enable to synctex ?
;;correlate
(server-start)
(add-hook 'LaTeX-mode-hook 'TeX-PDF-mode)
(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
(setq TeX-source-correlate-method 'synctex)
(setq TeX-source-correlate-start-server t)




(add-hook 'LaTeX-mode-hook 'turn-on-outline-minor-mode)
(add-hook 'latex-mode-hook 'turn-on-outline-minor-mode)
(setq outline-minor-mode-prefix "\C-c \C-o") 

;;latex-preview-pane to load automatically with your LaTeX files



;;load latex_pretty_symbols.el
(add-to-list 'load-path "~/.emacs.d/lisp/latex_pretty_symbols/")
(require 'latex-pretty-symbols)


;;-----------------------
;;enhance auctex for the \includegraphics package

(add-hook 'LaTeX-mode-hook 'AUCTeX-dnd-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(defcustom AUCTeX-dnd-format "\\includegraphics[width=\\textwidth]{%s}"
  "What to insert, when a file is dropped on Emacs window. %s is
replaced by the actual file name. If the filename is located
under the directory of .tex document, only the part of the name
relative to that directory in used."
  :type 'string
  :group 'AUCTeX)


;; Modified version
(defun AUCTeX-dnd-includegraphics (uri action)
  "Insert the text defined by `AUCTeX-dnd-format' when a file is
dropped on Emacs window."
  (let ((file (dnd-get-local-file-name uri t)))
    (when (and file (file-regular-p file))
      (if (string-match "/my/texinputs/path/to/images" file)
      (insert (format AUCTeX-dnd-format (file-name-nondirectory file)))
    (insert (format AUCTeX-dnd-format file))
    )
      )
    )
  )


(defcustom AUCTeX-dnd-protocol-alist
  '(("^file:///" . AUCTeX-dnd-includegraphics)
    ("^file://"  . dnd-open-file)
    ("^file:"    . AUCTeX-dnd-includegraphics))
  "The functions to call when a drop in `mml-mode' is made.
See `dnd-protocol-alist' for more information.  When nil, behave
as in other buffers."
  :type '(choice (repeat (cons (regexp) (function)))
                 (const :tag "Behave as in other buffers" nil))
  :version "22.1" ;; Gnus 5.10.9
  :group 'AUCTeX)


(define-minor-mode AUCTeX-dnd-mode
  "Minor mode to inser some text (\includegraphics by default)
when a file is dopped on Emacs window."
  :lighter " DND"
  (when (boundp 'dnd-protocol-alist)
    (if AUCTeX-dnd-mode
        (set (make-local-variable 'dnd-protocol-alist)
             (append AUCTeX-dnd-protocol-alist dnd-protocol-alist))
      (kill-local-variable 'dnd-protocol-alist))))




;(setq-default TeX-master "~/Desktop/100_StudyNotes/Stephen_StudyNotes_Main.tex") ; All master files called "master".

;;Or add those lines to each of the include tex files 
;;
;; %%% Local Variables: 
;; %%% mode: latex
;; %%% TeX-master: "THEMAINFILE" ;;use exact tex file name and path.
;; %%% End:


(provide 'init-Latex-config)




