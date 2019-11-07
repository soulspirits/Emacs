(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-selection (quote ((output-pdf "PDF Tools"))))
 '(company-auto-complete t)
 '(company-backends
   (quote
    (company-jedi company-anaconda ein:company-backend company-bbdb company-eclim company-semantic company-clang company-xcode company-cmake company-files
		  (company-dabbrev-code company-gtags company-etags company-keywords)
		  company-oddmuse company-dabbrev)))
 '(company-idle-delay 0.1)
 '(ein:completion-backend (quote ein:use-company-backend))
 '(ein:polymode t)
 '(ein:use-auto-complete-superpack t)
 '(python-shell-completion-native-disabled-interpreters (quote ("pypy" "jupyter")))
 '(python-shell-interpreter "ipython")
 '(reftex-toc-split-windows-horizontally t))
 

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fira Mono" :foundry "CTDB" :slant normal :weight normal :height 90 :width normal)))))
