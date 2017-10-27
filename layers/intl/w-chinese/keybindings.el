;;; -*- lexical-binding: t -*-
;;; packages.el --- w-chinese layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Winkey Wong
;; URL: https://github.com/winkey728/spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(spacemacs/declare-prefix "oc" "chinese")
(spacemacs/set-leader-keys "ocy" 'youdao-dictionary-search-at-point+)
(spacemacs/set-leader-keys "ocd" 'find-by-pinyin-dired)

(spacemacs/set-leader-keys "ots" 'pangu-spacing-mode)
(spacemacs/set-leader-keys "otp" 'ace-pinyin-mode)
