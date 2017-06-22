(setq ansi-color-for-comint-mode t)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(when window-system (tool-bar-mode -1))
(scroll-bar-mode -1)
(setq line-number-display-limit-width 2000000)

(add-hook 'c-mode-common-hook
	  (lambda ()
	    (when (derived-mode-p 'c-mode 'c++-mode)
	      (ggtags-mode 1))))
;;
;;(message "Loading evil mode")
;;(add-to-list 'load-path "~/.emacs.d/elpa/evil-20151012.728")
;;(require 'evil)
;;(evil-mode 1)
;
;(define-key evil-insert-state-map "\C-a" 'move-beginning-of-line)
;(define-key evil-normal-state-map "\C-e" 'evil-end-of-line)
;(define-key evil-insert-state-map "\C-e" 'end-of-line)
;(define-key evil-visual-state-map "\C-e" 'evil-end-of-line)
;(define-key evil-motion-state-map "\C-e" 'evil-end-of-line)
;;(define-key evil-normal-state-map "\C-f" 'evil-forward-char)
;;(define-key evil-insert-state-map "\C-f" 'evil-forward-char)
;;(define-key evil-insert-state-map "\C-f" 'evil-forward-char)
;;(define-key evil-normal-state-map "\C-b" 'evil-backward-char)
;;(define-key evil-insert-state-map "\C-b" 'evil-backward-char)
;;(define-key evil-visual-state-map "\C-b" 'evil-backward-char)
;(define-key evil-normal-state-map "\C-d" 'evil-delete-char)
;(define-key evil-insert-state-map "\C-d" 'evil-delete-char)
;(define-key evil-visual-state-map "\C-d" 'evil-delete-char)
;(define-key evil-normal-state-map "\C-n" 'evil-next-line)
;(define-key evil-insert-state-map "\C-n" 'evil-next-line)
;(define-key evil-visual-state-map "\C-n" 'evil-next-line)
;(define-key evil-normal-state-map "\C-p" 'evil-previous-line)
;(define-key evil-insert-state-map "\C-p" 'evil-previous-line)
;(define-key evil-visual-state-map "\C-p" 'evil-previous-line)
;(define-key evil-normal-state-map "\C-w" 'evil-delete)
;(define-key evil-insert-state-map "\C-w" 'evil-delete)
;(define-key evil-visual-state-map "\C-w" 'evil-delete)
;(define-key evil-normal-state-map "\C-y" 'yank)
;(define-key evil-insert-state-map "\C-y" 'yank)
;(define-key evil-visual-state-map "\C-y" 'yank)
;(define-key evil-normal-state-map "\C-k" 'kill-line)
;(define-key evil-insert-state-map "\C-k" 'kill-line)
;(define-key evil-visual-state-map "\C-k" 'kill-line)
;;(define-key evil-normal-state-map "Q" 'call-last-kbd-macro)
;;(define-key evil-visual-state-map "Q" 'call-last-kbd-macro)
;;(define-key evil-normal-state-map (kbd "TAB") 'evil-undefine)
;
;(defun evil-undefine ()
; (interactive)
; (let (evil-mode-map-alist)
;   (call-interactively (key-binding (this-command-keys)))))
;
;(add-to-list 'load-path "~/.emacs.d/keys")
;(message "Loading meister-keys")
;(require 'meister-keys)
(message "Starting up init.el")

(message "Loading slime")
(add-to-list 'load-path "~/.emacs.d/slime")
;(setq slime-contribs '(slime-fancy slime-scratch slime-asdf))
(setq slime-contribs '(slime-fancy slime-scratch))
;(slime-setup '(slime-scratch slime-fancy slime-asdf))
(require 'slime-autoloads)
(setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
(setq slime-fuzzy-explanation "")
(setq inferior-lisp-program "~/Development/clasp/build/boehm/iclasp-boehm")
(defun slime-eval-comment-last-expression (string)
  "Evaluate sexp before point; print value, commented, into the current buffer"
  (interactive (list (slime-last-expression)))
  (insert "\n#| ")
  (insert (cadr (slime-eval `(swank:eval-and-grab-output ,string))))
  (insert " |#"))
(global-set-key (kbd "C-M-S-x") 'slime-eval-comment-last-expression)


(load "~/.emacs.d/git-link.el")
(global-set-key (kbd "C-c g l") 'git-link)

(load "~/.emacs.d/clang-format.el")

(defun my-cmode-hook ()
  (local-set-key [C-M-tab] 'clang-format-region))
(add-hook 'c-mode-common-hook 'my-cmode-hook)

;(setq c-basic-offset 2)
;(setq tab-width 2)
;(setq-default indent-tabs-mode nil)

;; Resize shell windows

(defun my-use-tabs-hook () (setq-local indent-tabs-mode t))
(add-hook 'makefile-mode-hook 'my-use-tabs-hook)


(message "comint-fix-window-size")
(defun comint-fix-window-size ()
  "Change process window size."
  (when (derived-mode-p 'comint-mode)
    (let ((process (get-buffer-process (current-buffer))))
      (unless (eq nil process)
        (set-process-window-size process (window-height) (window-width))))))


(defun my-shell-mode-hook ()
  ;; add this hook as buffer local, so it runs once per window.
  (add-hook 'window-configuration-change-hook 'comint-fix-window-size nil t))

(add-hook 'shell-mode-hook 'my-shell-mode-hook)

(message "About to ns-right-option-modifier")

;; Set right-option key to super
(setq ns-right-option-modifier 'super)

(setq-default c-basic-offset 4)

(message "Starting init.el")

(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.local/emacs/")))


(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))


(show-paren-mode t)
(global-set-key "\C-xp" (lambda () (interactive) (other-window -1)))  


;; setup load-path and autoloads


;; Set up the Melpa package repository
(message "Setting up melpa")

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize) ;; You might already have this line





;;
;; inferior-lisp
;;
(global-set-key (kbd "M-RET") 'lisp-eval-defun)


(message "Setting up yas-snippet")
(setq yas-snippet-dirs "~/.local/emacs/snippets")
(message "yas2")
(add-to-list 'load-path
	     "~/.emacs.d/elpa/yasnippet-20141117.327")
(message "yas3")
(require 'yasnippet)
(message "yas4")
(yas-global-mode 1)

(message "loading lldb-gud.el")
(load "~/.emacs.d/gud-lldb.el") ; (require 'gud-lldb2)

(add-to-list 'auto-mode-alist '("[Mm]akefile\\'" . makefile-mode))



;;; Show tabs
(message "Show tabs with separate face")
(defface extra-whitespace-face
  '((t (:background "pale green")))
  "Used for tabs and such.")
(defvar my-extra-keywords
  '(("\t" . 'extra-whitespace-face)))
(add-hook 'emacs-lisp-mode-hook
	  (lambda () (font-lock-add-keywords nil my-extra-keywords)))
(add-hook 'python-mode-hook
	  (lambda () (font-lock-add-keywords nil my-extra-keywords)))
(add-hook 'text-mode-hook
	  (lambda () (font-lock-add-keywords nil my-extra-keywords)))

(setq auto-mode-alist (cons '("\\wscript$" . python-mode) auto-mode-alist))


(message "Done with init.el")

