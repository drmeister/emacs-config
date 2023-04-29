;; Configuration file
;; Set up environment variables


(print "Starting dot_emacs part")

(if (file-exists-p "~/.emacs")
    (error "The file ~/.emacs exists - remove it - we only use init.el to startup"))

(message "Setting up path in init.el")



(setenv "PATH"
        (concat
         (concat (getenv "HOME") "/usr/local/Cellar/llvm/6.0.0/bin/")
         "/usr/local/bin:"
         (concat (getenv "HOME") "/anaconda/bin:")    ; Need so that *compiliation* works like *shell*
         (concat (getenv "HOME") "/miniconda2/bin:")  ; Need so that *compiliation* works like *shell*
         "/usr/local/bin:"
         "/usr/local/opt/llvm@14/bin:"
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
(setenv "EXTERNALS_CLASP_DIR" (concat (getenv "HOME") "/Development/externals-clasp"))
(setenv "CANDO_LISP_SOURCE_DIR" (concat (getenv "HOME") "/Development/clasp/projects/cando/src"))
(setenv "CLASP_APP_DIR" (concat (getenv "HOME") "/.local/clasp"))



;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)

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
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes '(leuven))
 '(gdb-non-stop-setting nil)
 '(magit-pull-arguments nil)
 '(package-selected-packages
   '(slime-autoloads
     use-package
     wgrep-ag
     ag
     command-log-mode
     iedit
     wgrep
     clang-format+
     git-wip-timemachine
     realgud-lldb
     ztree fireplace
     folding
     fold-dwim
     json-mode
;;;     yasnippet
     slime
     rainbow-blocks
     paredit
     magit
     gnuplot
     git-timemachine
     ggtags
     flylisp
     evil
     clang-format))

 '(safe-local-variable-values
   '((Package . TRIVIAL-GRAY-STREAMS)
     (Syntax . ANSI-Common-lisp)
     (Package . ASDF)
     (package . puri)
     (eval when
           (fboundp 'c-toggle-comment-style)
           (c-toggle-comment-style 1))
     (eval c-set-offset 'innamespace 0)
     (eval c-set-offset 'brace-list-open 0)
     (Package . CLPYTHON\.APP\.REPL)
     (Package . CLPYTHON\.PARSER)
     (Readtable . PY-AST-USER-READTABLE)
     (Package . CLPYTHON)
     (readtable . py-user-readtable)
     (package . clpython)
     (Readtable . PY-USER-READTABLE)
     (Package . CLPYTHON\.TEST)
     (Package . CLPYTHON\.UTIL)
     (Package . CL-INTERPOL)
     (Package . CLIM-INTERNALS)
     (Package ITERATE :use "COMMON-LISP" :colon-mode :external)
     (Lowercase . Yes)
     (Package . XLIB)
     (Package . CL-UNICODE)
     (whitespace-style quote
                       (face trailing empty tabs))
     (whitespace-action)
     (Package . CCL)
     (Package RT :use "COMMON-LISP" :colon-mode :external)
     (syntax . COMMON-LISP)
     (Package . monitor)
     (Package . HUNCHENTOOT)
     (Package . CL-USER)
     (Package . CL-FAD)
     (Syntax . Common-lisp)
     (Package . XREF)
     (Package . CL-PPCRE)
     (Syntax . COMMON-LISP)
     (encoding . utf-8)
     (Package . LISP-UNIT)
     (Base . 8)
     (Package . INTL)
     (Package . make)
     (Package . Maxima)
     (c-file-offsets
      (innamespace . 0)
      (substatement-open . 0)
      (c . c-lineup-dont-change)
      (inextern-lang . 0)
      (comment-intro . c-lineup-dont-change)
      (arglist-cont-nonempty . c-lineup-arglist)
      (block-close . 0)
      (statement-case-intro . ++)
      (brace-list-intro . ++)
      (cpp-define-intro . +))
     (c-auto-align-backslashes)
     (c-file-offsets
      (innamespace . 0)
      (substatement-open . 0)
      (c . c-lineup-dont-change)
      (inextern-lang . 0)
      (comment-intro . c-lineup-dont-change)
      (block-close . 0))
     (c-file-offsets
      (innamespace . 0)
      (substatement-open . 0)
      (c . c-lineup-dont-change)
      (inextern-lang . 0)
      (comment-intro . c-lineup-dont-change)
      (arglist-cont-nonempty . llvm-c-lineup-arglist)
      (block-close . 0))
     (Syntax . ANSI-Common-Lisp)
     (Base . 10)
     (Package . C)
     (Package . SYSTEM)
     (Package . CLOS)
     (Syntax . Common-Lisp)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
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

(evil-mode 1)

;;; Configure use-package
;;;
;;; package initialization

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

(setq package-enable-at-startup nil)
(package-initialize)

;;; use-package macro bootstrapping
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(setq-default use-package-always-ensure t)


(use-package cl-lib)
(use-package ag)
(use-package yasnippet)
(use-package bind-key)
(use-package wgrep)
(use-package wgrep-ag)
(use-package magit)
(use-package slime)
(use-package macrostep)
(use-package git-timemachine)

(setq byte-compile-warnings '(cl-functions))



;; Fix annoying problem where my right thumb invokes <xterm-paste> on macOS trackpad
;; Argh - I can't use this because it kills all pastes

;(global-set-key (kbd "<xterm-paste>") 'redraw-display) 

(add-to-list 'auto-mode-alist '("\\(/\\|\\`\\)[Mm]akefile" . makefile-mode))

;;;(setenv "PATH" "/Users/meister/Development/externals-clasp/build/release/bin:/usr/local/bin:/Users/meister/anaconda/bin:/Users/meister/anaconda/bin:/Users/meister/miniconda2/bin://anaconda/bin:/Users/meister/anaconda/bin:/usr/local/Cellar/bison/3.0.4/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/texbin:/Applications/Wireshark.app/Contents/MacOS:/Users/meister/local/clasp/MacOS:/usr/texbin:/Applications/CMake.app/Contents/bin:/Users/meister/Development/amber/bin:/Users/meister/Development/externals-clasp/build/release/bin:/Applications/Emacs.app/Contents/MacOS/bin-x86_64-10_9:/Applications/Emacs.app/Contents/MacOS/libexec-x86_64-10_9")

(setenv "CLASP_SBCL" "sbcl")
(setenv "EXTERNALS_CLASP_DIR" "/Users/meister/Development/externals-clasp")
(setenv "CANDO_LISP_SOURCE_DIR" "/Users/meister/Development/clasp/projects/cando/src")
(setenv "CLASP_APP_DIR" "/Users/meister/.local/clasp")


;; ** MELPA stuff
;; Set up the Melpa package repository
(message "Setting up melpa")

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
;;(package-initialize) ;; You might already have this line



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

;; ** Slime stuff
(message "Loading slime")
(when nil
  (add-to-list 'load-path
               "~/.emacs.d/elpa/slime-20230131.1950")
  ;;(setq slime-contribs '(slime-fancy slime-scratch slime-asdf))
  ;;(setq slime-contribs '(slime-fancy slime-scratch))
  (slime-setup '(slime-scratch slime-fancy slime-asdf))
  (require 'slime-autoloads)
  (slime-setup '(slime-fancy slime-tramp slime-indentation))
  (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
  (setq slime-fuzzy-explanation "")
;;; Get slime-lisp-implementations from .emacs
  (global-set-key "\C-cs" 'slime-selector)
  )

(setq slime-lisp-implementations
      '((cando ("~/Development/cando/build/boehmprecise/cando" "-f" "generate-bytecode" "--base"))
        (sbcl ("sbcl" "sbcl"))))

(defun slime-eval-comment-last-expression (string)
  "Evaluate sexp before point; print value, commented, into the current buffer"
  (interactive (list (slime-last-expression)))
  (insert "\n#| ")
  (insert (cadr (slime-eval `(swank:eval-and-grab-output ,string))))
  (insert " |#"))
(global-set-key (kbd "C-M-S-x") 'slime-eval-comment-last-expression)

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



;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)

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
