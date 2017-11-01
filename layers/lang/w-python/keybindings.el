;; -*- lexical-binding: t -*-
;;; keybindings.el --- w-python layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Winkey Wong
;; URL: https://github.com/winkey728/spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(spacemacs/set-leader-keys-for-major-mode 'python-mode "Vp" 'w/activate-venv-add-pythonpath)
