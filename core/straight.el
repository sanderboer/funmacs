;;================== PACKAGE MANAGER ==================;;
;; DISABLE package.el INFAVOUR OF straight.el
(setq package-enable-at-startup nil)

;; BOOTSTRAPING straight.el 
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; INITIALIZED USE-PACKAGES
(straight-use-package 'use-package)
(setq use-package-always-ensure t)
;; CONFIGURE use-package TO USE straight.el BY DEFAULT
(use-package straight
  :custom (straight-use-package-by-default t))
