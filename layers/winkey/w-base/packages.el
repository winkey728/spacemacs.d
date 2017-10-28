;;; -*- lexical-binding: t -*-
;;; packages.el --- w-base layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Winkey Wong
;; URL: https://github.com/winkey728/spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst w-base-packages
  '(
    smart-semicolon
    )
  )

(defun w-base/init-smart-semicolon ()
  (use-package smart-semicolon
    :defer t
    :init
    (progn
      (add-hook 'c-mode-common-hook #'smart-semicolon-mode)
      (add-hook 'js2-mode-hook #'smart-semicolon-mode)
      (add-hook 'css-mode-hook #'smart-semicolon-mode)
      (add-hook 'rust-mode-hook #'smart-semicolon-mode)
      (add-hook 'sql-mode-hook #'smart-semicolon-mode))))
