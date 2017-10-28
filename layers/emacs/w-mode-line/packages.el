;;; -*- lexical-binding: t -*-
;;; packages.el --- w-mode-line layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Winkey Wong
;; URL: https://github.com/winkey728/spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst w-mode-line-packages
  '(
    spaceline-all-the-icons
    (which-func :location built-in)
    )
  )

(defun w-mode-line/init-spaceline-all-the-icons ()
  (use-package spaceline-all-the-icons
    :after spaceline
    :config
    (progn
      (setq inhibit-compacting-font-caches t)
      (setq spaceline-all-the-icons-separator-type 'arrow)
      (spaceline-toggle-all-the-icons-buffer-path-off)
      (spaceline-toggle-all-the-icons-minor-modes-on)
      (spaceline-toggle-all-the-icons-which-function-on)
      (spaceline-all-the-icons-theme))))

(defun w-mode-line/post-init-which-func ()
  (unless (boundp 'which-func-mode)
    (which-function-mode)))
