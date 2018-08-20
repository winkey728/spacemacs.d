;;; packages.el --- w-better-ui layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Winkey Wong
;; URL: https://github.com/winkey728/spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst w-better-ui-packages
  '(
    beacon
    (display-line-numbers :location built-in)
    (linum :location built-in)
    ;; (which-func :location built-in)
    doom-modeline
    )
  )

(defun w-better-ui/init-beacon ()
  (use-package beacon
    :init
    (progn
      (spacemacs|add-toggle beacon
        :status beacon-mode
        :on (beacon-mode)
        :off (beacon-mode -1)
        :documentation "Light focus cursor after scrolling"
        :evil-leader "otb")
      (spacemacs/toggle-beacon-on))
    :config (spacemacs|hide-lighter beacon-mode)))

(defun w-better-ui/post-init-linum ()
  (add-hook 'prog-mode-hook 'linum-mode)
  (defadvice linum-on (around linum-on-inhibit-for-modes)
    "Disable to show line numbers for some marjor modes"
    (unless (member major-mode better-ui-linum-mode-inhibit-modes-list)
      ad-do-it))
  (ad-activate 'linum-on)
  )

(defun w-better-ui/post-init-display-line-numbers ()
  (setq display-line-numbers-width 2)
  (setq display-line-numbers-grow-only t)
  (set-face-background 'line-number "#313335")
  (set-face-foreground 'line-number-current-line "#859393")
  (add-hook 'web-mode-hook #'display-line-numbers-mode))

;; (defun w-better-ui/init-which-func ()
;;   (use-package which-func
;;     :after spaceline
;;     :init
;;     (progn
;;       (setq which-func-unknown "n/a")
;;       (which-function-mode))
;;     :config
;;     (progn
;;       (when better-ui-show-which-function-header-line
;;         ;; show the current function name in the header line
;;         (defun set-header-line ()
;;           (setq header-line-format
;;                 '((which-func-mode ("" which-func-format " ")))))
;;         (add-hook 'prog-mode-hook 'set-header-line)
;;         (add-hook 'text-mode-hook 'set-header-line)
;;         ;; remove which function mode from the mode line
;;         (setq-default mode-line-misc-info
;;                       (assq-delete-all 'which-function-mode mode-line-misc-info))
;;         (spaceline-toggle-which-function-off)))
;;     )
;;   )

(defun w-better-ui/init-doom-modeline ()
  (use-package doom-modeline
    :defer t
    :hook (after-init . doom-modeline-init)))
