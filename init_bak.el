;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; load emacs 24's package system. Add MELPA repository.

(require 'package)
;;(setq package-enable-at-startup nil)
(add-to-list
 'package-archives
 '("melpa" . "http://melpa.milkbox.net/packages/") t)

(add-to-list
 'package-archives
 '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Save on lose focus. By bbatsov
(unless (package-installed-p 'super-save)
  (package-refresh-contents)
  (package-install 'super-save))

(super-save-mode +1)

;; Project Management. By bbatsov
(unless (package-installed-p 'projectile)
  (package-refresh-contents)
  (package-install 'projectile))

(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)


;; see https://indium.readthedocs.io/en/latest/installation.html
;; (unless (package-installed-p 'indium)
;;   (package-refresh-contents)
;;   (package-install 'indium))

;; https://github.com/purcell/exec-path-from-shell
;; (unless (package-installed-p 'exec-path-from-shell)
;;   (package-install 'exec-path-from-shell))

;; (when (memq window-system '(mac ns x))
;;   (exec-path-from-shell-initialize))

(unless (package-installed-p 'try)
  (package-install 'try))

(use-package try
  :ensure t)

;; (unless (package-installed-p 'which-key)
;;   (package-install 'which-key))

;; (use-package which-key
;;   :ensure t
;;   :config (which-key-mode))

;; (setq inhibit-startup-message t)

;; (tool-bar-mode -1)
;; (scroll-bar-mode -1)

;; load Indium from its source code
;; (add-to-list 'load-path "~/projects/indium")
;; (require 'indium)

;; (unless (package-installed-p 'tide)
;;   (package-refresh-contents)
;;   (package-install 'tide))

(unless (package-installed-p 'flycheck)
  (package-refresh-contents)
  (package-install 'flycheck))

;;(global-flycheck-mode)

;; (unless (package-installed-p 'js2-mode)
;;   (package-install 'js2-mode))

;; (unless (package-installed-p 'rjsx-mode)
;;   (package-install 'rjsx-mode))

;; (add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))

(unless (package-installed-p 'web-mode)
  (package-install 'web-mode))

(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))

(setq js-indent-level 2)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

(setq web-mode-attr-indent-offset 2)
(setq web-mode-enable-css-colorization t)

(add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
(add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))
(add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
(add-to-list 'web-mode-indentation-params '("lineup-quotes" . nil))
(add-to-list 'web-mode-indentation-params '("lineup-ternary" . nil))
(add-to-list 'web-mode-indentation-params '("case-extra-offset" . nil))

(setq web-mode-content-types-alist
      '(("jsx" . "\\.js[x]?\\'")))

;; for better jsx syntax-highlighting in web-mode
;; - courtesy of Patrick @halbtuerke
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
    (let ((web-mode-enable-part-face nil))
      ad-do-it)
    ad-do-it))

(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "jsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "js" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
;; configure jsx-tide checker to run after your default jsx checker
;(flycheck-add-mode 'javascript-eslint 'web-mode)
;(flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)

;; auto-enable for .js/.jsx files, see:
;; https://gist.github.com/CodyReichert/9dbc8bd2a104780b64891d8736682cea
;; (add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))
;; (add-hook 'js-mode-hook #'indium-interaction-mode)
;; (setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))
;; (defun web-mode-init-hook ()
;;   "Hooks for Web mode.  Adjust indent."
;;   (setq web-mode-markup-indent-offset 2))
  
;; (add-hook 'web-mode-hook  'web-mode-init-hook)

;; highlight-indent-guides
;; (unless (package-installed-p 'highlight-indent-guides)
;;   (package-install 'highlight-indent-guides))
;; (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
;; (setq highlight-indent-guides-method 'character)






;;; What's paren package-initialize paren do?

;; (set-background-color "honeydew") ;; applies to all new frames
;; (add-to-list 'default-frame-alist '(background-color . "honeydew"))

;; turn on highlighting current line
;; (global-hl-line-mode 1)

;; ;; make cursor movement stop in between camelCase words.
;; (global-subword-mode 1)

;; ;; make typing delete/overwrite selected text.
;; (delete-selection-mode 1)

;; turn on bracket match highlight
;; (show-paren-mode 1)

;; show cursor position within line
;; (column-number-mode 1)
;; Welcome to the Emacs shell

;; stop creating those backup~ files
;; (setq auto-save-default nil)
;; (setq make-backup-files nil)

;; stop creating those #auto-save# files
;; (setq auto-save-default nil)

;; https://ember-cli.com/user-guide/#emacs but create-react-app watcher
;; (setq create-lockfiles nil)


;; When a file is updated outside emacs, make it
;; update if it's already opened in emacs
;; (global-auto-revert-mode 1)

;; y or n is enough
;; (defalias 'yes-or-no-p 'y-or-n-p)

;; https://emacsredux.com/blog/2013/05/22/smarter-navigation-to-the-beginning-of-a-line/
;; (defun smarter-move-beginning-of-line (arg)
;;   "Move point back to indentation of beginning of line.

;; Move point to the first non-whitespace character on this line.
;; If point is already there, move to the beginning of the line.
;; Effectively toggle between the first non-whitespace character and
;; the beginning of the line.

;; If ARG is not nil or 1, move forward ARG - 1 lines first.  If
;; point reaches the beginning or end of the buffer, stop there."
;;   (interactive "^p")
;;   (setq arg (or arg 1))
;;   ;; example where arg != 1: ( C-u C-a )

;;   ;; Move lines first (allows move-beg +/- n lines)
;;   (when (/= arg 1)
;;     (let ((line-move-visual nil))
;;       (forward-line (1- arg))))

;;   (let ((orig-point (point)))
;;     (back-to-indentation)
;;     (when (= orig-point (point))
;;       (move-beginning-of-line 1))))

;; ;; remap C-a to `smarter-move-beginning-of-line'
;; (global-set-key (kbd "C-a") 'smarter-move-beginning-of-line)

;; no beep on scroll
;; https://stackoverflow.com/questions/11679700/emacs-disable-beep-when-trying-to-move-beyond-the-end-of-the-document#answer-11679758
;; (defun my-bell-function ()
;;   (unless (memq this-command
;;         '(isearch-abort abort-recursive-edit exit-minibuffer
;;               keyboard-quit mwheel-scroll down up next-line previous-line
;;               backward-char forward-char))
;;     (ding)))

;; (setq ring-bell-function 'my-bell-function)

;; wrap long lines by word boundary, and arrow up/down move by visual line, etc
;; options are visual-line-mode vs. toggle-truncate-lines
;; (global-visual-line-mode t)
;; (setq-default word-wrap t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "d9e811d5a12dec79289c5bacaecd8ae393d168e9a92a659542c2a9bab6102041" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages
   (quote
    (loop json dash request restclient flycheck tide rjsx-mode zenburn-theme projectile moe-theme highlight-indent-guides web-mode magit super-save paredit smooth-scrolling racket-mode rainbow-mode avy rainbow-delimiters counsel ivy swiper ido-vertical-mode csharp-mode browse-kill-ring which-key use-package try solarized-theme indium exec-path-from-shell color-theme-sanityinc-tomorrow color-theme-modern))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; emacs prelude's default
(unless (package-installed-p 'zenburn-theme)
  (package-install 'zenburn-theme))

(load-theme 'zenburn t)

;; neon
(unless (package-installed-p 'moe-theme)
  (package-install 'moe-theme))

(require 'moe-theme)

;;(moe-light)

;; vim golf from emacs casts
(unless (package-installed-p 'solarized-theme)
  (package-install 'solarized-theme))

;;(load-theme 'solarized-dark)

(unless (package-installed-p 'color-theme-modern)
  (package-install 'color-theme-modern))

;;(load-theme 'deep-blue)

(unless (package-installed-p 'color-theme-sanityinc-tomorrow)
  (package-install 'color-theme-sanityinc-tomorrow))


;; (color-theme-sanityinc-tomorrow-day)
;; (color-theme-sanityinc-tomorrow-night)
;; (color-theme-sanityinc-tomorrow-blue)
;; (color-theme-sanityinc-tomorrow-bright)
;; (color-theme-sanityinc-tomorrow-eighties)

;; https://oremacs.com/swiper/
(unless (package-installed-p 'swiper)
  (package-install 'swiper))
(unless (package-installed-p 'ivy)
  (package-install 'ivy))
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-fromat "(%d/%d) ")
(setq ivy-wrap t)

(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)

;; better buffer list
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; avy
(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char))

;;
(unless (package-installed-p 'rainbow-delimiters)
  (package-install 'rainbow-delimiters))
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)


;;
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


;; Smoother scrolling (didn't like smooth-scrolling package)
;; https://stackoverflow.com/questions/1128927/how-to-scroll-line-by-line-in-gnu-emacs
(setq scroll-step            1
      scroll-conservatively  10000)

;; Get rid of annoying mini-buffer output
;; ex: "You can run the command ‘shift-operator-right’ with M-x shi RET"
(setq suggest-key-bindings nil)

;; Magit
(unless (package-installed-p 'magit)
  (package-install 'magit))

(global-set-key (kbd "C-x g") 'magit-status)

;; Racket Stuff

(unless (package-installed-p 'racket-mode)
  (package-install 'racket-mode))

(add-to-list 'auto-mode-alist '("\\.rkt\\'" . racket-mode))

;; on mac, after installing DrRacket gui, add
;; /sbin:/Applications/Racket v7.4/bin
;; to /etc/paths.d/racket
;; Note: Autocomplete adds an extra backslash escape character
;; +/sbin:/Applications/Racket\ v7.4/bin+

	
;; Common Lisp Stuff

;; $ brew install roswell
;; $ ros install slime
;; mac
;; (load (expand-file-name "~/.roswell/helper.el"))
;; TODO: Ubuntu

;; from a .lisp buffer, `M-x slime`


;; Paredit stuff

;; (unless (package-installed-p 'paredit)
;;   (package-install 'paredit))
;; (autoload 'enable-paredit-mode "paredit"
;;   "Turn on pseudo-structural editing of Lisp code."
;;   t)
;; (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
;; (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
;; (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
;; (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
;; (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
;; (add-hook 'scheme-mode-hook           #'enable-paredit-mode)
;; (add-hook 'racket-mode-hook           #'enable-paredit-mode)

;; print-level ; nil
;; print-length ; nil

;; eval-expression-print-level ; 4
;; '(a (b (c (d (e (f))))))
;;  (a (b (c (d ...))))
;; eval-expression-print-length ; 12

;; (setq eval-expression-print-level nil)
;; (setq eval-expression-print-length nil)

;;(split-window-below)

;; (find-file "~/.emacs.d/init.el")

;; TODO: Have SHIFT+Space insert a space without advancing cursor.

;; TODO: Paredit of quotes,arrays,objects in JS modes

;; TODO: In js modes meta-f skips waaay over () => {} \n\n\n




;; stop creating those backup~ files
;; (setq auto-save-default nil)
;; (setq make-backup-files nil)

;; stop creating those #auto-save# files
;; (setq auto-save-default nil)

;; https://ember-cli.com/user-guide/#emacs but create-react-app watcher
;; (setq create-lockfiles nil)


;; When a file is updated outside emacs, make it
;; update if it's already opened in emacs
;; (global-auto-revert-mode 1)

;; y or n is enough
;; (defalias 'yes-or-no-p 'y-or-n-p)

;; https://emacsredux.com/blog/2013/05/22/smarter-navigation-to-the-beginning-of-a-line/
;; (defun smarter-move-beginning-of-line (arg)
;;   "Move point back to indentation of beginning of line.

;; Move point to the first non-whitespace character on this line.
;; If point is already there, move to the beginning of the line.
;; Effectively toggle between the first non-whitespace character and
;; the beginning of the line.

;; If ARG is not nil or 1, move forward ARG - 1 lines first.  If
;; point reaches the beginning or end of the buffer, stop there."
;;   (interactive "^p")
;;   (setq arg (or arg 1))
;;   ;; example where arg != 1: ( C-u C-a )

;;   ;; Move lines first (allows move-beg +/- n lines)
;;   (when (/= arg 1)
;;     (let ((line-move-visual nil))
;;       (forward-line (1- arg))))

;;   (let ((orig-point (point)))
;;     (back-to-indentation)
;;     (when (= orig-point (point))
;;       (move-beginning-of-line 1))))

;; ;; remap C-a to `smarter-move-beginning-of-line'
;; (global-set-key (kbd "C-a") 'smarter-move-beginning-of-line)

;; no beep on scroll
;; https://stackoverflow.com/questions/11679700/emacs-disable-beep-when-trying-to-move-beyond-the-end-of-the-document#answer-11679758
;; (defun my-bell-function ()
;;   (unless (memq this-command
;;         '(isearch-abort abort-recursive-edit exit-minibuffer
;;               keyboard-quit mwheel-scroll down up next-line previous-line
;;               backward-char forward-char))
;;     (ding)))
;; (setq ring-bell-function 'my-bell-function)

;; wrap long lines by word boundary, and arrow up/down move by visual line, etc
;; options are visual-line-mode vs. toggle-truncate-lines
;; (global-visual-line-mode t)
;; (setq-default word-wrap t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "d9e811d5a12dec79289c5bacaecd8ae393d168e9a92a659542c2a9bab6102041" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages
   (quote
    (loop json dash request restclient flycheck tide rjsx-mode zenburn-theme projectile moe-theme highlight-indent-guides web-mode magit super-save paredit smooth-scrolling racket-mode rainbow-mode avy rainbow-delimiters counsel ivy swiper ido-vertical-mode csharp-mode browse-kill-ring which-key use-package try solarized-theme indium exec-path-from-shell color-theme-sanityinc-tomorrow color-theme-modern))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; emacs prelude's default
(unless (package-installed-p 'zenburn-theme)
  (package-install 'zenburn-theme))

(load-theme 'zenburn t)

;; neon
(unless (package-installed-p 'moe-theme)
  (package-install 'moe-theme))

(require 'moe-theme)

;;(moe-light)

;; vim golf from emacs casts
(unless (package-installed-p 'solarized-theme)
  (package-install 'solarized-theme))

;;(load-theme 'solarized-dark)

(unless (package-installed-p 'color-theme-modern)
  (package-install 'color-theme-modern))

;;(load-theme 'deep-blue)

(unless (package-installed-p 'color-theme-sanityinc-tomorrow)
  (package-install 'color-theme-sanityinc-tomorrow))


;; (color-theme-sanityinc-tomorrow-day)
;; (color-theme-sanityinc-tomorrow-night)
;; (color-theme-sanityinc-tomorrow-blue)
;; (color-theme-sanityinc-tomorrow-bright)
;; (color-theme-sanityinc-tomorrow-eighties)

;; https://oremacs.com/swiper/

;; (unless (package-installed-p 'swiper)
;;   (package-install 'swiper))

;; (unless (package-installed-p 'ivy)
;;   (package-install 'ivy))

;; (ivy-mode 1)
;; (setq ivy-use-virtual-buffers t)
;; (setq ivy-count-fromat "(%d/%d) ")
;; (setq ivy-wrap t)

;; (global-set-key (kbd "C-s") 'swiper)
;; (global-set-key (kbd "C-c C-r") 'ivy-resume)

;; better buffer list
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; avy
(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char))

;;
;; (unless (package-installed-p 'rainbow-delimiters)
;;   (package-install 'rainbow-delimiters))
;; (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)


;;
;; (defun fc-eval-and-replace ()
;;   "Replace the preceding sexp with its value."
;;   (interactive)
;;   (backward-kill-sexp)
;;   (condition-case nil
;;       (prin1 (eval (read (current-kill 0)))
;;              (current-buffer))
;;     (error (message "Invalid expression")
;;            (insert (current-kill 0)))))

;; (global-set-key (kbd "C-c e") 'fc-eval-and-replace)


;; Smoother scrolling (didn't like smooth-scrolling package)
;; https://stackoverflow.com/questions/1128927/how-to-scroll-line-by-line-in-gnu-emacs
(setq scroll-step            1
      scroll-conservatively  10000)

;; Get rid of annoying mini-buffer output
;; ex: "You can run the command ‘shift-operator-right’ with M-x shi RET"
(setq suggest-key-bindings nil)

;; Magit
(unless (package-installed-p 'magit)
  (package-install 'magit))

(global-set-key (kbd "C-x g") 'magit-status)

;; Racket Stuff

(unless (package-installed-p 'racket-mode)
  (package-install 'racket-mode))

(add-to-list 'auto-mode-alist '("\\.rkt\\'" . racket-mode))

;; on mac, after installing DrRacket gui, add
;; /sbin:/Applications/Racket v7.4/bin
;; to /etc/paths.d/racket
;; Note: Autocomplete adds an extra backslash escape character
;; +/sbin:/Applications/Racket\ v7.4/bin+

	
;; Common Lisp Stuff

;; $ brew install roswell
;; $ ros install slime
;; mac
;; (load (expand-file-name "~/.roswell/helper.el"))
;; TODO: Ubuntu

;; from a .lisp buffer, `M-x slime`


;; Paredit stuff

(unless (package-installed-p 'paredit)
  (package-install 'paredit))
(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'racket-mode-hook           #'enable-paredit-mode)

;; print-level ; nil
;; print-length ; nil

;; eval-expression-print-level ; 4
;; '(a (b (c (d (e (f))))))
;;  (a (b (c (d ...))))
;; eval-expression-print-length ; 12

(setq eval-expression-print-level nil)
(setq eval-expression-print-length nil)

;;(split-window-below)

(find-file "~/.emacs.d/init.el")

;; TODO: Have SHIFT+Space insert a space without advancing cursor.

;; TODO: Paredit of quotes,arrays,objects in JS modes

;; TODO: In js modes meta-f skips waaay over () => {} \n\n\n

;; stop creating those backup~ files
(setq auto-save-default nil)
(setq make-backup-files nil)

;; stop creating those #auto-save# files
(setq auto-save-default nil)

;; https://ember-cli.com/user-guide/#emacs but create-react-app watcher
(setq create-lockfiles nil)


;; When a file is updated outside emacs, make it
;; update if it's already opened in emacs
(global-auto-revert-mode 1)

;; y or n is enough
(defalias 'yes-or-no-p 'y-or-n-p)

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

;; no beep on scroll
;; https://stackoverflow.com/questions/11679700/emacs-disable-beep-when-trying-to-move-beyond-the-end-of-the-document#answer-11679758
(defun my-bell-function ()
  (unless (memq this-command
        '(isearch-abort abort-recursive-edit exit-minibuffer
              keyboard-quit mwheel-scroll down up next-line previous-line
              backward-char forward-char))
    (ding)))
(setq ring-bell-function 'my-bell-function)

;; wrap long lines by word boundary, and arrow up/down move by visual line, etc
;; options are visual-line-mode vs. toggle-truncate-lines
;; (global-visual-line-mode t)
(setq-default word-wrap t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "d9e811d5a12dec79289c5bacaecd8ae393d168e9a92a659542c2a9bab6102041" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages
   (quote
    (loop json dash request restclient flycheck tide rjsx-mode zenburn-theme projectile moe-theme highlight-indent-guides web-mode magit super-save paredit smooth-scrolling racket-mode rainbow-mode avy rainbow-delimiters counsel ivy swiper ido-vertical-mode csharp-mode browse-kill-ring which-key use-package try solarized-theme indium exec-path-from-shell color-theme-sanityinc-tomorrow color-theme-modern))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; emacs prelude's default
(unless (package-installed-p 'zenburn-theme)
  (package-install 'zenburn-theme))

(load-theme 'zenburn t)

;; neon
(unless (package-installed-p 'moe-theme)
  (package-install 'moe-theme))

(require 'moe-theme)

;;(moe-light)

;; vim golf from emacs casts
(unless (package-installed-p 'solarized-theme)
  (package-install 'solarized-theme))

;;(load-theme 'solarized-dark)

(unless (package-installed-p 'color-theme-modern)
  (package-install 'color-theme-modern))

;;(load-theme 'deep-blue)

(unless (package-installed-p 'color-theme-sanityinc-tomorrow)
  (package-install 'color-theme-sanityinc-tomorrow))


;; (color-theme-sanityinc-tomorrow-day)
;; (color-theme-sanityinc-tomorrow-night)
;; (color-theme-sanityinc-tomorrow-blue)
;; (color-theme-sanityinc-tomorrow-bright)
;; (color-theme-sanityinc-tomorrow-eighties)

;; https://oremacs.com/swiper/
(unless (package-installed-p 'swiper)
  (package-install 'swiper))
(unless (package-installed-p 'ivy)
  (package-install 'ivy))
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-fromat "(%d/%d) ")
(setq ivy-wrap t)

(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)

;; better buffer list
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; avy
(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char))

;;
(unless (package-installed-p 'rainbow-delimiters)
  (package-install 'rainbow-delimiters))
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)


;;
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


;; Smoother scrolling (didn't like smooth-scrolling package)
;; https://stackoverflow.com/questions/1128927/how-to-scroll-line-by-line-in-gnu-emacs
(setq scroll-step            1
      scroll-conservatively  10000)

;; Get rid of annoying mini-buffer output
;; ex: "You can run the command ‘shift-operator-right’ with M-x shi RET"
(setq suggest-key-bindings nil)

;; Magit
(unless (package-installed-p 'magit)
  (package-install 'magit))

(global-set-key (kbd "C-x g") 'magit-status)

;; Racket Stuff

(unless (package-installed-p 'racket-mode)
  (package-install 'racket-mode))

(add-to-list 'auto-mode-alist '("\\.rkt\\'" . racket-mode))

;; on mac, after installing DrRacket gui, add
;; /sbin:/Applications/Racket v7.4/bin
;; to /etc/paths.d/racket
;; Note: Autocomplete adds an extra backslash escape character
;; +/sbin:/Applications/Racket\ v7.4/bin+

	
;; Common Lisp Stuff

;; $ brew install roswell
;; $ ros install slime
;; mac
;; (load (expand-file-name "~/.roswell/helper.el"))
;; TODO: Ubuntu

;; from a .lisp buffer, `M-x slime`


;; Paredit stuff

(unless (package-installed-p 'paredit)
  (package-install 'paredit))
(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'racket-mode-hook           #'enable-paredit-mode)

;; print-level ; nil
;; print-length ; nil

;; eval-expression-print-level ; 4
;; '(a (b (c (d (e (f))))))
;;  (a (b (c (d ...))))
;; eval-expression-print-length ; 12

(setq eval-expression-print-level nil)
(setq eval-expression-print-length nil)

;;(split-window-below)

(find-file "~/.emacs.d/init.el")

;; TODO: Have SHIFT+Space insert a space without advancing cursor.

;; TODO: Paredit of quotes,arrays,objects in JS modes

;; TODO: In js modes meta-f skips waaay over () => {} \n\n\n




Invalid variable reference
~/Desktop $ 
;; stop creating those backup~ files
(setq auto-save-default nil)
(setq make-backup-files nil)

;; stop creating those #auto-save# files
(setq auto-save-default nil)

;; https://ember-cli.com/user-guide/#emacs but create-react-app watcher
(setq create-lockfiles nil)


;; When a file is updated outside emacs, make it
;; update if it's already opened in emacs
(global-auto-revert-mode 1)

;; y or n is enough
(defalias 'yes-or-no-p 'y-or-n-p)

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

;; no beep on scroll
;; https://stackoverflow.com/questions/11679700/emacs-disable-beep-when-trying-to-move-beyond-the-end-of-the-document#answer-11679758
(defun my-bell-function ()
  (unless (memq this-command
        '(isearch-abort abort-recursive-edit exit-minibuffer
              keyboard-quit mwheel-scroll down up next-line previous-line
              backward-char forward-char))
    (ding)))
(setq ring-bell-function 'my-bell-function)

;; wrap long lines by word boundary, and arrow up/down move by visual line, etc
;; options are visual-line-mode vs. toggle-truncate-lines
;; (global-visual-line-mode t)
(setq-default word-wrap t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "d9e811d5a12dec79289c5bacaecd8ae393d168e9a92a659542c2a9bab6102041" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages
   (quote
    (loop json dash request restclient flycheck tide rjsx-mode zenburn-theme projectile moe-theme highlight-indent-guides web-mode magit super-save paredit smooth-scrolling racket-mode rainbow-mode avy rainbow-delimiters counsel ivy swiper ido-vertical-mode csharp-mode browse-kill-ring which-key use-package try solarized-theme indium exec-path-from-shell color-theme-sanityinc-tomorrow color-theme-modern))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; emacs prelude's default
(unless (package-installed-p 'zenburn-theme)
  (package-install 'zenburn-theme))

(load-theme 'zenburn t)

;; neon
(unless (package-installed-p 'moe-theme)
  (package-install 'moe-theme))

(require 'moe-theme)

;;(moe-light)

;; vim golf from emacs casts
(unless (package-installed-p 'solarized-theme)
  (package-install 'solarized-theme))

;;(load-theme 'solarized-dark)

(unless (package-installed-p 'color-theme-modern)
  (package-install 'color-theme-modern))

;;(load-theme 'deep-blue)

(unless (package-installed-p 'color-theme-sanityinc-tomorrow)
  (package-install 'color-theme-sanityinc-tomorrow))


;; (color-theme-sanityinc-tomorrow-day)
;; (color-theme-sanityinc-tomorrow-night)
;; (color-theme-sanityinc-tomorrow-blue)
;; (color-theme-sanityinc-tomorrow-bright)
;; (color-theme-sanityinc-tomorrow-eighties)

;; https://oremacs.com/swiper/
(unless (package-installed-p 'swiper)
  (package-install 'swiper))
(unless (package-installed-p 'ivy)
  (package-install 'ivy))
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-fromat "(%d/%d) ")
(setq ivy-wrap t)

(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)

;; better buffer list
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; avy
(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char))

;;
(unless (package-installed-p 'rainbow-delimiters)
  (package-install 'rainbow-delimiters))
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)


;;
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


;; Smoother scrolling (didn't like smooth-scrolling package)
;; https://stackoverflow.com/questions/1128927/how-to-scroll-line-by-line-in-gnu-emacs
(setq scroll-step            1
      scroll-conservatively  10000)

;; Get rid of annoying mini-buffer output
;; ex: "You can run the command ‘shift-operator-right’ with M-x shi RET"
(setq suggest-key-bindings nil)

;; Magit
(unless (package-installed-p 'magit)
  (package-install 'magit))

(global-set-key (kbd "C-x g") 'magit-status)

;; Racket Stuff

(unless (package-installed-p 'racket-mode)
  (package-install 'racket-mode))

(add-to-list 'auto-mode-alist '("\\.rkt\\'" . racket-mode))

;; on mac, after installing DrRacket gui, add
;; /sbin:/Applications/Racket v7.4/bin
;; to /etc/paths.d/racket
;; Note: Autocomplete adds an extra backslash escape character
;; +/sbin:/Applications/Racket\ v7.4/bin+

	
;; Common Lisp Stuff

;; $ brew install roswell
;; $ ros install slime
;; mac
;; (load (expand-file-name "~/.roswell/helper.el"))
;; TODO: Ubuntu

;; from a .lisp buffer, `M-x slime`


;; Paredit stuff

(unless (package-installed-p 'paredit)
  (package-install 'paredit))
(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'racket-mode-hook           #'enable-paredit-mode)

;; print-level ; nil
;; print-length ; nil

;; eval-expression-print-level ; 4
;; '(a (b (c (d (e (f))))))
;;  (a (b (c (d ...))))
;; eval-expression-print-length ; 12

(setq eval-expression-print-level nil)
(setq eval-expression-print-length nil)

;;(split-window-below)

(find-file "~/.emacs.d/init.el")

;; TODO: Have SHIFT+Space insert a space without advancing cursor.

;; TODO: Paredit of quotes,arrays,objects in JS modes

;; TODO: In js modes meta-f skips waaay over () => {} \n\n\n




Invalid variable reference
~/Desktop $ 
;; stop creating those backup~ files
(setq auto-save-default nil)
(setq make-backup-files nil)

;; stop creating those #auto-save# files
(setq auto-save-default nil)

;; https://ember-cli.com/user-guide/#emacs but create-react-app watcher
(setq create-lockfiles nil)


;; When a file is updated outside emacs, make it
;; update if it's already opened in emacs
(global-auto-revert-mode 1)

;; y or n is enough
(defalias 'yes-or-no-p 'y-or-n-p)

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

;; no beep on scroll
;; https://stackoverflow.com/questions/11679700/emacs-disable-beep-when-trying-to-move-beyond-the-end-of-the-document#answer-11679758
(defun my-bell-function ()
  (unless (memq this-command
        '(isearch-abort abort-recursive-edit exit-minibuffer
              keyboard-quit mwheel-scroll down up next-line previous-line
              backward-char forward-char))
    (ding)))
(setq ring-bell-function 'my-bell-function)

;; wrap long lines by word boundary, and arrow up/down move by visual line, etc
;; options are visual-line-mode vs. toggle-truncate-lines
;; (global-visual-line-mode t)
(setq-default word-wrap t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "d9e811d5a12dec79289c5bacaecd8ae393d168e9a92a659542c2a9bab6102041" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages
   (quote
    (loop json dash request restclient flycheck tide rjsx-mode zenburn-theme projectile moe-theme highlight-indent-guides web-mode magit super-save paredit smooth-scrolling racket-mode rainbow-mode avy rainbow-delimiters counsel ivy swiper ido-vertical-mode csharp-mode browse-kill-ring which-key use-package try solarized-theme indium exec-path-from-shell color-theme-sanityinc-tomorrow color-theme-modern))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; emacs prelude's default
(unless (package-installed-p 'zenburn-theme)
  (package-install 'zenburn-theme))

(load-theme 'zenburn t)

;; neon
(unless (package-installed-p 'moe-theme)
  (package-install 'moe-theme))

(require 'moe-theme)

;;(moe-light)

;; vim golf from emacs casts
(unless (package-installed-p 'solarized-theme)
  (package-install 'solarized-theme))

;;(load-theme 'solarized-dark)

(unless (package-installed-p 'color-theme-modern)
  (package-install 'color-theme-modern))

;;(load-theme 'deep-blue)

(unless (package-installed-p 'color-theme-sanityinc-tomorrow)
  (package-install 'color-theme-sanityinc-tomorrow))


;; (color-theme-sanityinc-tomorrow-day)
;; (color-theme-sanityinc-tomorrow-night)
;; (color-theme-sanityinc-tomorrow-blue)
;; (color-theme-sanityinc-tomorrow-bright)
;; (color-theme-sanityinc-tomorrow-eighties)

;; https://oremacs.com/swiper/
(unless (package-installed-p 'swiper)
  (package-install 'swiper))
(unless (package-installed-p 'ivy)
  (package-install 'ivy))
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-fromat "(%d/%d) ")
(setq ivy-wrap t)

(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)

;; better buffer list
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; avy
(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char))

;;
(unless (package-installed-p 'rainbow-delimiters)
  (package-install 'rainbow-delimiters))
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)


;;
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


;; Smoother scrolling (didn't like smooth-scrolling package)
;; https://stackoverflow.com/questions/1128927/how-to-scroll-line-by-line-in-gnu-emacs
(setq scroll-step            1
      scroll-conservatively  10000)

;; Get rid of annoying mini-buffer output
;; ex: "You can run the command ‘shift-operator-right’ with M-x shi RET"
(setq suggest-key-bindings nil)

;; Magit
(unless (package-installed-p 'magit)
  (package-install 'magit))

(global-set-key (kbd "C-x g") 'magit-status)

;; Racket Stuff

(unless (package-installed-p 'racket-mode)
  (package-install 'racket-mode))

(add-to-list 'auto-mode-alist '("\\.rkt\\'" . racket-mode))

;; on mac, after installing DrRacket gui, add
;; /sbin:/Applications/Racket v7.4/bin
;; to /etc/paths.d/racket
;; Note: Autocomplete adds an extra backslash escape character
;; +/sbin:/Applications/Racket\ v7.4/bin+

	
;; Common Lisp Stuff

;; $ brew install roswell
;; $ ros install slime
;; mac
;; (load (expand-file-name "~/.roswell/helper.el"))
;; TODO: Ubuntu

;; from a .lisp buffer, `M-x slime`


;; Paredit stuff

(unless (package-installed-p 'paredit)
  (package-install 'paredit))
(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'racket-mode-hook           #'enable-paredit-mode)

;; print-level ; nil
;; print-length ; nil

;; eval-expression-print-level ; 4
;; '(a (b (c (d (e (f))))))
;;  (a (b (c (d ...))))
;; eval-expression-print-length ; 12

(setq eval-expression-print-level nil)
(setq eval-expression-print-length nil)

;;(split-window-below)

(find-file "~/.emacs.d/init.el")

;; TODO: Have SHIFT+Space insert a space without advancing cursor.

;; TODO: Paredit of quotes,arrays,objects in JS modes

;; TODO: In js modes meta-f skips waaay over () => {} \n\n\n

