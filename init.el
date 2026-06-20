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
 '(package-selected-packages nil)
 '(package-vc-selected-packages
   '((claude-code-ide :url
                      "https://github.com/manzaltu/claude-code-ide.el")))
 '(safe-local-variable-values
   '((Package . USOCKET) (Package . CHUNGA) (package . rune-dom)
     (Encoding . utf-8) (readtable . runes) (Package . CXML)
     (Package . TRIVIAL-GRAY-STREAMS) (Syntax . ANSI-Common-lisp)
     (Package . ASDF) (package . puri)
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
(use-package evil)
(use-package evil-collection)
(use-package rust-mode)
(use-package ace-window)
(use-package which-key)
(use-package evil-terminal-cursor-changer)
(use-package neotree)

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
     (window-height . 0.3))))

;; Claude Code vterm: start in insert mode and disable trailing whitespace display
(add-to-list 'evil-insert-state-modes 'vterm-mode)
(add-hook 'vterm-mode-hook (lambda () (setq-local show-trailing-whitespace nil)))

;; C-c v in vterm enters copy mode for scrolling; q exits back to insert
(defun my/vterm-escape-to-copy-mode ()
  "Enter vterm-copy-mode and evil normal state for scrolling."
  (interactive)
  (vterm-copy-mode 1)
  (evil-normal-state))

(defun my/vterm-exit-copy-mode ()
  "Exit vterm-copy-mode and return to evil insert state."
  (interactive)
  (vterm-copy-mode -1)
  (evil-insert-state))

(add-hook 'vterm-mode-hook
          (lambda ()
            (evil-local-set-key 'insert (kbd "C-c v") #'my/vterm-escape-to-copy-mode)
            ;; Also bind locally (outside evil) so it works in the
            ;; claude-code-ide vterm where we put evil into emacs-state.
            (local-set-key (kbd "C-c v") #'my/vterm-escape-to-copy-mode)))

(with-eval-after-load 'vterm
  (define-key vterm-copy-mode-map (kbd "i") #'my/vterm-exit-copy-mode)
  (define-key vterm-copy-mode-map (kbd "q") #'my/vterm-exit-copy-mode)
  ;; C-l is unbound in vterm-mode-map, so it gets forwarded to the
  ;; program inside (Claude Code), whose TUI treats C-l as clear-screen
  ;; -- which looks like everything vanished. Bind it here so Emacs
  ;; recenters the window instead of sending it to the terminal.
  (define-key vterm-mode-map (kbd "C-l") #'recenter-top-bottom)
  ;; Keep a lot more scrollback so there is actually something to
  ;; scroll back to (default is only 1000 lines). 100000 is vterm's max.
  (setq vterm-max-scrollback 100000))

(use-package multi-vterm :ensure t)

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



;;; SLIME support.
;;; Loaded so that `M-x slime' works, but `slime-mode' is NOT added to
;;; `lisp-mode-hook' — that would conflict with the default lisp interaction.
(when t
  (add-to-list 'load-path "~/Development/slime")
  (add-to-list 'load-path "~/Development/slime/contrib")
  (require 'slime-autoloads)
  (with-eval-after-load 'slime
    (message "configuring slime-fancy")
    (slime-setup '(slime-fancy))
    ;; slime-setup adds `slime-lisp-mode-hook' to `lisp-mode-hook', which
    ;; auto-enables `slime-mode'. Remove it so .lisp buffers don't get
    ;; slime-mode automatically. `M-x slime' still starts a session on demand.
    (remove-hook 'lisp-mode-hook 'slime-lisp-mode-hook))
  ;; Pick implementation at `M-x slime' time. First entry is the default
  ;; when invoked with a prefix argument; `C-u M-x slime' lets you choose.
  (setq slime-lisp-implementations
        '((sbcl  ("sbcl"))
          (cando ("~/Development/cando/build/boehmprecise/cando")))))



(setq byte-compile-warnings '(cl-functions))

(if 1
    (progn
      (evil-mode 1)
      ;; Exclude slime from evil-collection. Recent evil-collection-slime
      ;; installs an insert-state RET binding (newline-and-indent) that
      ;; we couldn't reliably override from init.el, and the base
      ;; slime-repl-mode-map already binds RET to the submit function we want.
      (with-eval-after-load 'evil-collection
        (setq evil-collection-mode-list
              (seq-difference evil-collection-mode-list '(slime))))
      (evil-collection-init)))

(setq evil-want-fine-undo 'fine)

(defun pull-next-sexp-into-current ()
  (interactive)
  (delete-char 1)
  (forward-sexp 1)
  (insert ")")
  (backward-char 1))


(when nil
  (require 'seq) ;; built-in

  (defvar my/auto-bottom-prefixes '("*ChatGPT*" "*shell*")
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
  "When entering insert in shell, jump to end of input."
  (when (and (derived-mode-p 'shell-mode)
             (not (my-repl-point-in-input-p)))
    (goto-char (point-max))))

(add-hook 'evil-insert-state-entry-hook #'my-move-repl-point-to-end-on-insert)

(defun my-repl-exit-insert-when-not-at-eob ()
  "In shell, drop to normal state when leaving input."
  (when (and (derived-mode-p 'shell-mode)
             (evil-insert-state-p)
             (not (my-repl-point-in-input-p)))
    (evil-normal-state)))

(defun my-repl-enter-insert-when-at-eob ()
  "In shell, enter insert state automatically at end of buffer."
  (when (and (derived-mode-p 'shell-mode)
             (not (minibufferp))
             (not (evil-insert-state-p))
             (eobp))
    (evil-insert-state)))

(defun my-enable-repl-insert-guard ()
  "Enable buffer-local guard to keep insert inside prompt input."
  (add-hook 'post-command-hook #'my-repl-exit-insert-when-not-at-eob nil t)
  (add-hook 'post-command-hook #'my-repl-enter-insert-when-at-eob nil t))

;; For shell-mode: start in insert state at end-of-buffer and stay there until
;; the user hits ESC. The old `my-enable-repl-insert-guard' flipped state on
;; every post-command based on point position; we no longer want that here.
(add-to-list 'evil-insert-state-modes 'shell-mode)
(defun my-shell-goto-eob ()
  (goto-char (point-max)))
(add-hook 'shell-mode-hook #'my-shell-goto-eob)

;; Newer evil-collection versions rebind RET in insert state to
;; newline-and-indent in comint/slime REPL maps and expect submission to
;; happen in normal state. That conflicts with how we drive these REPLs (we
;; live in insert state). Force RET to submit in both the base map and evil's
;; insert/normal state maps so behavior is consistent across evil-collection
;; versions.
(with-eval-after-load 'comint
  (define-key comint-mode-map (kbd "RET") 'comint-send-input))

(with-eval-after-load 'evil
  (evil-define-key 'insert comint-mode-map (kbd "RET") 'comint-send-input)
  (evil-define-key 'normal comint-mode-map (kbd "RET") 'comint-send-input))

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
;; Also bind globally (outside evil) so ace-window still works in buffers
;; where evil is off — e.g. the claude-code-ide vterm.
(global-set-key (kbd "M-o") 'ace-window)
(global-set-key (kbd "C-x o") 'ace-window)
(global-set-key (kbd "C-x p") 'ace-window)

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

;; Dispatch M-. to SLIME's definition lookup when slime-mode is active,
;; otherwise fall back to xref.
(defun my-edit-definition-dispatch ()
  (interactive)
  (cond ((bound-and-true-p slime-mode) (call-interactively 'slime-edit-definition))
        (t                             (call-interactively 'xref-find-definitions))))

(evil-global-set-key 'insert  (kbd "M-.") 'my-edit-definition-dispatch)
(evil-global-set-key 'replace (kbd "M-.") 'my-edit-definition-dispatch)
(evil-global-set-key 'normal  (kbd "M-.") 'my-edit-definition-dispatch)
(evil-global-set-key 'visual  (kbd "M-.") 'my-edit-definition-dispatch)

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

(defvar-local my/evil-bg-remap-cookies nil)
(defvar my/evil-bg-last-buffer nil)
(defvar-local my/vterm-bg-overlay nil
  "Buffer-local overlay forcing background color in vterm buffers.
Needed because vterm's C module bakes the *global* default-face
background into per-cell `:background' text properties at render
time, so `face-remap-add-relative' on `default' does not affect
already-rendered cells. An overlay's face attributes outrank
text-property face attributes in the display merge order, so this
is the only reliable way to recolor vterm cells.")

(defun my/clear-evil-bg-remaps ()
  "Remove any buffer-local background remaps applied for Evil state."
  (when my/evil-bg-remap-cookies
    (mapc #'face-remap-remove-relative my/evil-bg-remap-cookies)
    (setq my/evil-bg-remap-cookies nil)))

(defun my/extend-vterm-bg-overlay (&rest _)
  "Keep `my/vterm-bg-overlay' covering the whole buffer after changes."
  (when (overlayp my/vterm-bg-overlay)
    (move-overlay my/vterm-bg-overlay (point-min) (point-max))))

(defun my/set-buffer-bg-color (color)
  "Apply a buffer-local background COLOR to relevant faces."
  (my/clear-evil-bg-remaps)
  (setq my/evil-bg-remap-cookies
        (mapcar (lambda (face)
                  (face-remap-add-relative face `(:background ,color)))
                ;; `default' covers regular buffer text and the empty
                ;; area past end-of-buffer; the rest are for fringes
                ;; and line numbers.
                '(default fringe line-number line-number-current-line)))
  ;; vterm: face-remap on `default' doesn't touch already-rendered
  ;; cells because they have explicit `:background' text properties.
  ;; Use a high-priority full-buffer overlay to win the merge.
  (when (derived-mode-p 'vterm-mode)
    (unless (overlayp my/vterm-bg-overlay)
      (setq my/vterm-bg-overlay
            (make-overlay (point-min) (point-max) nil nil t))
      (overlay-put my/vterm-bg-overlay 'priority 100)
      (add-hook 'after-change-functions
                #'my/extend-vterm-bg-overlay nil t))
    (move-overlay my/vterm-bg-overlay (point-min) (point-max))
    (overlay-put my/vterm-bg-overlay 'face
                 `(:background ,color :extend t))))

(defun my/set-window-divider-bg-black ()
  "Keep window divider faces black globally to avoid color ghosts."
  (dolist (face '(vertical-border window-divider window-divider-first-pixel window-divider-last-pixel))
    (when (facep face)
      (set-face-background face "#000000"))))

(defun my/update-evil-window-bg ()
  "Set window background color based on Evil state."
  (let ((color (cond ((eq evil-state 'insert)  "#003000")
                     ((eq evil-state 'replace) "#000030")
                     ((eq evil-state 'emacs)   "#001a4a")
                     (t                        "#300000"))))
    (my/set-buffer-bg-color color)))

(defun my/update-evil-bg-for-selected-window ()
  "Only the current buffer gets Evil state color; others are black."
  ;; Reset if the tracked buffer died
  (unless (buffer-live-p my/evil-bg-last-buffer)
    (setq my/evil-bg-last-buffer nil))

  (let ((curr (current-buffer)))
    ;; When moving away from the previous buffer, force it to black
    (unless (eq curr my/evil-bg-last-buffer)
      (when (and my/evil-bg-last-buffer (buffer-live-p my/evil-bg-last-buffer))
        (with-current-buffer my/evil-bg-last-buffer
          (my/set-buffer-bg-color "#000000")))
      (setq my/evil-bg-last-buffer curr))

    ;; Blacken all visible non-current buffers
    (walk-windows
     (lambda (win)
       (with-selected-window win
         (let ((buf (window-buffer win)))
           (unless (eq buf curr)
             (with-current-buffer buf
               (my/set-buffer-bg-color "#000000"))))))
     nil t)

    ;; Color the current buffer according to Evil state (compilation stays
    ;; black; *claude-code* gets dark purple when selected).
    (with-current-buffer curr
      (cond
       ((string-match-p "compilation\\*\\'" (buffer-name))
        (my/set-buffer-bg-color "#000000"))
       ((string-match-p "\\*claude-code" (buffer-name))
        (my/set-buffer-bg-color "#200040"))
       (t
        (my/update-evil-window-bg))))))

;; Hooks to track Evil mode transitions and window selection
(if 1
    (progn
      (add-hook 'evil-insert-state-entry-hook #'my/update-evil-bg-for-selected-window)
      (add-hook 'evil-insert-state-exit-hook #'my/update-evil-bg-for-selected-window)
      (add-hook 'window-selection-change-functions (lambda (_win) (my/update-evil-bg-for-selected-window)))
      (add-hook 'post-command-hook #'my/update-evil-bg-for-selected-window) ;; Catch ESC properly
      (add-hook 'emacs-startup-hook #'my/update-evil-bg-for-selected-window)))
(add-hook 'emacs-startup-hook #'my/set-window-divider-bg-black)






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
(when (boundp 'scroll-bar-mode) (scroll-bar-mode -1))
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

;; Never enable evil in *claude-code* buffers. `evil-buffer-regexps' is
;; consulted by `turn-on-evil-mode' (via `evil-initial-state-for-buffer')
;; before evil-local-mode is activated, so it wins the race against
;; vterm-mode being in `evil-insert-state-modes'. A nil state means
;; evil is not turned on at all.
(with-eval-after-load 'evil
  (add-to-list 'evil-buffer-regexps '("\\*claude-code" . nil)))

;; Belt-and-suspenders: if anything forces evil on in a claude-code
;; buffer after the fact, turn it back off.
(add-hook 'vterm-mode-hook
          (lambda ()
            (when (string-match-p "claude-code" (buffer-name))
              (when (bound-and-true-p evil-local-mode)
                (evil-local-mode -1)))))
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

(add-hook 'sldb-mode-hook
          (lambda ()
            (local-set-key (kbd "j") 'next-line)
            (local-set-key (kbd "k") 'previous-line)))
