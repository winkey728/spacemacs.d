;;; config.el --- w-better-ui layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Winkey Wong
;; URL: https://github.com/winkey728/spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar better-ui-linum-mode-inhibit-modes-list '(eshell-mode
                                                  shell-mode
                                                  profiler-report-mode
                                                  ffip-diff-mode
                                                  dictionary-mode
                                                  erc-mode
                                                  browse-kill-ring-mode
                                                  etags-select-mode
                                                  dired-mode
                                                  help-mode
                                                  text-mode
                                                  fundamental-mode
                                                  jabber-roster-mode
                                                  jabber-chat-mode
                                                  inferior-js-mode
                                                  inferior-python-mode
                                                  inferior-scheme-mode
                                                  twittering-mode
                                                  compilation-mode
                                                  weibo-timeline-mode
                                                  woman-mode
                                                  Info-mode
                                                  calc-mode
                                                  calc-trail-mode
                                                  comint-mode
                                                  gnus-group-mode
                                                  inf-ruby-mode
                                                  gud-mode
                                                  org-mode
                                                  org-agenda-mode
                                                  vc-git-log-edit-mode
                                                  log-edit-mode
                                                  term-mode
                                                  spacemacs-buffer-mode
                                                  w3m-mode
                                                  speedbar-mode
                                                  gnus-summary-mode
                                                  gnus-article-mode
                                                  calendar-mode)
  "List of marjor modes be disabled to show line numbers")
