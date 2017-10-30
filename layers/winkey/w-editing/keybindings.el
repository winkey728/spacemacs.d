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

(with-eval-after-load "lispy"
  (or (spacemacs/system-is-mac) (define-key lispy-mode-map (kbd "M-d") nil)) ;; do not ovveride copy-line
  (define-key lispy-mode-map (kbd "M-1") 'lispy-describe-inline)
  (define-key lispy-mode-map (kbd "M-2") 'lispy-arglist-inline)
  (define-key lispy-mode-map (kbd "C-m") 'lispy-mark-symbol)
  )

(spacemacs/set-leader-keys "ohm" 'hydra-multiple-cursors/body)
