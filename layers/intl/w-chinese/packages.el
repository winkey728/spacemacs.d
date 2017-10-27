;;; -*- lexical-binding: t -*-
;;; packages.el --- w-chinese layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Winkey Wong
;; URL: https://github.com/winkey728/spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst w-chinese-packages
  '(
    youdao-dictionary
    pangu-spacing
    find-by-pinyin-dired
    ace-pinyin
    )
  )

(defun w-chinese/init-youdao-dictionary ()
  (use-package youdao-dictionary
    :defer t
    :config
    (progn
      ;; enable cache
      (setq url-automatic-caching t
            youdao-dictionary-search-history-file (concat spacemacs-cache-directory ".youdao")
            youdao-dictionary-use-chinese-word-segmentation t))))

(defun w-chinese/init-pangu-spacing ()
  (use-package pangu-spacing
    :commands (global-pangu-spacing-mode pangu-spacing-mode)
    :init
    (progn
      (if chinese-global-pangu-spacing-mode
          (global-pangu-spacing-mode t)
        (add-hook 'text-mode-hook 'pangu-spacing-mode))
      (spacemacs|hide-lighter pangu-spacing-mode)
      ;; always insert real space in `org-mode' and `markdown-mode'
      (add-hook 'org-mode-hook
                '(lambda ()
                   (set (make-local-variable 'pangu-spacing-real-insert-separtor) t)))
      (add-hook 'markdown-mode-hook
                '(lambda ()
                   (set (make-local-variable 'pangu-spacing-real-insert-separtor) t))))))

(defun w-chinese/init-find-by-pinyin-dired ()
  (use-package find-by-pinyin-dired
    :defer t))

(defun w-chinese/init-ace-pinyin ()
  (use-package ace-pinyin
    :commands (ace-pinyin-global-mode ace-pinyin-mode)
    :init
    (progn
      (setq ace-pinyin-use-avy t)
      (if chinese-global-ace-pinyin-model
          (ace-pinyin-global-mode t)
        (add-hook 'text-mode-hook 'ace-pinyin-mode)))
    :config
    (progn
      (spacemacs|hide-lighter ace-pinyin-mode)
      (spacemacs/declare-prefix "ocp" "ace-pinyin")
      (spacemacs/set-leader-keys
        "ocpc" 'avy-goto-char
        "ocpC" 'avy-goto-char-2
        "ocpw" 'avy-goto-word-0
        "ocpW" 'avy-goto-word-1))))
