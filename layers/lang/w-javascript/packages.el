;;; -*- lexical-binding: t -*-
;;; packages.el --- w-javascript layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Winkey Wong
;; URL: https://github.com/winkey728/spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst w-javascript-packages
  '(
    prettier-js
    json-mode
    )
  )

(defun w-javascript/init-prettier-js ()
  (use-package prettier-js
    :defer t
    :init
    (progn
      (add-hook 'js2-mode-hook 'prettier-js-mode)
      (add-hook 'css-mode-hook 'prettier-js-mode)
      (add-hook 'web-mode-hook #'(lambda ()
                                   (enable-minor-mode
                                    '("\\.css\\'" 'prettier-js-mode))))
      (add-hook 'json-mode-hook 'prettier-js-mode))
    :config
    (progn
      (spacemacs|diminish prettier-js-mode " ⓟt" " pt"))))

(defun w-javascript/post-init-json-mode ()
  (add-to-list 'json-mode-auto-mode-list ".tern-project")
  )
