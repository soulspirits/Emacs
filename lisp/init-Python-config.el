;;set anaconda ipython path
;;(setenv "WORKON_HOME" "/home/stephen/anaconda3/")
;;(pyvenv-mode 1)

;;enable anaconda mode
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

;;resovle Your ‘python-shell-interpreter’ doesn’t seem to support readline
(with-eval-after-load 'python
  (defun python-shell-completion-native-try ()
    "Return non-nil if can trigger native completion."
    (let ((python-shell-completion-native-enable t)
          (python-shell-completion-native-output-timeout
           python-shell-completion-native-try-output-timeout))
      (python-shell-completion-native-get-completions
       (get-buffer-process (current-buffer))
       nil "_"))))

;;enable elpy
(require 'python)
(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable))


(add-hook 'python-mode-hook 'elpy-mode)
(with-eval-after-load 'elpy
  (remove-hook 'elpy-modules 'elpy-module-flymake)
  (add-hook 'elpy-mode-hook 'flycheck-mode)
  ;(add-hook 'elpy-mode-hook 'elpy-use-ipython "ipython3")
  (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))


;;interactive python provision
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")


;;config company-jedi 
(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)


;;flycheck addons
(global-flycheck-mode 1)
(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook #'flycheck-pycheckers-setup))




;(require 'python)
(require 'ein)
(require 'ein-notebook)
(require 'ein-subpackages)












(provide 'init-Python-config)
