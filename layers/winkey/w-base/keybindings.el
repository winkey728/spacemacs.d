;;; -*- lexical-binding: t -*-
;;; keybindings.el --- w-base layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Winkey Wong
;; URL: https://github.com/winkey728/spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)
(global-set-key (kbd "<S-return>") 'insert-line-below)
(global-set-key (kbd "<C-S-return>") 'insert-line-above)


(spacemacs/declare-prefix "o" "custom")

(spacemacs/declare-prefix "ot" "toggle")

(spacemacs/declare-prefix "ox" "text")
(spacemacs/set-leader-keys "oxi" 'indent-region-or-buffer)
(spacemacs/set-leader-keys "oxI" 'indent-buffer)
(spacemacs/set-leader-keys "oxo" 'insert-line-below)
(spacemacs/set-leader-keys "oxO" 'insert-line-above)
