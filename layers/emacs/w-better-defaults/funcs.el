;;; -*- lexical-binding: t -*-
;;; funcs.el --- w-better-defaults layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Winkey Wong
;; URL: https://github.com/winkey728/spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; https://oremacs.com/2017/03/18/dired-ediff/
(defun ora-ediff-files ()
  (interactive)
  (let ((files (dired-get-marked-files))
        (wnd (current-window-configuration)))
    (if (<= (length files) 2)
        (let ((file1 (car files))
              (file2 (if (cdr files)
                         (cadr files)
                       (read-file-name
                        "file: "
                        (dired-dwim-target-directory)))))
          (if (file-newer-than-file-p file1 file2)
              (ediff-files file2 file1)
            (ediff-files file1 file2))
          (add-hook 'ediff-after-quit-hook-internal
                    (lambda ()
                      (setq ediff-after-quit-hook-internal nil)
                      (set-window-configuration wnd))))
      (error "no more than 2 files should be marked"))))

(defun w/dired-open-file-other-window ()
  "Open file other window or enter subdirectory in current buffer"
  (interactive)
  (let ((filename (dired-get-filename nil t)))
    (if (file-directory-p filename)
        (dired-find-alternate-file)
      (dired-find-file-other-window))))
