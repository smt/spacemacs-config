(defvar smt-packages
  '(
    ;; package smts go here
    cljsbuild-mode
    company-go
    dockerfile-mode
    editorconfig
    evil-matchit
    geben
    go-mode
    haml-mode
    jade-mode
    jekyll-modes
    js-doc
    jsx-mode
    karma
    ;; lein ;; BORKED
    moz
    nodejs-repl
    om-mode
    pandoc-mode
    php-mode
    php-boris
    php-boris-minor-mode
    php-refactor-mode
    ;; phpunit
    repl-toggle
    rust-mode
    sass-mode
    skewer-mode
    stylus-mode
    yaml-mode
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar smt-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function smt/init-<package-smt>
;;
;; (defun smt/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

(defun smt/init-cljsbuild-mode ()
  (use-package cljsbuild-mode
    :defer t))

(defun smt/init-company-go ()
  (use-package company-go
    :defer t))

(defun smt/init-dockerfile-mode ()
  (use-package dockerfile-mode
    :defer t))

(defun smt/init-editorconfig ()
  (use-package editorconfig
    :defer t))

(defun smt/init-evil-matchit ()
  (use-package evil-matchit
    :defer t))

(defun smt/init-geben-mode ()
  (use-package geben-mode
    :defer t))

(defun smt/init-go-mode ()
  (use-package go-mode
    :defer t))

(defun smt/init-haml-mode ()
  (use-package haml-mode
    :defer t))

(defun smt/init-jade-mode ()
  (use-package jade-mode
    :defer t))

(defun smt/init-jekyll-modes ()
  (use-package jekyll-modes
    :defer t))

(defun smt/init-js-doc ()
  (use-package js-doc
    :defer t))

;; (defun smt/init-js2-mode ()
;;   (use-package js2-mode
;;     :defer t
;;     :commands (js2-minor-mode)
;;     :init
;;     (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;;     (add-to-list 'interpreter-mode-alist '("node" . js2-mode))))

;; (defun smt/init-js2-refactor ()
;;   (use-package js2-refactor
;;     :defer t))

(defun smt/init-jsx-mode ()
  (use-package jsx-mode
    :defer t))

(defun smt/init-karma ()
  (use-package karma
    :defer t))

(defun smt/init-moz ()
  (use-package moz
    :defer t))

(defun smt/init-nodejs-repl ()
  (use-package nodejs-repl
    :defer t))

(defun smt/init-om-mode ()
  (use-package om-mode
    :defer t))

(defun smt/init-pandoc-mode ()
  (use-package pandoc-mode
    :defer t))

(defun smt/init-php-mode ()
  (use-package php-mode
    :defer t))

(defun smt/init-php-boris ()
  (use-package php-boris
    :defer t))

(defun smt/init-php-boris-minor-mode ()
  (use-package php-boris-minor-mode
    :defer t))

(defun smt/init-php-refactor-mode ()
  (use-package php-refactor-mode
    :defer t))

(defun smt/init-repl-toggle ()
  (use-package repl-toggle
    :defer t))

(defun smt/init-rust-mode ()
  (use-package rust-mode
    :defer t))

(defun smt/init-sass-mode ()
  (use-package sass-mode
    :defer t))

(defun smt/init-skewer-mode ()
  (use-package skewer-mode
    :defer t
    :init
    (add-hook 'js2-mode-hook 'skewer-mode)
    (add-hook 'css-mode-hook 'skewer-css-mode)
    (add-hook 'html-mode-hook 'skewer-html-mode)))

(defun smt/init-stylus-mode ()
  (use-package stylus-mode
    :defer t))

;; (defun smt/init-tern ()
;;   (use-package tern
;;     :defer t
;;     :init
;;     (add-hook 'js-mode-hook (lambda () (tern-mode t)))))

;; (defun smt/init-tern-auto-complete ()
;;   (use-package tern-auto-complete
;;     :defer t
;;     :init
;;     (add-hook 'js-mode-hook (lambda () (tern-mode t)))
;;     :config
;;     '(progn
;;       (tern-ac-setup)
;;       (setq tern-ac-on-dot t)
;;       (defun delete-tern-process ()
;;         (interactive)
;;         (delete-process "Tern")))))

(defun smt/init-yaml-mode ()
  (use-package yaml-mode
    :defer t))
