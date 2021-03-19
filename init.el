(require 'package)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
	("org" . "https://orgmode.org/elpa/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 0)
(menu-bar-mode -1)

;; stop creating those backup~ files
(setq make-backup-files nil)

;; stop creating those #auto-save# files
(setq auto-save-default nil)

;; https://ember-cli.com/user-guide/#emacs but create-react-app watcher
(setq create-lockfiles nil)

;; When a file is updated outside emacs, make it
;; update if it's already opened in emacs
(global-auto-revert-mode 1)

;; turn on bracket match highlight
(show-paren-mode 1)

;; show cursor position within line
(column-number-mode 1)

;; y or n is enough
(defalias 'yes-or-no-p 'y-or-n-p)

;; wrap long lines by word boundary, and arrow up/down move by visual line, etc
;; options are visual-line-mode vs. toggle-truncate-lines
;; (global-visual-line-mode t)
(setq-default word-wrap t)

;; Line Numbers
(global-display-line-numbers-mode)
;; (dolist (mode '(org-mode-hook
;; 		shell-mode-hook
;; 		;; TODO: More
;; 		term-mode-hook
;; 		eshell-mode-hook))
;;   (add-hook mode (lambda ()
;; 		   (display-line-numbers-mode 0))))

;; https://emacsredux.com/blog/2013/05/22/smarter-navigation-to-the-beginning-of-a-line/
(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))
  ;; example where arg != 1: ( C-u C-a )

  ;; Move lines first (allows move-beg +/- n lines)
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key (kbd "C-a") 'smarter-move-beginning-of-line)

(defun fc-eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(global-set-key (kbd "C-c e") 'fc-eval-and-replace)


;; no beep on scroll
;; https://stackoverflow.com/questions/11679700/emacs-disable-beep-when-trying-to-move-beyond-the-end-of-the-document#answer-11679758
(defun my-bell-function ()
  (unless (memq this-command
        '(isearch-abort abort-recursive-edit exit-minibuffer
              keyboard-quit mwheel-scroll down up next-line previous-line
              backward-char forward-char))
    (ding)))

(setq ring-bell-function 'my-bell-function)


;; rainbow-delimiters
(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config (setq which-key-idle-delay 0.3)
  )
  
(find-file "~/.emacs.d/init.el")

;; Swiper
(use-package swiper :diminish)

;; Counsel
(use-package counsel :diminish
  :bind
  (("M-x" . counsel-M-x)
   ;; I don't like that counsel-ibuffer gives default value of the current buffer
   ;; means `C-x b`, `<Enter>` doesn't auto switch to last used buffer...
   ;; Also, doesn't seem to let me create new buffers??
   ;; ("C-x b" . counsel-ibuffer)
   ("C-x C-f" . counsel-find-file)))

;; Ivy
(use-package ivy
  :diminish
  :bind
  (("C-s" . swiper)
   ("C-c C-r" . ivy-resume))
  :config
  (ivy-mode 1)
  (setq ivy-wrap t)
  ;; (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d)"))

;; Ivy Rich
(use-package ivy-rich
  :init
  (ivy-rich-mode))

;; Helpful
(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

;; Note: The first time you load your configuration on a
;; new machine, you'll need to run the following command
;; interactively so that mode line icons display correctly:
;; 
;; M-x all-the-icons-install-fonts
(use-package all-the-icons)

;; Doom Modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package doom-themes
  :init (load-theme 'doom-gruvbox t))

(use-package racket-mode
  :mode ("\\.rkt\\'" . racket-mode)
  :hook (racket-mode . racket-xp-mode)
  :config
  (setq racket-show-functions '(racket-show-echo-area)))

;; Paredit

(use-package paredit
  :hook ((emacs-lisp-mode . enable-paredit-mode)
	 (eval-expression-minibuffer-setup . enable-paredit-mode)
	 ;;(ielm-mode . enable-paredit-mode)
	 (lisp-mode . enable-paredit-mode)
	 (lisp-interaction-mode . enable-paredit-mode)
	 (scheme-mode . enable-paredit-mode)
	 (racket-mode . enable-paredit-mode)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(racket-xp-mode racket-xp racket-mode doom-themes helpful ivy-rich which-key rainbow-delimiters doom-modeline counsel swiper ivy use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
