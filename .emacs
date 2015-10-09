;; Turn these off immediately to avoid ever seeing them.
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen / startup message.
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Make the scratch buffer empty.
(setq initial-scratch-message "")

;; Setup our load path.
(setq site-lisp-dir (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path site-lisp-dir)

;; Setup platform.
(require 'setup-platform)

;; Setup backups.
(require 'setup-backups)

;; Setup themes.
(require 'setup-themes)

;; Setup packages.
(require 'setup-packages)

;; Installs our packages.
(defun install-packages ()
  (packages-install
   '(s
     f
     dash
     magit
     guide-key
     helm
     projectile
     ag
     helm-projectile
     helm-ag
     company
     yasnippet
     )))

;; Attempts to install our packages.
(condition-case nil
    (install-packages)
  (error
   (package-refresh-contents)
   (install-packages)))

;; Setup sane defaults.
(require 'setup-defaults)

;; Various setup scripts.
;; Order matters here!
(require 'setup-clipboard)
(require 'setup-uniquify)
(require 'setup-guide-key)
(require 'setup-helm)
(require 'setup-projectile)
(require 'setup-helm-projectile)
(require 'setup-company)
(require 'setup-yasnippet)
(require 'setup-cc)


;; (require 'setup-rebuilder)
;; (require 'setup-python)
;; (require 'setup-haskell)
;; (require 'setup-go)
;; (eval-after-load 'lua-mode '(require 'setup-lua))
;; (require 'setup-undo-tree)
;; (require 'setup-mappings)
;; (require 'setup-aliases)
;; (require 'setup-diminish)


