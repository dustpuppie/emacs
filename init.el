;;; package --- dustpuppie's emacs.d init file -*- lexical-binding: t -*-
;;; Commentary:
;;; Copyright (c) 2004-2020 dustpuppie
;;; Code:

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
