;; Configuration file
;; Set up environment variables

(winner-mode 1)

(setq highlight-nonselected-windows t)


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
 '(gdb-non-stop-setting nil)
 '(magit-pull-arguments nil)
 '(package-selected-packages '(claude-code-ide))
 '(package-vc-selected-packages
   '((claude-code-ide :url
                      "https://github.com/manzaltu/claude-code-ide.el")))
 '(safe-local-variable-values
   '((Package . USOCKET) (Package . CHUNGA) (sly-load-failed-fasl . ask)
     (package . rune-dom) (Encoding . utf-8) (readtable . runes)
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

(add-to-list 'package-archives '( "jcs-elpa" . "https://jcs-emacs.github.io/jcs-elpa/packages/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(setq package-archive-priorities '(("melpa"    . 5)
                                   ("melpa-stable"    . 5)
                                   ("gnu"    . 5)
                                   ("jcs-elpa" . 0)))

(package-initialize)

(setq package-enable-at-startup nil)

(setq package-install-upgrade-built-in t)



(setq-default use-package-always-ensure t)

(use-package vterm
  :ensure t
  :bind (:map vterm-mode-map
              ("<escape>" . vterm--self-insert)))
(use-package math-preview
  :custom (math-preview-command "/Applications/ccp4-9/bin/math-preview"))
(use-package rainbow-delimiters)
(use-package goto-chg)
(use-package clipetty)
(use-package symbol-overlay)
(use-package cl-lib)
(use-package ag)
(use-package transpose-frame
  :ensure t)
(use-package svg)
(use-package yasnippet)
(use-package free-keys)
(use-package bind-key)
(use-package wgrep)
(use-package wgrep-ag)
(use-package magit)
(use-package macrostep)
(use-package git-timemachine)
(use-package meow)
(use-package rust-mode)
(use-package ace-window)
(use-package which-key)
(use-package neotree)

(if nil
    (use-package claude-code-ide
      :vc (:url "https://github.com/manzaltu/claude-code-ide.el" :rev :newest)
      :bind ("C-c C-'" . claude-code-ide-menu) ; Set your favorite keybinding
      :custom
      ;; Use a regular (splittable, resizable) window instead of a side
      ;; window. Side windows are non-resizable in Emacs — C-x ^ / C-x }
      ;; and mouse-drag are disabled on them. This flip makes the Claude
      ;; Code buffer obey standard window-management commands.
      (claude-code-ide-use-side-window nil)
      ;; Open the Claude Code buffer at the bottom spanning the full frame
      ;; width. Ignored by the package when use-side-window is nil, but
      ;; kept here because the display-buffer-alist entry below consults
      ;; the same placement intent.
      (claude-code-ide-window-side 'bottom)
      :config
      (claude-code-ide-emacs-tools-setup) ; Optionally enable Emacs MCP tools
      ;; Force the Claude Code buffer into a full-width bottom window via
      ;; display-buffer-alist. This runs independently of the package's
      ;; own placement logic — useful if the `use-side-window = nil` path
      ;; doesn't on its own put the window where you want it. Match on
      ;; the buffer-name pattern the package uses ("*claude-code*" and
      ;; variants like "*claude-code:/path/*"). Using
      ;; display-buffer-below-selected keeps the window splittable and
      ;; resizable unlike display-buffer-in-side-window.
      (add-to-list
       'display-buffer-alist
       '("\\*claude-code"
         (display-buffer-reuse-window display-buffer-at-bottom)
         (window-height . 0.3)))
      )
  (use-package claude-code-ide
    :vc (:url "https://github.com/manzaltu/claude-code-ide.el" :rev :newest)
    ;; Force the Claude Code buffer into a full-width bottom window via
    ;; display-buffer-alist. This runs independently of the package's
    ;; own placement logic — useful if the `use-side-window = nil` path
    ;; doesn't on its own put the window where you want it. Match on
    ;; the buffer-name pattern the package uses ("*claude-code*" and
    ;; variants like "*claude-code:/path/*"). Using
    ;; display-buffer-below-selected keeps the window splittable and
    ;; resizable unlike display-buffer-in-side-window.
    (add-to-list
     'display-buffer-alist
     '("\\*claude-code"
       (display-buffer-in-side-window)
       (side . right)
       (window-width . 90)
       (preserve-size . (t . nil))))
    ))


;; Claude Code vterm: start in insert state and disable trailing whitespace display
;; meow consults `meow-mode-state-list' when entering a major mode.
(with-eval-after-load 'meow
  (add-to-list 'meow-mode-state-list '(vterm-mode . insert)))
(add-hook 'vterm-mode-hook (lambda () (setq-local show-trailing-whitespace nil)))

;; C-c v in vterm enters copy mode for scrolling; i or q exits back to insert
(defun my/vterm-escape-to-copy-mode ()
  "Enter vterm-copy-mode and meow normal state for scrolling."
  (interactive)
  (vterm-copy-mode 1)
  (when (bound-and-true-p meow-mode) (meow-normal-mode)))

(defun my/vterm-exit-copy-mode ()
  "Exit vterm-copy-mode and return to meow insert state."
  (interactive)
  (vterm-copy-mode -1)
  (when (bound-and-true-p meow-mode) (meow-insert-mode)))

(add-hook 'vterm-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c v") #'my/vterm-escape-to-copy-mode)))

(with-eval-after-load 'vterm
  (define-key vterm-copy-mode-map (kbd "i") #'my/vterm-exit-copy-mode)
  (define-key vterm-copy-mode-map (kbd "q") #'my/vterm-exit-copy-mode))

(use-package multi-vterm :ensure t)

(use-package projectile
  :ensure t
;;  :pin melpa-stable
  :init (progn
          (projectile-mode +1))
  :bind (:map projectile-mode-map
              ("C-c p" . projectile-command-map)))

(projectile-add-known-project "~/common-lisp/tlt/foldamer/")
(projectile-add-known-project "~/common-lisp/tlt/open-force-field/")

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

;;;----------------------------------------------------------------------------
;;; Meow modal editing setup
;;;
;;; Standard qwerty bindings from meow's README.
;;;
;;; Several Emacs editing keys (C-a/C-e/C-k/C-d/C-y, M-o, M-.) are
;;; bound globally further down so they work in every meow state and
;;; in vterm. They are not redefined inside meow's state keymaps.
;;;
;;; There is no evil-collection equivalent for meow — modes meow
;;; doesn't know about default to MOTION state, which leaves the
;;; mode's own keybindings intact (dired, magit, help, etc.).
;;;----------------------------------------------------------------------------

(defun my/meow-toggle-kmacro ()
  "Start a keyboard macro, or end the current one — vim/evil-style `q'."
  (interactive)
  (if defining-kbd-macro
      (meow-end-kmacro)
    (kmacro-start-macro nil)))

(defun my/meow-setup ()
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
  (meow-motion-overwrite-define-key
   '("j" . meow-next)
   '("k" . meow-prev)
   '("<escape>" . ignore))
  (meow-leader-define-key
   '("j" . "H-j")
   '("k" . "H-k")
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument)
   '("/" . meow-keypad-describe-key)
   '("?" . meow-cheatsheet))
  (meow-normal-define-key
   '("0" . meow-expand-0)
   '("9" . meow-expand-9)
   '("8" . meow-expand-8)
   '("7" . meow-expand-7)
   '("6" . meow-expand-6)
   '("5" . meow-expand-5)
   '("4" . meow-expand-4)
   '("3" . meow-expand-3)
   '("2" . meow-expand-2)
   '("1" . meow-expand-1)
   '("-" . negative-argument)
   '(";" . meow-reverse)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("[" . meow-beginning-of-thing)
   '("]" . meow-end-of-thing)
   '("a" . meow-append)
   '("A" . meow-open-below)
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("c" . meow-change)
   '("d" . meow-kill)
   '("D" . meow-backward-delete)
   '("e" . meow-next-word)
   '("E" . meow-next-symbol)
   '("f" . meow-find)
   '("g" . meow-cancel-selection)
   '("G" . meow-grab)
   '("h" . meow-left)
   '("H" . meow-left-expand)
   '("i" . meow-insert)
   '("I" . meow-open-above)
   '("j" . meow-next)
   '("J" . meow-next-expand)
   '("k" . meow-prev)
   '("K" . meow-prev-expand)
   '("l" . meow-right)
   '("L" . meow-right-expand)
   '("m" . meow-join)
   '("n" . meow-search)
   '("o" . meow-block)
   '("O" . meow-to-block)
   '("p" . meow-yank)
   '("q" . meow-quit)
   '("Q" . meow-goto-line)
   '("r" . meow-replace)
   '("R" . my/meow-replace-char)
   '("s" . meow-delete)
   '("t" . meow-till)
   '("u" . meow-undo)
   '("U" . meow-undo-in-selection)
   '("v" . meow-visit)
   '("w" . meow-mark-word)
   '("W" . meow-mark-symbol)
   '("x" . meow-line)
   '("X" . meow-goto-line)
   '("y" . meow-save)
   '("Y" . meow-sync-grab)
   '("z" . meow-pop-selection)
   '("'" . repeat)
   '("%" . my/match-paren)
   '("<escape>" . ignore)))

(defun my/match-paren (arg)
  "Jump to the matching paren if on one; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s(") (forward-sexp 1) (backward-char))
        ((looking-back "\\s)" 1) (backward-sexp 1))
        ((looking-at "\\s)") (forward-char) (backward-sexp 1))
        (t (self-insert-command arg))))

(defun my/meow-replace-char ()
  "Vim-style r: replace the character at point with the next typed character."
  (interactive)
  (let ((char (read-char "Replace with: ")))
    (delete-char 1)
    (insert-char char)
    (backward-char)))

(require 'meow)
(my/meow-setup)
(meow-global-mode 1)

(defun pull-next-sexp-into-current ()
  (interactive)
  (delete-char 1)
  (forward-sexp 1)
  (insert ")")
  (backward-char 1))


(when nil
  (require 'seq) ;; built-in

  (defvar my/auto-bottom-prefixes '("*ChatGPT*" "*shell*" "*sly-mrepl")
    "Buffer name prefixes that should jump to the end when entered.")

  (defun my/jump-to-bottom-on-enter ()
    (let* ((win (selected-window))
           (name (buffer-name (window-buffer win))))
                                        ;    (message "jump hook fired in: %s" name)
      (when (and name
                 (seq-some (lambda (p) (string-prefix-p p name))
                           my/auto-bottom-prefixes))
        (goto-char (point-max))
        (set-window-point win (point-max))
        (recenter -1))))

  (add-hook 'buffer-list-update-hook #'my/jump-to-bottom-on-enter)
  )


(defun my-repl-point-in-input-p ()
  "Return non-nil if point is in the current input area."
  (if (fboundp 'comint-after-pmark-p)
      (comint-after-pmark-p)
    (eobp)))

(defun my-move-repl-point-to-end-on-insert ()
  "When entering insert in shell or SLY REPL, jump to end of input."
  (when (and (or (derived-mode-p 'shell-mode)
                 (derived-mode-p 'sly-mrepl-mode))
             (not (my-repl-point-in-input-p)))
    (goto-char (point-max))))

(add-hook 'meow-insert-enter-hook #'my-move-repl-point-to-end-on-insert)

(defun my-repl-exit-insert-when-not-at-eob ()
  "In shell/SLY REPL, drop to normal state when leaving input."
  (when (and (or (derived-mode-p 'shell-mode)
                 (derived-mode-p 'sly-mrepl-mode))
             (bound-and-true-p meow-insert-mode)
             (not (my-repl-point-in-input-p)))
    (meow-normal-mode)))

(defun my-repl-enter-insert-when-at-eob ()
  "In shell/SLY REPL, enter insert state automatically at end of buffer."
  (when (and (or (derived-mode-p 'shell-mode)
                 (derived-mode-p 'sly-mrepl-mode))
             (not (minibufferp))
             (not (bound-and-true-p meow-insert-mode))
             (eobp))
    (meow-insert-mode)))

(defun my-enable-repl-insert-guard ()
  "Enable buffer-local guard to keep insert inside prompt input."
  (add-hook 'post-command-hook #'my-repl-exit-insert-when-not-at-eob nil t)
  (add-hook 'post-command-hook #'my-repl-enter-insert-when-at-eob nil t))

(add-hook 'shell-mode-hook #'my-enable-repl-insert-guard)
(add-hook 'sly-mrepl-mode-hook #'my-enable-repl-insert-guard)

;;; Turn on dispatch always when M-o is activated
(setq aw-dispatch-always t)

;; Window management — global so they work in every meow state and in vterm.
(global-set-key (kbd "M-o")   'ace-window)
(global-set-key (kbd "C-x o") 'ace-window)
(global-set-key (kbd "C-x p") 'ace-window)

;; M-. — Lisp definition jump. (Meow's `meow-visit' simulates M-. internally,
;; so this binding also gets used by pressing `v' in meow normal state.)
(global-set-key (kbd "M-.") 'sly-edit-definition)

;; Page scroll on C-b / C-f. Meow simulates keystrokes for its motion
;; commands (see `meow--kbd-*' in meow-var.el): meow-left/right would
;; otherwise press C-b/C-f and inherit our scroll rebinding. Redirect
;; meow's char-motion simulation to the arrow keys (which default to
;; `left-char'/`right-char') so C-b/C-f are free for paging.
(setq meow--kbd-backward-char "<left>")
(setq meow--kbd-forward-char  "<right>")
(global-set-key (kbd "C-b") 'scroll-down-command)
(global-set-key (kbd "C-f") 'scroll-up-command)

;; Cursor shape per meow state (port of evil-{insert,normal}-state-cursor).
;; Color is set in hooks below since meow's cursor-type vars only carry shape.
(setq meow-cursor-type-normal 'box)
(setq meow-cursor-type-insert '(bar . 2))
(setq meow-cursor-type-motion 'box)
(setq meow-cursor-type-keypad 'hollow)
(setq meow-cursor-type-beacon 'box)
(add-hook 'meow-insert-enter-hook (lambda () (set-cursor-color "chartreuse3")))
(add-hook 'meow-insert-exit-hook  (lambda () (set-cursor-color "white")))

;;;----------------------------------------------------------------------------

;;; Per-buffer background coloring driven by meow state.
;;; Current buffer tinted by state; all other visible buffers forced black.
;;;   insert  -> #003000 (green)
;;;   normal  -> #300000 (red)        ;; default fallback
;;;   motion  -> #000030 (blue)
;;;   keypad  -> #303000 (yellow)

(defvar-local my/meow-bg-remap-cookies nil)
(defvar my/meow-bg-last-buffer nil)

(defun my/clear-meow-bg-remaps ()
  "Remove any buffer-local background remaps applied for meow state."
  (when my/meow-bg-remap-cookies
    (mapc #'face-remap-remove-relative my/meow-bg-remap-cookies)
    (setq my/meow-bg-remap-cookies nil)))

(defun my/set-buffer-bg-color (color)
  "Apply a buffer-local background COLOR to relevant faces."
  (my/clear-meow-bg-remaps)
  (setq my/meow-bg-remap-cookies
        (mapcar (lambda (face)
                  (face-remap-add-relative face `(:background ,color)))
                '(default fringe line-number line-number-current-line))))

(defun my/set-window-divider-bg-black ()
  "Keep window divider faces black globally to avoid color ghosts."
  (dolist (face '(vertical-border window-divider window-divider-first-pixel window-divider-last-pixel))
    (when (facep face)
      (set-face-background face "#000000"))))

(defun my/update-meow-window-bg ()
  "Set window background color based on meow state.
vterm-mode buffers are always green when current (terminals are
effectively `insert' even in meow's motion or with meow disabled,
as in the claude-code-ide vterm)."
  (let ((color (cond
                ((derived-mode-p 'vterm-mode)        "#003000")
                ((bound-and-true-p meow-insert-mode) "#003000")
                ((bound-and-true-p meow-motion-mode) "#000030")
                ((bound-and-true-p meow-keypad-mode) "#303000")
                (t                                    "#300000"))))
    (my/set-buffer-bg-color color)))

(defun my/update-meow-bg-for-selected-window (&rest _)
  "Only the current buffer gets meow state color; others are black."
  ;; Reset if the tracked buffer died
  (unless (buffer-live-p my/meow-bg-last-buffer)
    (setq my/meow-bg-last-buffer nil))

  (let ((curr (current-buffer)))
    ;; When moving away from the previous buffer, force it to black
    (unless (eq curr my/meow-bg-last-buffer)
      (when (and my/meow-bg-last-buffer (buffer-live-p my/meow-bg-last-buffer))
        (with-current-buffer my/meow-bg-last-buffer
          (my/set-buffer-bg-color "#000000")))
      (setq my/meow-bg-last-buffer curr))

    ;; Blacken all visible non-current buffers
    (walk-windows
     (lambda (win)
       (with-selected-window win
         (let ((buf (window-buffer win)))
           (unless (eq buf curr)
             (with-current-buffer buf
               (my/set-buffer-bg-color "#000000"))))))
     nil t)

    ;; Color the current buffer according to meow state (compilation stays black)
    (with-current-buffer curr
      (if (string-match-p "compilation\\*\\'" (buffer-name))
          (my/set-buffer-bg-color "#000000")
        (my/update-meow-window-bg)))))

;; Hooks to track meow state transitions and window selection.
(add-hook 'meow-insert-enter-hook #'my/update-meow-bg-for-selected-window)
(add-hook 'meow-insert-exit-hook  #'my/update-meow-bg-for-selected-window)
(add-hook 'meow-normal-mode-hook  #'my/update-meow-bg-for-selected-window)
(add-hook 'meow-motion-mode-hook  #'my/update-meow-bg-for-selected-window)
(add-hook 'meow-keypad-mode-hook  #'my/update-meow-bg-for-selected-window)
(add-hook 'window-selection-change-functions #'my/update-meow-bg-for-selected-window)
(add-hook 'post-command-hook      #'my/update-meow-bg-for-selected-window) ;; belt-and-suspenders
(add-hook 'emacs-startup-hook     #'my/update-meow-bg-for-selected-window)
(add-hook 'emacs-startup-hook     #'my/set-window-divider-bg-black)






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
            ;; M-. in C++ uses ggtags-find-definition (overrides the global sly binding).
            (local-set-key (kbd "M-.") 'ggtags-find-definition)))

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
(set-face-attribute 'trailing-whitespace nil :background "#3a3a3a")

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

(defun refresh-ssh-auth-sock ()
  (interactive)
  (setenv "SSH_AUTH_SOCK" (expand-file-name "~/.ssh/ssh_auth_sock")))




(setq split-height-threshold nil)
(setq split-width-threshold 160)

(put 'erase-buffer 'disabled nil)



(defun toggle-let-let* ()
  "Toggle between `let` and `let*` when point is inside a let/let* form."
  (interactive)
  (save-excursion
    (let ((original-point (point))
          (found nil))
      ;; Walk up through enclosing sexps looking for let or let*
      (condition-case nil
          (while (not found)
            (backward-up-list 1)
            (save-excursion
              (forward-char 1) ;; move past the opening paren
              (let ((sym-start (point)))
                (forward-sexp 1)
                (let ((sym (buffer-substring-no-properties sym-start (point))))
                  (cond
                   ((string= sym "let")
                    (goto-char sym-start)
                    (delete-char 3)
                    (insert "let*")
                    (setq found t)
                    (message "let → let*"))
                   ((string= sym "let*")
                    (goto-char sym-start)
                    (delete-char 4)
                    (insert "let")
                    (setq found t)
                    (message "let* → let")))))))
        (scan-error
         (unless found
           (message "No enclosing let/let* form found")))))))

(define-key lisp-mode-map (kbd "C-c *") #'toggle-let-let*)

;; Prevent transpose-frame from duplicating claude-code-ide windows.
;; Hide the claude-code window before transposing, restore it after.
(defun my/transpose-frame-hide-claude ()
  "Transpose frame, hiding and restoring side windows around transpose-frame."
  (interactive)
  (let ((sides-visible (window-with-parameter 'window-side)))
    (when sides-visible
      (window-toggle-side-windows))
    (transpose-frame)
    (when sides-visible
      (window-toggle-side-windows))))


(setq window-size-fixed nil)

(add-to-list 'display-buffer-alist
             '("\\*claude-code"
               (display-buffer-in-direction)
               (direction . right)
               (window-width . 0.3)))

(global-set-key (kbd "C-x |") 'my/transpose-frame-hide-claude)

;; Toggle claude-code side window visibility
(global-set-key (kbd "C-x /") 'claude-code-ide-menu)

;; Never enable meow in *claude-code* buffers — the claude-code vterm
;; runs its own keybindings and should not be intercepted by any meow state.
(add-hook 'vterm-mode-hook
          (lambda ()
            (when (string-match-p "claude-code" (buffer-name))
              (when (bound-and-true-p meow-mode)
                (meow-mode -1)))))
;;
;; Make the clipetty drag-selection automatically copy to the kill ring without needing M-w
;;
(setq mouse-drag-copy-region t)

(xterm-mouse-mode)

(global-clipetty-mode)

(defun my/refresh-ssh-tty ()
  "Pull current SSH_TTY from tmux into Emacs environment."
  (interactive)
  (when (getenv "TMUX")
    (let ((tty (string-trim
                (shell-command-to-string
                 "tmux display-message -p '#{client_tty}'"))))
      (setenv "SSH_TTY" tty)
      (message "SSH_TTY updated to %s" tty))))

(add-hook 'focus-in-hook #'my/refresh-ssh-tty)


(defun my/claude-remember-width ()
  "Persist current claude-code-ide window width."
  (when-let* ((win (get-buffer-window
                    (seq-find (lambda (b)
                                (string-prefix-p "*claude-code" (buffer-name b)))
                              (buffer-list)))))
    (setq claude-code-ide-window-width (window-total-width win))))

(add-hook 'window-size-change-functions
          (lambda (_frame) (my/claude-remember-width)))

