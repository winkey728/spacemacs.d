;;; -*- lexical-binding: t -*-
;;; packages.el --- w-editing layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Winkey Wong
;; URL: https://github.com/winkey728/spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst w-editing-packages
  '(
    lispy
    lispyville
    )
  )

(defun w-editing/init-lispy ()
  (use-package lispy
    :defer t
    :init
    (progn
      (add-hook 'emacs-lisp-mode-hook #'(lambda () (lispy-mode t)))

      (defun conditionally-enable-lispy ()
        (when (eq this-command 'eval-expression)
          (lispy-mode t)))
      (add-hook 'minibuffer-setup-hook 'conditionally-enable-lispy))
    ))

(defun w-editing/init-lispyville ()
  (use-package lispyville
    :after lispy
    :init
    (progn
      (add-hook 'lispy-mode-hook #'lispyville-mode))))
