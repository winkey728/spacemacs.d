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
(global-set-key (kbd "<S-return>") 'evil-insert-line-below)
(global-set-key (kbd "<C-S-return>") 'evil-insert-line-above)

(when (spacemacs/system-is-mac)
  (global-set-key (kbd "s-d") 'spacemacs/duplicate-line-or-region))

(unless (spacemacs/system-is-mac)
  (global-set-key (kbd "s-=") 'spacemacs/scale-up-font)
  (global-set-key (kbd "s--") 'spacemacs/scale-down-font)
  (global-set-key (kbd "s-0") 'spacemacs/reset-font-size)
  (global-set-key (kbd "s-q") 'save-buffers-kill-terminal)
  (global-set-key (kbd "s-s") 'save-buffer)
  (global-set-key (kbd "s-v") 'yank)
  (global-set-key (kbd "s-c") 'evil-yank)
  (global-set-key (kbd "s-a") 'mark-whole-buffer)
  (global-set-key (kbd "s-x") 'kill-region)
  (global-set-key (kbd "s-w") 'delete-window)
  (global-set-key (kbd "s-W") 'delete-frame)
  (global-set-key (kbd "s-n") 'make-frame)
  (global-set-key (kbd "s-z") 'undo-tree-undo)
  (global-set-key (kbd "s-Z") 'undo-tree-redo)
  (global-set-key (kbd "M-d") 'spacemacs/duplicate-line-or-region))


(spacemacs/declare-prefix "o" "custom")
(spacemacs/declare-prefix "oh" "hydra")

(spacemacs/declare-prefix "ot" "toggle")
(spacemacs/set-leader-keys "otm" 'w/switch-major-mode)

(spacemacs/declare-prefix "ox" "text")
(spacemacs/set-leader-keys "oxi" 'indent-region-or-buffer)
(spacemacs/set-leader-keys "oxI" 'indent-buffer)
(spacemacs/set-leader-keys "oxo" 'evil-insert-line-below)
(spacemacs/set-leader-keys "oxO" 'evil-insert-line-above)

(spacemacs/declare-prefix "ol" "layout")
(spacemacs/set-leader-keys "oll" 'w/load-layouts)
(spacemacs/set-leader-keys "ols" 'w/save-layouts)

(spacemacs/set-leader-keys "pf" 'zilongshanren/open-file-with-projectile-or-counsel-git)
