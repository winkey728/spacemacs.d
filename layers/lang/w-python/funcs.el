;; -*- lexical-binding: t -*-
;;; funcs.el --- w-python layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Winkey Wong
;; URL: https://github.com/winkey728/spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun w/activate-venv-add-pythonpath ()
  "Activate python virtualenv in current project and add current project root to PYTHONPATH"
  (interactive)
  (let ((root (projectile-project-root)))
    (when (and root (file-exists-p root))
      (add-to-list 'python-shell-extra-pythonpaths root)
      (when (file-exists-p (concat root "Pipfile"))
        (pyvenv-activate (shell-command-to-string "pipenv --venv"))))))
