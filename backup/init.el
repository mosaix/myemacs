;; init.el - -- Emacs configuration

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq default - buffer - file - coding - system 'utf - 8)
(setq python - shell - prompt - detect - failure - warning nil)

(set-frame-font "Envy Code R:pixelsize=15")
(dolist(charset '(han kana symbol cjk - misc bopomofo))
  (set-fontset-font(frame - parameter nil 'font)
                    charset
                    (font - spec: family "Hiragino Sans GB": size 15)
))
(desktop - save - mode 1)

(setq desktop - dir "~/emacs.d/")
(desktop - read desktop - dir)


;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(add - to - list 'package - archives
       '("melpa" . "http://melpa.org/packages/") t)

(package - initialize)
(when(not package - archive - contents)
  (package - refresh - contents))

(defvar myPackages
  '(better - defaults
    ein
    elpy
    flycheck
    material - theme
    exec - path - from-shell
    virtualenvwrapper
    py - autopep8))

(mapc  # '(lambda (package)
    (unless(package - installed - p package)
      (package - install package)))
      myPackages);; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t); ; hide the startup message
(load-theme 'material t); ; load material theme
(global-linum-mode t); ; enable line numbers globally

;; PYTHON CONFIGURATION
;; --------------------------------------
(when(memq window - system '(mac ns))
  (exec-path-from-shell-initialize))
(exec-path-from-shell-copy-env "/bin/bash")
(elpy-enable)
(elpy-use-ipython)
(setq python-shell-interpreter "ipython"
    python-shell-interpreter-args "--simple-prompt -i")
;;(setq python-shell-interpreter "python3")
;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;;(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell)

(setq venv-location "/Users/ThomasSun/.virtualenvs/")

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (exec-path-from-shell py-autopep8 material-theme flycheck elpy ein better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Added by Kite
(load-file "~/.emacs.d/kite.el")
