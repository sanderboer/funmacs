;;=============== LSP MODE ==================;;
;; The path to lsp-mode needs to be added to load-path as well as the
;; path to the `clients' subdirectory.
(add-to-list 'load-path (expand-file-name "lib/lsp-mode" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lib/lsp-mode/clients" user-emacs-directory))

;; Enable lsp.el
(use-package lsp-mode
  :straight t
  :commands (lsp lsp-deferred) 
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  ;; set c/c++ compilation and snippetg
  (setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1)  ;; clangd is fast
  :config
  ;; if you want which-key integration
  (lsp-enable-which-key-integration t)
  :custom
  (lsp-headerline-breadcrumb-enable t)
  :hook
  ;; LSP LANGUAGES SUPPORT
  (c-mode . lsp-deferred)             ; ENABLE C PROGRAMING
  (c++-mode . lsp-deferred)           ; ENABLE C++ PROGRAMING
  (c-or-c++-mode . lsp-deferred)      ; ENABLE C/C++ PROGRAMING
  )

;; Optionaly
;; lsp-ui Enhance UI
(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode))
;; lsp-treemacs integration
(use-package lsp-treemacs
  :after lsp)
