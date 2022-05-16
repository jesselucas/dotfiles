;; disable default package manager 
(setq package-enable-at-startup nil)

;; change defaults
(setq gc-cons-threshold (* 200 1024 1024))
(setq read-process-output-max (* 20 1024 1024)) ;; 20mb

;; set path incase not open from shell
(setenv "PATH"
	(concat
	 (concat (getenv "HOME") "/code/github.com/flutter/flutter/bin" ":") (concat (getenv "HOME") "/Android/Sdk/platform-tools" ":")
	 (concat (getenv "HOME") "/Android/Sdk/tools" ":")
	 (getenv "PATH")))

;; setup straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; package list
(straight-use-package 'evil)
(straight-use-package 'magit)
(straight-use-package 'counsel)

;; enable ivy
(ivy-mode)
(global-set-key (kbd "C-M-s") 'swiper)
(global-set-key (kbd "C-M-j") 'avy-goto-char)
(global-set-key (kbd "C-c r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

;; setup evil
(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)

;; evil keymaps
(define-key evil-normal-state-map (kbd "TAB") 'forward-button)

;; remap C-u
(global-set-key (kbd "C-s-u") 'universal-argument)


;; setup dart/flutter
(straight-use-package 'dart-mode)
(straight-use-package 'lsp-mode)
(straight-use-package 'lsp-dart)
(straight-use-package 'lsp-treemacs)
(straight-use-package 'flycheck)
(straight-use-package 'company)
(straight-use-package 'lsp-ui)
(straight-use-package 'hover)
(straight-use-package 'lsp-ivy)

(add-hook 'dart-mode-hook 'lsp)
(defun jrl-lsp-format-on-save-hook ()
  (when (bound-and-true-p lsp-mode)
    (lsp-format-buffer)))
(add-hook 'before-save-hook 'jrl-lsp-format-on-save-hook)
(setq lsp-keymap-prefix "C-c l")

;; org-roam
(straight-use-package 'org-roam)
(setq org-roam-directory (file-truename "~/code/github.com/jesselucas/zettelkasten"))
(org-roam-db-autosync-mode)
(global-set-key (kbd "C-c n f") 'org-roam-node-find)
(global-set-key (kbd "C-c n i") 'org-roam-node-insert)
(define-key evil-normal-state-map [remap evil-ret] 'org-open-at-point)
(org-roam-setup)

;; org-roam dailies in /daily sub dir
(setq org-roam-dailies-directory "daily/")
(setq org-roam-dailies-capture-templates
      '(("d" "default" entry
         "* %?"
         :target (file+head "%<%Y-%m-%d>.org"
                            "#+title: %<%Y-%m-%d>\n"))))

;; org-roam inbox 
(defun jrl/org-roam-capture-inbox ()
  (interactive)
  (org-roam-capture- :node (org-roam-node-create)
                     :templates '(("i" "inbox" plain "* %?"
                                  :if-new (file+head "inbox.org" "#+title: Inbox\n")))))
(global-set-key (kbd "C-c n b") #'jrl/org-roam-capture-inbox)


;; org-roam inbox 
(defun jrl/org-roam-capture-photobook ()
  (interactive)
  (org-roam-capture- :node (org-roam-node-create)
                     :templates '(("i" "inbox" plain "* %?"
                                  :if-new (file+head "inbox.org" "#+title: Inbox\n")))))
(global-set-key (kbd "C-c n b") #'jrl/org-roam-capture-inbox)

;; Theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(modus-vivendi)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; global modes
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook 'hl-line-mode)
