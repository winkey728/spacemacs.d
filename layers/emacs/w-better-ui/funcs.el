;;; -*- lexical-binding: t -*-
;;; funcs.el --- w-better-ui layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Winkey Wong
;; URL: https://github.com/winkey728/spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; below definitions are copied from zilongshanren
;;; https://github.com/zilongshanren/spacemacs-private

(defun zilongshanren/git-project-root ()
  "Return the project root for current buffer."
  (let ((directory default-directory))
    (locate-dominating-file directory ".git")))

(defun zilongshanren/open-file-with-projectile-or-counsel-git ()
  (interactive)
  (if (zilongshanren/git-project-root)
      (counsel-git)
    (if (projectile-project-p)
        (projectile-find-file)
      (counsel-file-jump))))

;;; zilongshanren ends
