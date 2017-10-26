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

;; File stat helper functions
(defun file-stat-type (file &optional id-format)
  (car (file-attributes file id-format)))
(defun file-stat-name-number (file &optional id-format)
  (cadr (file-attributes file id-format)))
(defun file-stat-uid (file &optional id-format)
  (nth 2 (file-attributes file id-format)))
(defun file-stat-gid (file &optional id-format)
  (nth 3 (file-attributes file id-format)))
(defun file-stat-atime (file &optional id-format)
  (nth 4 (file-attributes file id-format)))
(defun file-stat-mtime (file &optional id-format)
  (nth 5 (file-attributes file id-format)))
(defun file-stat-ctime (file &optional id-format)
  (nth 6 (file-attributes file id-format)))
(defun file-stat-size (file &optional id-format)
  (nth 7 (file-attributes file id-format)))
(defun file-stat-modes (file &optional id-format)
  (nth 8 (file-attributes file id-format)))
(defun file-stat-guid-changep (file &optional id-format)
  (nth 9 (file-attributes file id-format)))
(defun file-stat-inode-number (file &optional id-format)
  (nth 10 (file-attributes file id-format)))
(defun file-stat-system-number (file &optional id-format)
  (nth 11 (file-attributes file id-format)))
(defun file-attr-type (attr)
  (car attr))
(defun file-attr-name-number (attr)
  (cadr attr))
(defun file-attr-uid (attr)
  (nth 2 attr))
(defun file-attr-gid (attr)
  (nth 3 attr))
(defun file-attr-atime (attr)
  (nth 4 attr))
(defun file-attr-mtime (attr)
  (nth 5 attr))
(defun file-attr-ctime (attr)
  (nth 6 attr))
(defun file-attr-size (attr)
  (nth 7 attr))
(defun file-attr-modes (attr)
  (nth 8 attr))
(defun file-attr-guid-changep (attr)
  (nth 9 attr))
(defun file-attr-inode-number (attr)
  (nth 10 attr))
(defun file-attr-system-number (attr)
  (nth 11 attr))

;; Interactively change current buffer major mode
(defvar w/switch-major-mode-history nil)
(defun w/switch-major-mode (mode)
  (interactive
   (list
    (intern
     (completing-read "Switch to mode: "
                      obarray
                      (lambda (s)
                        (let ((oldmode major-mode) major-mode-p)
                          (and (fboundp s)
                               (string-match "-mode$" (symbol-name s))
                               (progn
                                 (setq major-mode s)
                                 (if (derived-mode-p 'prog-mode 'text-mode 'special-mode)
                                     (setq major-mode-p t)
                                   (setq major-mode-p nil))
                                 (setq major-mode oldmode)
                                 major-mode-p))))
                      t
                      nil
                      'w/switch-major-mode-history))))
  (setq w/switch-major-mode-history
        (cons (symbol-name major-mode) w/switch-major-mode-history))
  (funcall mode))


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
