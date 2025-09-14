;; Configuration file
;; Set up environment variables

(winner-mode 1)

(print "Starting dot_emacs part")

(if (file-exists-p "~/.emacs")
    (error "The file ~/.emacs exists - remove it - we only use init.el to startup"))

(message "Setting up path in init.el")


;; ITERM2 MOUSE SUPPORT
;(unless window-system
;  (require 'mouse)
;  (xterm-mouse-mode t)
;  (defun track-mouse (e))
;  (setq mouse-sel-mode t)
;  )


(setenv "PATH"
        (concat
         (concat (getenv "HOME") "/Development/cando/build/boehmprecise:")    ; Need so that *compiliation* works like *shell*
         "/usr/local/bin:"
         "/usr/bin:"
         "/bin:"
         "/usr/sbin:"
         "/sbin:"
         "/opt/X11/bin:"
         "/usr/texbin:"
         "/Applications/CMake.app/Contents/bin:"
         (concat (getenv "HOME") "/Development/amber/bin:")
         "/Applications/Emacs.app/Contents/MacOS/bin-x86_64-10_9:"
         "/Applications/Emacs.app/Contents/MacOS/libexec-x86_64-10_9:"
         (getenv "PATH")))

(setenv "CLASP_SBCL" "sbcl")
;;(setenv "AMBERHOME" "/opt/amber")
(setenv "CLASP_APP_DIR" (concat (getenv "HOME") "/.local/clasp"))




(message "Starting up")
(add-to-list 'auto-save-file-name-transforms '("\\`.*/Dropbox/.*" "/tmp/" t))
(add-to-list 'backup-directory-alist '("\\`.*/Dropbox/.*" . "/tmp/"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9"
    "white"])
 '(custom-enabled-themes '(wheatgrass))
 '(evil-want-keybinding nil)
 '(gdb-non-stop-setting nil)
 '(magit-pull-arguments nil)
 '(package-selected-packages
   '(ace-window ag clang-format clang-format+ clipetty
                color-theme-buffer-local command-log-mode evil
                evil-collection evil-terminal-cursor-changer fireplace
                flylisp focus fold-dwim folding free-keys ggtags
                git-timemachine git-wip-timemachine gnuplot
                highlight-indent-guides highlight-indentation iedit
                indent-bars json-mode load-theme-buffer-local magit
                neotree paredit projectile rainbow-blocks
                rainbow-delimiters realgud-lldb rust-mode
                symbol-overlay treesit-auto use-package w3m wgrep
                wgrep-ag which-key ztree))
 '(safe-local-variable-values
   '((package . rune-dom) (Encoding . utf-8) (readtable . runes)
     (Package . CXML) (Package . TRIVIAL-GRAY-STREAMS)
     (Syntax . ANSI-Common-lisp) (Package . ASDF) (package . puri)
     (eval when (fboundp 'c-toggle-comment-style)
           (c-toggle-comment-style 1))
     (eval c-set-offset 'innamespace 0)
     (eval c-set-offset 'brace-list-open 0)
     (Package . CLPYTHON.APP.REPL) (Package . CLPYTHON.PARSER)
     (Readtable . PY-AST-USER-READTABLE) (Package . CLPYTHON)
     (readtable . py-user-readtable) (package . clpython)
     (Readtable . PY-USER-READTABLE) (Package . CLPYTHON.TEST)
     (Package . CLPYTHON.UTIL) (Package . CL-INTERPOL)
     (Package . CLIM-INTERNALS)
     (Package ITERATE :use "COMMON-LISP" :colon-mode :external)
     (Lowercase . Yes) (Package . XLIB) (Package . CL-UNICODE)
     (whitespace-style quote (face trailing empty tabs))
     (whitespace-action) (Package . CCL)
     (Package RT :use "COMMON-LISP" :colon-mode :external)
     (syntax . COMMON-LISP) (Package . monitor)
     (Package . HUNCHENTOOT) (Package . CL-USER) (Package . CL-FAD)
     (Syntax . Common-lisp) (Package . XREF) (Package . CL-PPCRE)
     (Syntax . COMMON-LISP) (encoding . utf-8) (Package . LISP-UNIT)
     (Base . 8) (Package . INTL) (Package . make) (Package . Maxima)
     (c-file-offsets (innamespace . 0) (substatement-open . 0)
                     (c . c-lineup-dont-change) (inextern-lang . 0)
                     (comment-intro . c-lineup-dont-change)
                     (arglist-cont-nonempty . c-lineup-arglist)
                     (block-close . 0) (statement-case-intro . ++)
                     (brace-list-intro . ++) (cpp-define-intro . +))
     (c-auto-align-backslashes)
     (c-file-offsets (innamespace . 0) (substatement-open . 0)
                     (c . c-lineup-dont-change) (inextern-lang . 0)
                     (comment-intro . c-lineup-dont-change)
                     (block-close . 0))
     (c-file-offsets (innamespace . 0) (substatement-open . 0)
                     (c . c-lineup-dont-change) (inextern-lang . 0)
                     (comment-intro . c-lineup-dont-change)
                     (arglist-cont-nonempty . llvm-c-lineup-arglist)
                     (block-close . 0))
     (Syntax . ANSI-Common-Lisp) (Base . 10) (Package . C)
     (Package . SYSTEM) (Package . CLOS) (Syntax . Common-Lisp)))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(warning-suppress-types '((auto-save))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)

(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)







(print "Starting init.el")

;;; use-package macro bootstrapping
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;;; Configure use-package
;;;
;;; package initialization

(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(setq package-enable-at-startup nil)

(setq package-install-upgrade-built-in t)



(setq-default use-package-always-ensure t)

(use-package rainbow-delimiters)
(use-package goto-chg)
(use-package symbol-overlay)
(use-package cl-lib)
(use-package ag)
(use-package svg)
(use-package yasnippet)
(use-package free-keys)
(use-package bind-key)
(use-package wgrep)
(use-package wgrep-ag)
(use-package magit)
(use-package macrostep)
(use-package git-timemachine)
(use-package evil)
(use-package evil-collection)
(use-package clipetty)
(use-package rust-mode)
(use-package ace-window)
(use-package which-key)
(use-package evil-terminal-cursor-changer)
(use-package neotree)
(use-package projectile
  :ensure t
;;  :pin melpa-stable
  :init (progn
          (projectile-mode +1)
          (setq projectile-project-search-path '("~/common-lisp/")))
  :bind (:map projectile-mode-map
              ("C-c p" . projectile-command-map)))

;(load "~/.emacs.d/mgl-pax.el")
;(mgl-pax-hijack-slime-doc-keys)
;(global-set-key [f11] 'mgl-pax-document)
;;;(global-set-key (kbd "s-x t") 'mgl-pax-transcribe-last-expression)
;;;(global-set-key (kbd "s-x r") 'mgl-pax-retranscribe-region)


;;;
;;; Jump to most recent window
;;;
(defun jump-to-mru-window ()
  (interactive)
  (select-window (get-mru-window nil nil t)))
(global-set-key (kbd "<home>") 'jump-to-mru-window)


;;;
;;; neotree bindings

(global-set-key [f8] 'neotree-toggle)

;;;
;;; symbol overlay key bindings

(require 'symbol-overlay)
(global-set-key (kbd "M-i") 'symbol-overlay-put)
(global-set-key (kbd "M-n") 'symbol-overlay-switch-forward)
(global-set-key (kbd "M-p") 'symbol-overlay-switch-backward)
(global-set-key (kbd "<f5>") 'symbol-overlay-mode)
(global-set-key (kbd "<f6>") 'symbol-overlay-remove-all)
(let ((map (make-sparse-keymap)))
  (define-key map (kbd "<") 'symbol-overlay-jump-first)
  (define-key map (kbd ">") 'symbol-overlay-jump-last)
  (define-key map (kbd "?") 'symbol-overlay-map-help)
  (define-key map (kbd "d") 'symbol-overlay-jump-to-definition)
  (define-key map (kbd "e") 'symbol-overlay-echo-mark)
  (define-key map (kbd "i") 'symbol-overlay-put)
  (define-key map (kbd "n") 'symbol-overlay-jump-next)
  (define-key map (kbd "p") 'symbol-overlay-jump-prev)
  (define-key map (kbd "q") 'symbol-overlay-query-replace)
  (define-key map (kbd "r") 'symbol-overlay-rename)
  (define-key map (kbd "s") 'symbol-overlay-isearch-literally)
  (define-key map (kbd "t") 'symbol-overlay-toggle-in-scope)
  (define-key map (kbd "w") 'symbol-overlay-save-symbol)
  (setq symbol-overlay-map map))



;;; SLY support
(when t
  (add-to-list 'load-path "~/Development/sly")
  (add-to-list 'load-path "~/Development/sly/contrib")
  (require 'sly)
  (print "loading contrib-autoloads")
;;  (require 'contrib-autoloads)
  (print "loading sly-fancy")
  (require 'sly-fancy)
;;  (require 'sly-stickers)
  (add-hook 'sly-mode-hook #'sly-stickers-mode)
  (setq inferior-lisp-program "~/Development/cando/build/boehmprecise/cando")
  (add-to-list 'sly-contribs 'sly-fancy)
  )



(setq byte-compile-warnings '(cl-functions))

(evil-mode 1)
(evil-collection-init)

(setq evil-want-fine-undo 'fine)

(defun pull-next-sexp-into-current ()
  (interactive)
  (delete-char 1)
  (forward-sexp 1)
  (insert ")")
  (backward-char 1))



(defun my-disable-visual-mode-in-shell ()
  "Disable visual mode in *shell* buffer."
  (when (and (or (string-match-p "\\*shell\\*" (buffer-name))
                 (string-match-p "sly-mrepl" (buffer-name))
                 )
             (evil-visual-state-p))
    (evil-exit-visual-state)))

(add-hook 'evil-visual-state-entry-hook 'my-disable-visual-mode-in-shell)

(defun my-evil-visual-state-advice (orig-fun &rest args)
  "Prevent entering visual mode in *shell* buffer."
  (unless (or (string-match-p "\\*shell\\*" (buffer-name))
              (string-match-p "sly-mrepl" (buffer-name))
              )
    (apply orig-fun args)))

(advice-add 'evil-visual-state :around #'my-evil-visual-state-advice)


(defun my-disable-escape-key-in-shell ()
  "Disable the Escape key in *shell* buffer."
  (when (or (string-match-p "\\*shell\\*" (buffer-name)))
    (define-key evil-normal-state-local-map [escape] 'ignore)
    (define-key evil-insert-state-local-map [escape] 'ignore)
    (define-key evil-visual-state-local-map [escape] 'ignore)))

(add-hook 'shell-mode-hook 'my-disable-escape-key-in-shell)


(defun my-disable-escape-key-in-sly-mrepl ()
  "Disable the Escape key in *shell* buffer."
  (when (or (string-match-p "sly-mrepl" (buffer-name)))
    (define-key evil-normal-state-local-map [escape] 'ignore)
    (define-key evil-insert-state-local-map [escape] 'ignore)
    (define-key evil-visual-state-local-map [escape] 'ignore)))

(add-hook 'sly-mrepl-mode-hook 'my-disable-escape-key-in-sly-mrepl)

;;; Turn on dispatch always when M-o is activated

(setq aw-dispatch-always t)

;;;(evil-global-set-key 'insert  (kbd "C-M-i") 'pull-next-sexp-into-current)
(evil-global-set-key 'insert  (kbd "C-x o") 'ace-window)
(evil-global-set-key 'replace (kbd "C-x o") 'ace-window)
(evil-global-set-key 'normal  (kbd "C-x o") 'ace-window)
(evil-global-set-key 'visual  (kbd "C-x o") 'ace-window)

(evil-global-set-key 'insert  (kbd "C-x p") 'ace-window)
(evil-global-set-key 'replace (kbd "C-x p") 'ace-window)
(evil-global-set-key 'normal  (kbd "C-x p") 'ace-window)
(evil-global-set-key 'visual  (kbd "C-x p") 'ace-window)

(evil-global-set-key 'insert  (kbd "M-o") 'ace-window)
(evil-global-set-key 'replace (kbd "M-o") 'ace-window)
(evil-global-set-key 'normal  (kbd "M-o") 'ace-window)
(evil-global-set-key 'visual  (kbd "M-o") 'ace-window)

(evil-global-set-key 'insert  (kbd "C-a") 'move-beginning-of-line)
(evil-global-set-key 'replace (kbd "C-a") 'move-beginning-of-line)
(evil-global-set-key 'normal  (kbd "C-a") 'move-beginning-of-line)
(evil-global-set-key 'visual  (kbd "C-a") 'move-beginning-of-line)


(evil-global-set-key 'insert  (kbd "C-e") 'move-end-of-line)
(evil-global-set-key 'replace (kbd "C-e") 'move-end-of-line)
(evil-global-set-key 'normal  (kbd "C-e") 'move-end-of-line)
(evil-global-set-key 'visual  (kbd "C-e") 'move-end-of-line)

(evil-global-set-key 'insert  (kbd "C-k") 'kill-line)
(evil-global-set-key 'replace (kbd "C-k") 'kill-line)
(evil-global-set-key 'normal  (kbd "C-k") 'kill-line)
(evil-global-set-key 'visual  (kbd "C-k") 'kill-line)

(evil-global-set-key 'insert  (kbd "C-d") 'evil-delete-char)
(evil-global-set-key 'replace (kbd "C-d") 'evil-delete-char)
(evil-global-set-key 'normal  (kbd "C-d") 'evil-delete-char)
(evil-global-set-key 'visual  (kbd "C-d") 'evil-delete-char)

(evil-global-set-key 'insert  (kbd "M-.") 'sly-edit-definition)
(evil-global-set-key 'replace (kbd "M-.") 'sly-edit-definition)
(evil-global-set-key 'normal  (kbd "M-.") 'sly-edit-definition)
(evil-global-set-key 'visual  (kbd "M-.") 'sly-edit-definition)

(evil-global-set-key 'insert  (kbd "C-r") 'isearch-backward)
(evil-global-set-key 'replace (kbd "C-r") 'isearch-backward)
(evil-global-set-key 'normal  (kbd "C-r") 'isearch-backward)
(evil-global-set-key 'visual  (kbd "C-r") 'isearch-backward)

(evil-global-set-key 'insert  (kbd "C-b") 'evil-scroll-page-up)
(evil-global-set-key 'replace (kbd "C-b") 'evil-scroll-page-up)
(evil-global-set-key 'normal  (kbd "C-b") 'evil-scroll-page-up)
(evil-global-set-key 'visual  (kbd "C-b") 'evil-scroll-page-up)

(evil-global-set-key 'insert  (kbd "C-f") 'evil-scroll-page-down)
(evil-global-set-key 'replace (kbd "C-f") 'evil-scroll-page-down)
(evil-global-set-key 'normal  (kbd "C-f") 'evil-scroll-page-down)
(evil-global-set-key 'visual  (kbd "C-f") 'evil-scroll-page-down)

(evil-global-set-key 'insert  (kbd "C-y") 'yank)
(evil-global-set-key 'replace (kbd "C-y") 'yank)
(evil-global-set-key 'normal  (kbd "C-y") 'yank)
(evil-global-set-key 'visual  (kbd "C-y") 'yank)

(evil-global-set-key 'motion (kbd "g c") 'recompile)

(evil-global-set-key 'motion (kbd "g j") 'windmove-down)
(evil-global-set-key 'motion (kbd "g h") 'windmove-left)
(evil-global-set-key 'motion (kbd "g k") 'windmove-up)
(evil-global-set-key 'motion (kbd "g l") 'windmove-right)

(setq evil-insert-state-cursor '("chartreuse3" bar))
(setq evil-normal-state-cursor '("white" box))

(unless (display-graphic-p)
  (require 'evil-terminal-cursor-changer)
  (evil-terminal-cursor-changer-activate))

;;;----------------------------------------------------------------------------

(defvar-local my/evil-bg-remap-cookie nil)

(defun my/update-evil-window-bg ()
  "Set window background color based on Evil state."
  (when my/evil-bg-remap-cookie
    (face-remap-remove-relative my/evil-bg-remap-cookie))
  (let* ((color (if (eq evil-state 'insert) "#003000" "#300000")))
    (setq my/evil-bg-remap-cookie
          (face-remap-add-relative 'default `(:background ,color)))
    ;; Also update fringe, line numbers, etc.
    (set-face-background 'fringe color)
    (set-face-background 'line-number color)
    (set-face-background 'line-number-current-line color)
    (set-face-background 'vertical-border color)
    (set-face-background 'window-divider color)))

(defun my/update-evil-bg-for-selected-window ()
  "Apply background per window: insert/move for code, black for *compilation*."
  (walk-windows
   (lambda (win)
     (with-selected-window win
       (with-current-buffer (window-buffer win)
         (cond
          ;; For compilation buffer, set static black background
          ((string-match-p "compilation\\*\\'" (buffer-name))
           (when my/evil-bg-remap-cookie
             (face-remap-remove-relative my/evil-bg-remap-cookie))
           (setq my/evil-bg-remap-cookie
                 (face-remap-add-relative 'default `(:background "#000000"))))

          ;; For selected window: apply evil-mode color
          ((eq win (selected-window))
           (my/update-evil-window-bg))

          ;; For other windows: clear coloring
          (t
           (when my/evil-bg-remap-cookie
             (face-remap-remove-relative my/evil-bg-remap-cookie)
             (setq my/evil-bg-remap-cookie nil)))))))
   nil t))

;; Hooks to track Evil mode transitions and window selection
(add-hook 'evil-insert-state-entry-hook #'my/update-evil-bg-for-selected-window)
(add-hook 'evil-insert-state-exit-hook #'my/update-evil-bg-for-selected-window)
(add-hook 'window-selection-change-functions (lambda (_win) (my/update-evil-bg-for-selected-window)))
(add-hook 'post-command-hook #'my/update-evil-bg-for-selected-window) ;; Catch ESC properly
(add-hook 'emacs-startup-hook #'my/update-evil-bg-for-selected-window)






;;;----------------------------------------------------------------------------



;; Fix annoying problem where my right thumb invokes <xterm-paste> on macOS trackpad
;; Argh - I can't use this because it kills all pastes

;(global-set-key (kbd "<xterm-paste>") 'redraw-display) 

(add-to-list 'auto-mode-alist '("\\(/\\|\\`\\)[Mm]akefile" . makefile-mode))

(setenv "CLASP_SBCL" "sbcl")
(setenv "EXTERNALS_CLASP_DIR" "/Users/meister/Development/externals-clasp")
(setenv "CANDO_LISP_SOURCE_DIR" "/Users/meister/Development/clasp/projects/cando/src")
(setenv "CLASP_APP_DIR" "/Users/meister/.local/clasp")




;; ** Custom key bindings
(global-set-key (kbd "C-c m") 'magit-status)
(global-set-key (kbd "C-c f") 'clang-format-buffer)



(defun make-buffer-sticky ()
  "Make the current window always display this buffer."
  (interactive)
  (let* ((window (get-buffer-window (current-buffer)))
         (dedicated (window-dedicated-p window)))
    (if (not dedicated)
        (face-remap-add-relative 'mode-line '(:background "#0000FF"))
      (face-remap-add-relative 'mode-line '(:background "#FF0000")))
    (set-window-dedicated-p window (not dedicated))))
(global-set-key (kbd "C-c S") 'make-buffer-sticky)

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

(add-hook 'c++-mode-hook
          (lambda ()
            ;; Bind M-. in C++ mode to use ggtags-find-definition.
            (evil-local-set-key 'insert  (kbd "M-.") 'ggtags-find-definition)
            (evil-local-set-key 'replace (kbd "M-.") 'ggtags-find-definition)
            (evil-local-set-key 'normal  (kbd "M-.") 'ggtags-find-definition)
            (evil-local-set-key 'visual  (kbd "M-.") 'ggtags-find-definition)
            ))

;; ** Sticky windows
(load "~/.emacs.d/sticky-windows.el")
(global-set-key (kbd "C-x 0") 'sticky-window-delete-window)
(global-set-key (kbd "C-x 1") 'sticky-window-delete-other-windows)
(global-set-key (kbd "C-x 9") 'sticky-window-toggle-window-visible)

;; ** Git link
(load "~/.emacs.d/git-link.el")
(global-set-key (kbd "C-c g l") 'git-link)

;; ** Clang format

(load "~/.emacs.d/clang-format.el")

(defun my-cmode-hook ()
  (local-set-key [C-M-tab] 'clang-format-region))
(add-hook 'c-mode-common-hook 'my-cmode-hook)

;; ** Unclassified initialization code

;(setq c-basic-offset 2)
;(setq tab-width 2)
(setq-default indent-tabs-mode nil)

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

(setq-default show-trailing-whitespace t)

(show-paren-mode t)
(global-set-key "\C-xp" (lambda () (interactive) (other-window -1)))  


;; setup load-path and autoloads






(message "Setting up yas-snippet")
(setq yas-snippet-dirs "~/.emacs.d/snippets")

(print "Testing code below")
;;
;; inferior-lisp
;;
(global-set-key (kbd "M-RET") 'lisp-eval-defun)


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
(add-hook 'lisp-mode-hook
          (lambda () (font-lock-add-keywords nil my-extra-keywords)))
(add-hook 'python-mode-hook
          (lambda () (font-lock-add-keywords nil my-extra-keywords)))
(add-hook 'text-mode-hook
          (lambda () (font-lock-add-keywords nil my-extra-keywords)))
(add-hook 'makefile-mode-hook
          (lambda () (font-lock-add-keywords nil my-extra-keywords)))

(setq auto-mode-alist (cons '("\\wscript$" . python-mode) auto-mode-alist))


;;; Code to convert camelcase to dash
(defun split-name (s)
  (split-string
   (let ((case-fold-search nil))
     (downcase
      (replace-regexp-in-string "\\([a-z]\\)\\([A-Z]\\)" "\\1 \\2" s)))
   "[^A-Za-z0-9]+"))
(defun camelcase  (s) (mapconcat 'capitalize (split-name s) ""))
(defun underscore (s) (mapconcat 'downcase   (split-name s) "_"))
(defun dasherize  (s) (mapconcat 'downcase   (split-name s) "-"))
(defun camelscore-word-at-point ()
  (interactive)
  (let* ((case-fold-search nil)
         (beg (and (skip-chars-backward "[:alnum:]_-") (point)))
         (end (and (skip-chars-forward  "[:alnum:]_-") (point)))
         (txt (buffer-substring beg end))
         (cml (dasherize txt)) )
    (if cml (progn (delete-region beg end) (insert cml))) ))


(global-set-key (kbd "C-c i") 'camelscore-word-at-point)


;; Recommended config (optional):
(with-eval-after-load "eval-in-repl"
  (setq org-confirm-babel-evaluate nil)
  (setq eir-jump-after-eval nil))

;; llvm coding style guildelines in emacs
(defun llvm-lineup-statement (langelem)
  (let ((in-assign (c-lineup-assignments langelem)))
    (if (not in-assign)
        '++
      (aset in-assign 0
            (+ (aref in-assign 0)
               (* 2 c-basic-offset)))
      in-assign)))


;; Add a cc-mode style for editing LLVM C and C++ code
(c-add-style "llvm.org"
             '("gnu"
               (fill-column . 80)
               (c++-indent-level . 2)
               (c-basic-offset . 2)
               (indent-tabs-mode . nil)
               (c-offsets-alist . ((arglist-intro . ++)
                                   (innamespace . 0)
                                   (member-init-intro . ++)
                                   (statement-cont . llvm-lineup-statement)))))

;; Files with "llvm" in their names will automatically be set to the
;; llvm.org coding style.
(add-hook 'c-mode-common-hook
          (function
           (lambda nil 
             (c-set-style "llvm.org"))))

(defun do-org-show-all-inline-images ()
  (interactive)
  (org-display-inline-images t t))
(global-set-key (kbd "C-c C-x C-v")
                'do-org-show-all-inline-images)


(require 'wgrep)
(require 'wgrep-ag)
(print "Changing configuration for ag")
(require 'ag)
(setq ag-highlight-search t      ag-group-matches nil)

(defalias 'yes-or-no-p 'y-or-n-p)

;; ** end

(global-set-key (kbd "C-c a") 'ag-project-regexp)

(set-face-background 'mode-line "Blue")

(message "Done with init.el")




;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(safe-local-variable-values
;;    '((c-file-offsets
;;       (innamespace . 0)
;;       (substatement-open . 0)
;;       (c . c-lineup-dont-change)
;;       (inextern-lang . 0)
;;       (comment-intro . c-lineup-dont-change)
;;       (arglist-cont-nonempty . c-lineup-arglist)
;;       (block-close . 0)
;;       (statement-case-intro . ++)
;;       (brace-list-intro . ++)
;;       (cpp-define-intro . +))
;;      (c-auto-align-backslashes)
;;      (whitespace-style quote
;;                        (face trailing empty tabs))
;;      (whitespace-action))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )


(setenv "CLASP_SBCL" "sbcl")
;;(setenv "AMBERHOME" "/opt/amber")
(setenv "EXTERNALS_CLASP_DIR" (concat (getenv "HOME") "/Development/externals-clasp"))
(setenv "CANDO_LISP_SOURCE_DIR" (concat (getenv "HOME") "/Development/clasp/projects/cando/src"))
(setenv "CLASP_APP_DIR" (concat (getenv "HOME") "/.local/clasp"))


(message "Starting up")
(add-to-list 'auto-save-file-name-transforms '("\\`.*/Dropbox/.*" "/tmp/" t))
(add-to-list 'backup-directory-alist '("\\`.*/Dropbox/.*" . "/tmp/"))




(put 'upcase-region 'disabled nil)


(setq exec-path (append exec-path '("/usr/local/opt/llvm@14/bin/")))



;; Locked mode
(global-set-key (kbd "C-c l") 'locked-buffer-mode)

(define-minor-mode locked-buffer-mode
  "Make the current window always display this buffer."
  nil " locked" nil
  (set-window-dedicated-p (selected-window) locked-buffer-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Turn on automatic closing of parentheses and double quotes
;;(electric-pair-mode t)

;;
;; I want M-( bound to a function that wraps parentheses around the next s-sexp
;;
(defun insert-parens-around-sexp ()
  "Insert parentheses around the next s-expression."
  (interactive)
  (insert "(")
  (save-excursion
    (forward-sexp)
    (insert ")")))

;;
;; I want M-( bound to a function that wraps parentheses around the next s-sexp
;;
(defun insert-single-paren ()
  "Insert a single paren"
  (interactive)
  (insert "("))

(defun my-lisp-mode-customizations ()
  "Customizations for Lisp mode."
  (local-set-key (kbd "M-(") 'insert-parens-around-sexp)
  (local-set-key (kbd "C-(") 'insert-single-paren)
)

(add-hook 'lisp-mode-hook 'my-lisp-mode-customizations)

