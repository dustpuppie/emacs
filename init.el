;;; package --- dustpuppie's emacs.d init file -*- lexical-binding: t -*-
;;; Commentary:
;;; Copyright (c) 2004-2020 dustpuppie
;;; Code:

;;_____________________________________________________________________________
;; Debugging
;;_____________________________________________________________________________
(setq debug-on-error t)
(setq debug-on-quit t)
(add-hook 'after-init-hook '(lambda ()
			      (setq debug-on-error nil
				    debug-on-quit  nil)))

;; (require 'cl)
(require 'project)
(require 'package)
;; Add some repositories
(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;;_____________________________________________________________________________
;; do some stuff to make sure use-package et al are installed
;;_____________________________________________________________________________
(when (not package-archive-contents)
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(unless (package-installed-p 'delight)
  (package-refresh-contents)
  (package-install 'delight))

(eval-and-compile
  (require 'bind-key)
  (require 'use-package nil t))

;;_____________________________________________________________________________
;; Change Scratch message
;;_____________________________________________________________________________
(setq initial-scratch-message ";; ╔═╗┌─┐┬─┐┌─┐┌┬┐┌─┐┬ ┬\n;; ╚═╗│  ├┬┘├─┤ │ │  ├─┤\n;; ╚═╝└─┘┴└─┴ ┴ ┴ └─┘┴ ┴\n")

;;_____________________________________________________________________________
;; start emacs server
;;_____________________________________________________________________________
(server-start)
;;_____________________________________________________________________________
;; Tangle config.org file to make config.el
;;_____________________________________________________________________________
(when (file-readable-p "~/.emacs.d/config.org")
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))
(load custom-file)
(provide 'init)
;;; init.el ends here
