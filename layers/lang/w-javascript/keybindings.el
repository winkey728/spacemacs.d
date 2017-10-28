;;; -*- lexical-binding: t -*-
;;; keybindings.el --- w-javascript layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Winkey Wong
;; URL: https://github.com/winkey728/spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(spacemacs/declare-prefix-for-mode 'js2-mode "t" "toggle")
(spacemacs/set-leader-keys-for-major-mode 'js2-mode "tf" 'prettier-js-mode)
(spacemacs/declare-prefix-for-mode 'web-mode "t" "toggle")
(spacemacs/set-leader-keys-for-major-mode 'web-mode "tf" 'prettier-js-mode)
(spacemacs/declare-prefix-for-mode 'json-mode "t" "toggle")
(spacemacs/set-leader-keys-for-major-mode 'json-mode "tf" 'prettier-js-mode)
