;;; -*- lexical-binding: t _*_
;;; packages.el --- w-better-defaults layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Winkey Wong
;; URL: https://github.com/winkey728/spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst w-better-defaults-packages
  '(
    (dired-mode :location built-in)
    peep-dired
    (profiler :location built-in)
    (recentf :location built-in)
    )
  )

(defun w-better-defaults/init-dired-mode ()
  (use-package dired-mode
    :defer t
    :init
    (progn
      (require 'dired-x)
      (require 'dired-aux) ;; this two packages is the extentions of dired-mode

      (setq dired-listing-switches "-aBhl --group-directories-first") ;; dired sorting
      (setq dired-guess-shell-alist-user
            '(("\\.pdf\\'" "open")
              ("\\.\\(?:doc\\|docx\\)\\'" "open")
              ("\\.\\(?:jpg\\|jpeg\\|png\\|gif\\|xpm\\)\\'" "open")
              ("\\.\\(?:mp4\\|mkv\\|avi\\|flv\\|ogv\\)\\(?:\\.part\\)?\\'" "open")
              ("\\.\\(?:mp3\\|flac\\)\\'" "open"))) ;; run the command to open these files
      (setq dired-omit-files
            (concat dired-omit-files "\\|^.DS_Store$\\|^.projectile$\\|\\.js\\.meta$\\|\\.meta$"))

      ;; always delete and copy recursively
      (setq dired-recursive-copies 'always)
      (setq dired-recursive-deletes 'always))
    )
  )

(defun w-better-defaults/init-peep-dired ()
  (use-package peep-dired
    :defer t
    :commands (peep-dired-prev-file
               peep-dired-next-file
               peep-dired-scroll-page-up
               peep-dired-scroll-page-down)
    :init
    (progn
      (setq peep-dired-ignored-extensions
            '(
              "mp4"
              "mkv"
              "avi"
              "flv"
              "ogv"
              "mp3"
              "iso"
              ))
      ))
  )

(defun w-better-defaults/post-init-recentf ()
  (setq recentf-exclude
        '("COMMIT_MSG"
          "COMMIT_EDITMSG"
          "github.*txt$"
          "/tmp/"
          "/ssh:"
          "/sudo:"
          "/TAGS$"
          "/GTAGS$"
          "/GRAGS$"
          "/GPATH$"
          "\\.mkv$"
          "\\.mp[34]$"
          "\\.avi$"
          "\\.pdf$"
          "\\.sub$"
          "\\.srt$"
          "\\.ass$"
          ".*png$"
          ".*jpg$"
          ".*jpeg$"
          ".*gif$"))
  (setq recentf-max-saved-items 2048))

(defun w-better-defaults/init-profiler ()
  (use-package profiler
    :init
    (evilified-state-evilify profiler-report-mode profiler-report-mode-map)))
