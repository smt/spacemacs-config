;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; Configuration Layers
;; --------------------

(setq-default
 ;; List of additional paths where to look for configuration layers.
 ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
 dotspacemacs-configuration-layer-path '()
 ;; List of configuration layers to load.
 dotspacemacs-configuration-layers '(clojure company-mode git html javascript org-repo-todo osx perspectives smt)
 ;; A list of packages and/or extensions that will not be install and loaded.
 dotspacemacs-excluded-packages '()
 )

;; Settings
;; --------

(setq-default
 ;; Default theme applied at startup
 dotspacemacs-default-theme 'monokai
 ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
 ;; the commands bound to the current keystrokes.
 dotspacemacs-guide-key-delay 0.4
 ;; If non nil the frame is fullscreen when Emacs starts up (Emacs 24.4+ only).
 dotspacemacs-fullscreen-at-startup nil
 ;; If non nil the frame is maximized when Emacs starts up (Emacs 24.4+ only).
 ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
 dotspacemacs-maximized-at-startup t
 ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth scrolling
 ;; overrides the default behavior of Emacs which recenters the point when
 ;; it reaches the top or bottom of the screen
 dotspacemacs-smooth-scrolling t
 ;; If non nil pressing 'jk' in insert state, ido or helm will activate the
 ;; evil leader.
 dotspacemacs-feature-toggle-leader-on-jk nil
 ;; The default package repository used if no explicit repository has been
 ;; specified with an installed package.
 ;; Not used for now.
 dotspacemacs-default-package-repository nil
 )

;; Initialization Hooks
;; --------------------

(defun dotspacemacs/init ()
  "User initialization for Spacemacs. This function is called at the very
 startup."

  ;; Enable mouse support
  (unless window-system
    (require 'mouse)
    (xterm-mouse-mode t)
    (global-set-key [mouse-4] (lambda ()
                                (interactive)
                                (scroll-down 1)))
    (global-set-key [mouse-5] (lambda ()
                                (interactive)
                                (scroll-up 1)))
    (defun track-mouse (e))
    (setq mouse-sel-mode t
          mouse-yank-at-point t)
    )

  (setq x-select-enable-clipboard t
        x-select-enable-primary t
        save-interprogram-paste-before-kill t
        apropos-do-all t
        require-final-newline t
        visible-bell t
        ediff-window-setup-function 'ediff-setup-windows-plain
        git-enable-github-support t)
  )

(defun dotspacemacs/config ()
  "This is were you can ultimately override default Spacemacs configuration.
This function is called at the very end of Spacemacs initialization."

  ;; the one true font
  (spacemacs/set-font "Inconsolata-dz" 12)

  ;; (setq-default web-mode-markup-indent-offset 4
  ;;               web-mode-css-indent-offset 4
  ;;               web-mode-code-indent-offset 4)

  ;; enable yasnippets globally, because why not?
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"                        ;; personal snippets
                           "~/.emacs.d/private/smt/extensions/snippets" ;; foo-mode and bar-mode snippet collection
                           yas-installed-snippets-dir                   ;; the default collection
                           ))
  (yas-global-mode 1)

  ;; use evil-matchit everywhere
  (global-evil-matchit-mode 1)

  ;; kind of useless, as i tend to use terminal
  (setq powerline-default-separator 'wave)

  ;; line numbers when i'm coding pls
  (add-to-hooks #'linum-mode '(c-mode-hook
                               clojure-mode-hook
                               css-mode-hook
                               dockerfile-mode-hook
                               emacs-lisp-mode-hook
                               go-mode-hook
                               haml-mode-hook
                               haskell-mode-hook
                               html-mode-hook
                               jade-mode-hook
                               jekyll-html-mode-hook
                               js2-mode-hook
                               jsx-mode-hook
                               lisp-mode-hook
                               php-mode-hook
                               python-mode-hook
                               sass-mode-hook
                               scss-mode-hook
                               stylus-mode-hook
                               text-mode-hook
                               web-mode-hook
                               yaml-mode-hook
                               ))

  (setq linum-format "%4d ")

  ;; TODO move js2-mode settings to config layer
  (setq js2-basic-offset 2
        js2-bounce-indent-p t)
  (add-hook 'js2-mode-hook (lambda ()
                             (electric-indent-mode -1)))

  ;; Org mode agenda files
  (setq org-agenda-files (list "~/Documents/todo.org")
        org-agenda-start-on-weekday 0)
  ;; (add-hook 'org-mode-hook (lambda ()
  ;;                            (load-theme 'leuven t)
  ;;                            (spacemacs/set-font "Inconsolata-dz" 12)))

  (setq rcirc-server-alist
        '(("irc.freenode.net"
           :nick "smtudor"
           :user-name "smtudor"
           :full-name "Stephen Tudor"
           :channels (
                      "#clojurescript"
                      "#docker"
                      "#duckduckgo"
                      "#emacs"
                      "##javascript"
                      "#meteor"
                      "#Node.js"
                      "#openvpn"
                      "#reactjs"
                      "#sass"
                      "#tmux"
                      "#vim"
                      ))))

  ;; (setq rcirc-authinfo
  ;;       '(("freenode" nickserv "smtudor" "s3cr3t")))

  (defvar rcirc-authinfo-file-name
    "~/.rcirc-authinfo"
    "File containing rcirc authentication passwords.
The file consists of a single list, with each element itself a
list with a SERVER-REGEXP string, a NICK-REGEXP string, a METHOD
and the remaining method specific ARGUMENTS.  The valid METHOD
symbols are `nickserv', `chanserv' and `bitlbee'.

The required ARGUMENTS for each METHOD symbol are:
  `nickserv': PASSWORD
  `chanserv': CHANNEL PASSWORD
  `bitlbee': PASSWORD

Example:
 ((\"freenode\" \"bob\" nickserv \"p455w0rd\")
  (\"freenode\" \"bob\" chanserv \"#bobland\" \"passwd99\")
  (\"bitlbee\" \"robert\" bitlbee \"sekrit\"))")

  (defvar rcirc-auto-authenticate-flag (file-readable-p rcirc-authinfo-file-name)
    "*Non-nil means automatically send authentication string to server.
See also `rcirc-auth'")

  )

;; Custom variables
;; ----------------

;; Do not write anything in this section. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-ispell-requires 4)
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(paradox-github-token t)
 '(ring-bell-function (quote ignore) t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
