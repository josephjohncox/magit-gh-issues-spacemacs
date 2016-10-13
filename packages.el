;;; packages.el --- Github Issues Layer packages File for Spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq gh-issues-packages
      '(
        gh
        gh-issues
        gh-users
        (magit-gh-issues :location (recipe :fetcher github :repo "josephjohncox/magit-gh-issues"))
        ;; this package does not exits, we need it to wrap
        ;; the call to spacemacs/declare-prefix.
        (spacemacs-github :location built-in)
        ))

(defun gh-issues/init-magit-gh-issues ()
  (spacemacs|use-package-add-hook magit
    :pre-config
    (progn
      (use-package magit-gh-issues
        :init
        (progn
          (defun spacemacs/load-gh-issues-mode ()
            "Start `magit-gh-issues-mode' only after a manual request."
            (interactive)
            (magit-gh-issues-mode)
            (magit-gh-issues-popup))

          (define-key magit-mode-map "@" 'spacemacs/load-gh-issues-mode))
        :config
        (spacemacs|diminish magit-gh-issues-mode "Github-Issues")))))

