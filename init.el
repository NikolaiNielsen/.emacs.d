;; .emacs.d/init.el

;; ===================================
;; MELPA Package Support
;; ===================================

;; Enables basic packaging support
(require 'package)


;; Adds the Melpa archive to the list of available repositories
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; Initializes the package infrastructure
(package-initialize)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))


;; List of packages to install
(defvar myPackages
  '(better-defaults ;; Better default settings for emacs
    doom-themes     ;; Themes
    elpy            ;; Better Python mode
    flycheck        ;; Syntax checking for Python
    )
  )

;; Scan myPackages and install packages if needed
(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      myPackages)
;; ===================================
;; Basic Customization
;; ===================================
(setq inhibit-startup-message t)    ;; Hide the startup message
(global-linum-mode t)               ;; Enable line numbers globally
(global-visual-line-mode 1)         ;; Soft line wrapping
(global-hl-line-mode 1)             ;; Highlight current row
(show-paren-mode 1)                 ;; Matches parentheses globally
(setq calendar-week-start-day 1)    ;; Start with monday


;; ===================================
;; Themes
;; ===================================
(require 'doom-themes)
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)
; (load-theme 'doom-zenburn t)
(load-theme 'doom-acario-light t)


;; ===================================
;; Org-modde
;; ===================================
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done 'time) ; Show timestamp of when task marked as done
(setq org-catch-invisible-edits t)


;; ===================================
;; Python
;; ===================================
;; Enable elpy
(elpy-enable)

;; Enable flycheck in elpy-mode
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; use IPython
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;; set default running directory
(setq elpy-shell-starting-directory 'current-directory)


;; User-Defined init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(flycheck elpy doom-themes material-theme better-defaults)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
