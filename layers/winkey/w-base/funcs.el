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

;; Find plantuml.jar
(defvar plantuml-cmd-jar-regexp
  '("java -jar \\([.-_@#$/|a-zA-Z0-9]+\\)" . 1))
(defun w/find-plantuml-jar-path ()
  (let ((env (getenv "PLANTUML_JAR_PATH"))
        (executable (executable-find "plantuml")))
    (cond ((not (null env)) env)
          ((not (null executable))
           (if (file-readable-p executable)
               (with-temp-buffer
                 (insert-file-contents executable)
                 (goto-char (point-min))
                 (re-search-forward (car plantuml-cmd-jar-regexp) nil t)
                 (match-string (cdr plantuml-cmd-jar-regexp)))
             nil))
          (t nil))))

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

(defun insert-line-above (&optional arg)
  "Insert an empty line before the current line.
With ARG, insert that many newlines.
Position the cursor at its beginning, according to the current mode."
  (interactive "p")
  (move-beginning-of-line nil)
  (newline arg)
  (forward-line (- arg))
  (indent-according-to-mode)
  )

(defun insert-line-below (&optional arg)
  "Insert an empty line after the current line.
With ARG, insert that many newlines.
Position the cursor at its beginning, according to the current mode."
  (interactive "p")
  (move-end-of-line nil)
  (newline arg)
  (indent-according-to-mode))

(defun evil-insert-line-above (&optional arg)
  "Insert an empty line before the current line, change to INSERT state instead.
With ARG, insert that many newlines.
Position the cursor at its beginning, according to the current mode."
  (interactive "p")
  (insert-line-above arg)
  (when (evil-normal-state-p)
    (evil-insert-state)))

(defun evil-insert-line-below (&optional arg)
  "Insert an empty line after the current line, change to INSERT state instead.
With ARG, insert that many newlines.
Position the cursor at its beginning, according to the current mode."
  (interactive "p")
  (insert-line-below)
  (when (evil-normal-state-p)
    (evil-insert-state)))

(defun enable-minor-mode (pair)
  "Enable minor mode if filename match the regexp.  MY-PAIR is a cons cell (regexp . minor-mode)."
  (if (buffer-file-name)
      (if (string-match (car pair) buffer-file-name)
          (funcall (cdr pair)))))


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

(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indent selected region."))
      (progn
        (indent-buffer)
        (message "Indent buffer.")))))

;;; zilongshanren ends
