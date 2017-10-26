;;; -*- lexical-binding: t _*_
;;; keybindings.el --- w-better-defaults layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Winkey Wong
;; URL: https://github.com/winkey728/spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(evilified-state-evilify-map dired-mode-map
  :mode dired-mode
  :bindings
  (kbd "C-u") 'dired-up-directory
  "<RET>" 'dired-find-alternate-file
  "r" 'dired-toggle-read-only
  "F" 'w/dired-open-file-other-window
  "e" 'ora-ediff-files
  "P" 'peep-dired
  "p" 'peep-dired-prev-file
  "n" 'peep-dired-next-file
  "," 'peep-dired-scroll-page-up
  "." 'peep-dired-scroll-page-down
  "f" 'counsel-find-file
  "g" 'zilongshanren/open-file-with-projectile-or-counsel-git
  ")" 'dired-omit-mode)
