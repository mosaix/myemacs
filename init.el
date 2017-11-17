(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)


(set-face-attribute 'default nil :font "Envy Code R-14" )
(set-frame-font "Envy Code R-14" nil t)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(require 'doom-themes)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled
(load-theme 'doom-one t)
(doom-themes-visual-bell-config)
(doom-themes-neotree-config)
(doom-themes-org-config)


(setq linum-format "%4d \u2502 ")
(global-linum-mode 1)

(require 'ido)
(ido-mode t)
(ido-everywhere t)

(require 'ido-completing-read+)
(ido-ubiquitous-mode 1)

(global-set-key (kbd "C-x +") 'zoom)

(require 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)
(global-set-key (kbd "C-x 1") 'switch-window-then-maximize)
(global-set-key (kbd "C-x 2") 'switch-window-then-split-below)
(global-set-key (kbd "C-x 3") 'switch-window-then-split-right)
(global-set-key (kbd "C-x 0") 'switch-window-then-delete)
(setq switch-window-shortcut-style 'qwerty)
(setq switch-window-qwerty-shortcuts
      '("a" "s" "d" "f" "j" "k" "l" ";" "w" "e" "i" "o"))
(setq switch-window-shortcut-appearance 'image)

(add-hook 'foo-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;;(require 'icicles)
;;(icy-mode 1)

(nyan-mode 1)
(nyan-start-animation)

;; HELM Config start

(require 'helm-config)
(helm-mode 1)

;;HELM config End.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (dired-k ivy nyan-mode icicles rainbow-delimiters switch-window zoom zenburn-theme telephone-line tabbar smex smart-mode-line powerline-evil paradox neotree multi-compile mode-icons magit ido-completing-read+ highlight-parentheses helm elscreen doom-themes dashboard)))
 '(paradox-github-token t)
 '(zoom-size (quote (0.618 . 0.618))))

(when (fboundp 'winner-mode)
  (winner-mode 1))

(require 'paradox)
(paradox-enable)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(require 'dired-k)
(define-key dired-mode-map (kbd "K") 'dired-k)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
