;;; -*- lexical-binding: t -*-
;;; packages.el --- w-editing layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Winkey Wong
;; URL: https://github.com/winkey728/spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst w-editing-packages
  '(
    lispy
    lispyville
    multiple-cursors
    hydra
    )
  )

(defun w-editing/init-lispy ()
  (use-package lispy
    :defer t
    :init
    (progn
      (add-hook 'emacs-lisp-mode-hook #'(lambda () (lispy-mode t)))

      (defun conditionally-enable-lispy ()
        (when (eq this-command 'eval-expression)
          (lispy-mode t)))
      (add-hook 'minibuffer-setup-hook 'conditionally-enable-lispy))
    ))

(defun w-editing/init-lispyville ()
  (use-package lispyville
    :after lispy
    :init
    (progn
      (add-hook 'lispy-mode-hook #'lispyville-mode))))

(defun w-editing/init-multiple-cursors ()
  (use-package multiple-cursors
    :init
    (progn
      (define-prefix-command 'w/mc-map))
    :bind
    (:map ctl-x-map
     ("m" . w/mc-map)
     :map w/mc-map
     ;; Really really nice!
     ("i" . mc/insert-numbers)
     ("h" . mc-hide-unmatched-lines-mode)
     ("a" . mc/mark-all-like-this)
     ;; Occasionally useful
     ("d" . mc/mark-all-symbols-like-this-in-defun)
     ("r" . mc/reverse-regions)
     ("s" . mc/sort-regions)
     ("l" . mc/edit-lines)
     ("\C-a" . mc/edit-beginnings-of-lines)
     ("\C-e" . mc/edit-ends-of-lines))
    :bind*
    (("C-s-l" . mc/edit-lines)
     ("C-s-f" . mc/mark-all-dwim)
     ("C-s-." . mc/mark-next-like-this)
     ("s->" . mc/unmark-next-like-this)
     ("C-s-," . mc/mark-previous-like-this)
     ("s-<" . mc/unmark-previous-like-this))
    :config
    (progn
      (setq mc/list-file "~/.spacemacs.d/.mc-lists.el"))))

(defun w-editing/post-init-hydra ()
  (defhydra hydra-multiple-cursors (:color blue)
    "
    ^Prev^          ^Next^          ^Other^
    ----------------------------------------------
    [_p_]   Prev    [_n_]   Next    [_l_] Edit lines
    [_P_]   Skip    [_N_]   Skip    [_a_] Mark all
    [_M-p_] Unmark  [_M-n_] Unmark  [_r_] Mark by regexp
    ^ ^             ^ ^ [_q_] Quit
    "
    ("l" mc/edit-lines :exit t)
    ("a" mc/mark-all-like-this :exit t)
    ("n" mc/mark-next-like-this)
    ("N" mc/skip-to-next-like-this)
    ("M-n" mc/unmark-next-like-this)
    ("p" mc/mark-previous-like-this)
    ("P" mc/skip-to-previous-like-this)
    ("M-p" mc/unmark-previous-like-this)
    ("r" mc/mark-all-in-region-regexp :exit t)
    ("q" nil))
  )
