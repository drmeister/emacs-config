
(message "Loading evil mode")
(add-to-list 'load-path "~/.emacs.d/elpa/evil-20151012.728")
(require 'evil)
(evil-mode 1)

(define-key evil-insert-state-map "\C-a" 'move-beginning-of-line)
(define-key evil-normal-state-map "\C-e" 'evil-end-of-line)
(define-key evil-insert-state-map "\C-e" 'end-of-line)
(define-key evil-visual-state-map "\C-e" 'evil-end-of-line)
(define-key evil-motion-state-map "\C-e" 'evil-end-of-line)
;(define-key evil-normal-state-map "\C-f" 'evil-forward-char)
;(define-key evil-insert-state-map "\C-f" 'evil-forward-char)
;(define-key evil-insert-state-map "\C-f" 'evil-forward-char)
;(define-key evil-normal-state-map "\C-b" 'evil-backward-char)
;(define-key evil-insert-state-map "\C-b" 'evil-backward-char)
;(define-key evil-visual-state-map "\C-b" 'evil-backward-char)
(define-key evil-normal-state-map "\C-d" 'evil-delete-char)
(define-key evil-insert-state-map "\C-d" 'evil-delete-char)
(define-key evil-visual-state-map "\C-d" 'evil-delete-char)
(define-key evil-normal-state-map "\C-n" 'evil-next-line)
(define-key evil-insert-state-map "\C-n" 'evil-next-line)
(define-key evil-visual-state-map "\C-n" 'evil-next-line)
(define-key evil-normal-state-map "\C-p" 'evil-previous-line)
(define-key evil-insert-state-map "\C-p" 'evil-previous-line)
(define-key evil-visual-state-map "\C-p" 'evil-previous-line)
(define-key evil-normal-state-map "\C-w" 'evil-delete)
(define-key evil-insert-state-map "\C-w" 'evil-delete)
(define-key evil-visual-state-map "\C-w" 'evil-delete)
(define-key evil-normal-state-map "\C-y" 'yank)
(define-key evil-insert-state-map "\C-y" 'yank)
(define-key evil-visual-state-map "\C-y" 'yank)
(define-key evil-normal-state-map "\C-k" 'kill-line)
(define-key evil-insert-state-map "\C-k" 'kill-line)
(define-key evil-visual-state-map "\C-k" 'kill-line)
;(define-key evil-normal-state-map "Q" 'call-last-kbd-macro)
;(define-key evil-visual-state-map "Q" 'call-last-kbd-macro)
;(define-key evil-normal-state-map (kbd "TAB") 'evil-undefine)

(defun evil-undefine ()
 (interactive)
 (let (evil-mode-map-alist)
   (call-interactively (key-binding (this-command-keys)))))



(message "Loading slime")
(add-to-list 'load-path "~/.emacs.d/slime")
(require 'slime-autoloads)

(load "~/.emacs.d/clang-format.el")
(global-set-key [C-M-tab] 'clang-format-region)
;(setq c-basic-offset 2)
;(setq tab-width 2)
;(setq-default indent-tabs-mode nil)

;; Resize shell windows

(add-hook 'makefile-mode-hook 'use-tabs-hook) (defun use-tabs-hook () (setq indent-tabs-mode t))


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


;; Set right-option key to super
(setq ns-right-option-modifier 'super)

(setq-default c-basic-offset 4)
(setq dired-use-ls-dired nil)

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

(message "loading gud.el")
(require 'gud)



(message "Done")

