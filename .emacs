(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))

;; Show column number on the bottom status bar.
(setq column-number-mode t)

;; Save all backup file in this directory.
(setq backup-directory-alist `(("." . "~/.emacs_backups/")))
(setq backup-by-copying t)

;; Tabs yields 2 spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

;; Use the Solarized color theme
;; git-clone'd from:
;; https://github.com/sellout/emacs-color-theme-solarized
(add-to-list 'load-path "~/.emacs.d/emacs-color-theme-solarized/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized/")
(set-frame-parameter nil 'background-mode 'dark)
(set-terminal-parameter nil 'background-mode 'dark)
(load-theme 'solarized t)

;; Use Emacs Speaks Statistics (ESS)
(add-to-list 'load-path "~/.emacs.d/ESS/lisp/")
(require 'ess-site)

;; Turns off the 'smart' underscore in ESS
;; If on, this feature types " <- " if the underscore is pressed.
(ess-toggle-underscore nil)

;; Loads ESS-tracebug to debug R code within emacs/ESS.
;; The hook loads ESS-tracebug automatically when R is loaded.
;; For more information, see: http://code.google.com/p/ess-tracebug/
(require 'ess-tracebug)
(add-hook 'ess-post-run-hook 'ess-tracebug t)

;; Allows the ability to SSH from emacs.
;; Useful for running R and ESS remotely.
;; See this post:
;; http://blog.nguyenvq.com/2009/06/01/run-a-remote-r-session-in-emacs-emacs-ess-r-ssh/
;;(require 'ssh)

;; Send C-c C-c to remote ESS session
;; See: http://truvue.wordpress.com/2013/02/15/emacs-ess-remote/
(defun ess-remote-ssh ()
(when (string-prefix-p "*ssh" (buffer-name))
(local-set-key (kbd "C-c C-c") 'ssh-send-ctrl-C)))
(add-hook 'inferior-ess-mode-hook 'ess-remote-ssh)

;; markdown-mode for editing Markdown-formatted text files (*.md)
;; See: http://jblevins.org/projects/markdown-mode/
(add-to-list 'load-path "~/.emacs.d/markdown-mode/")
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Use auto-fill-mode to wrap text at line 80
;; See: http://bytepool.wordpress.com/2012/02/15/emacs-auto-fill-mode/
(setq-default fill-column 80)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Python Stuff

;; elpy
(package-initialize)
(elpy-enable)


;; Magit
(global-set-key (kbd "C-x g") 'magit-status)
