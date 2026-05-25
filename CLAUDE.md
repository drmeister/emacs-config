# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A personal Emacs configuration (`~/.emacs.d`). The owner uses it primarily for **Common Lisp development** (Clasp/Cando — a CL implementation built on LLVM) and **C/C++** work on the same project. Most edits are to `init.el`; the rest of the directory is a mix of vendored elisp, package state, and runtime artifacts.

## Entry points and load order

- `~/.emacs` is meant to be a symlink to `dot-emacs` (created by `make setup`). `dot-emacs` sets `PATH` and then loads `init.el`. **Do not create a literal `~/.emacs` file** — `init.el` errors out at line 8 if `~/.emacs` exists as a real file (the symlink to `dot-emacs` is fine, but the check fires either way; the intent is "use init.el, not .emacs").
- `init.el` is the real configuration. It is ~1000 lines, mostly imperative, and is the file to edit for almost any change.
- `configuration.org` is **stale** — it documents an older org-babel-based setup. Do not edit it expecting changes to take effect; the live config is `init.el`.
- `init.el.meow` is a snapshot of an abandoned meow-mode experiment. `init.el.pre-meow` is the pre-experiment baseline (identical to the current `init.el`). `init.el.slime` and `#init.el#` / `#init.el.slime#` are Emacs auto-save / backup files. None of these are active config.

## Package management

Uses **package.el + use-package** (not elpaca, despite the `elpaca/` directory being present — it is unused state from a prior experiment). Archives in priority order: melpa, melpa-stable, gnu, jcs-elpa. `use-package-always-ensure` is `t`, so adding `(use-package foo)` will install `foo` on next startup.

`claude-code-ide` is installed via `package-vc` from GitHub (see `package-vc-selected-packages` in custom-set-variables and the `use-package claude-code-ide` block).

When adding a new package: prefer extending the existing `use-package` block list near the top of `init.el` rather than scattering `(require 'foo)` calls.

## Vendored / patched elisp (top-level .el files)

These are loaded by explicit `(load "~/.emacs.d/FOO.el")` calls — they are **not** managed by package.el and edits to them take effect directly:

- `gud-lldb.el` / `gud.el` — locally patched copies of Emacs's gud to add LLDB support. `gud.el.orig` and `gud.el.rej` are the patch residue; `gud-lldb.patch` is the diff. Treat these as upstream-modified — preserve the patch structure when editing.
- `clang-format.el`, `git-link.el`, `sticky-windows.el`, `mgl-pax.el` — vendored copies of upstream packages, loaded directly.

## Key architectural pieces in init.el

A few non-obvious systems are worth understanding before editing:

**Evil + evil-collection setup.** `(evil-mode 1)` runs at line ~333, immediately followed by `(evil-collection-init)`. For evil-collection to work, `evil-want-keybinding` must be `nil` *before* evil loads — that's why it appears in the `custom-set-variables` block (line 60), not as a `setq` later. Also `evil-want-fine-undo` is `'fine` (smaller undo grains than the default).

**Per-buffer background coloring keyed off evil state** (`my/update-evil-bg-for-selected-window` and friends, ~line 494 onward). The current buffer's background is tinted by evil state — green (`#003000`) for insert, blue (`#000030`) for replace, red (`#300000`) for normal (and anything else). Non-current visible buffers are forced black. `*compilation*` buffers stay black. This is implemented with `face-remap-add-relative` cookies stored in a buffer-local `my/evil-bg-remap-cookies` and runs on `post-command-hook`, evil state entry/exit hooks, and window-selection-change-functions — so it fires constantly. If you touch evil-state handling or face remapping, expect to test interactively — a regression here is highly visible.

**REPL insert-state guard** (`my-repl-*` functions, ~line 367). In `shell-mode` and `sly-mrepl-mode`, evil insert/normal state is auto-toggled based on whether point is at the prompt's input area (`comint-after-pmark-p`). The intent: typing past the prompt naturally enters insert; moving up into output drops to normal. Be careful with hooks here — they run on every `post-command-hook` in those buffers. Also `evil-insert-state-entry-hook` runs `my-move-repl-point-to-end-on-insert`, which jumps to `point-max` when you `i` outside the input area.

**Per-state global bindings via `evil-global-set-key`.** Standard Emacs editing keys (C-a, C-e, C-k, C-d, C-y, C-b, C-f, C-r, M-., M-o, C-x o, C-x p) are bound in **all four** evil states (`insert` / `replace` / `normal` / `visual`) — four `evil-global-set-key` calls per key, around lines 411-490. `M-o` is *also* bound with plain `global-set-key` so it works in buffers where evil is off (e.g. inside the claude-code-ide vterm when it's in emacs-state). `g h/j/k/l` is bound in **motion** state to `windmove-{left,down,up,right}`, and `g c` to `recompile`.

**claude-code-ide window placement and vterm state** (`use-package claude-code-ide`, ~line 195). The user has deliberately opted out of side-windows (`claude-code-ide-use-side-window nil`) so the Claude buffer is resizable. A `display-buffer-alist` entry matches `"\\*claude-code"` and places the buffer at the bottom (height 0.3). Separately, `vterm-mode` is added to `evil-insert-state-modes` so any vterm starts in evil insert state; `C-c v` toggles `vterm-copy-mode` (drops to normal state for scrolling), and `i` or `q` exits copy mode back to insert.

**SLIME** is the Common Lisp environment (`init.el` line 312 onward). It is loaded from `~/Development/slime` with `slime-fancy`. `slime-lisp-mode-hook` is removed from `lisp-mode-hook` so `.lisp` buffers don't auto-enable `slime-mode`; use `M-x slime` to start a session. `slime-lisp-implementations` offers `sbcl` and `cando` (Clasp/Cando build at `~/Development/cando/build/boehmprecise/cando`).

**Custom `package-selected-packages` is `nil`** in init.el (line 63) — this is intentional; do not let Custom write a list back in. The `dot-emacs` file has its own `custom-set-variables` block reflecting an older setup; only the `init.el` block is live.

## Conventions when editing init.el

- The file is sectioned by `;;` comment banners and `;; **`-prefixed headers (org-mode heritage). Match the existing style rather than introducing new section conventions.
- Lots of `(message "...")` breadcrumbs throughout — these are debugging aids the owner uses when startup breaks. Leave existing ones alone; add new ones if you make a change that could plausibly fail at load time.
- For evil-state-specific bindings use `evil-global-set-key '<state>` (the existing files binds the same key in `insert`/`replace`/`normal`/`visual` as four separate calls — follow that pattern unless you genuinely want state-specific behavior). For state-agnostic bindings (or to keep something working in non-evil buffers like vterm) use `global-set-key`.
- `C-x o`, `C-x p`, and `M-o` are remapped to `ace-window` across all four evil states. `aw-dispatch-always` is `t`, so ace-window's dispatch menu fires even when only two windows are visible.
- Cursor shape is set by evil: `chartreuse3 bar` for insert, `white box` for normal (lines ~485). In terminal Emacs, `evil-terminal-cursor-changer` is loaded and activated so the cursor shape change works over a TTY.
- Indentation: `indent-tabs-mode` is `nil` globally; `c-basic-offset` is 4 globally but C/C++ files set the `llvm.org` style (offset 2) via `c-mode-common-hook`.

## Runtime artifacts to ignore

These directories/files are generated and **should not be committed or edited by hand**:
- `elpa/`, `elpaca/`, `eln-cache/` — package installations and native-compiled cache.
- `eshell/`, `transient/`, `tramp`, `auto-save-list/` — per-session state.
- `projectile-bookmarks.eld`, `projects` — projectile state.
- `tree-sitter/` — installed grammars.
- `#*#` and `*~` files — Emacs auto-saves/backups. The `.gitignore` covers `**/*~` and `elpa/` but not all of these; check before staging.

## "Build" / setup commands

There is no test suite or lint step. `makefile` only does two things:

```
make setup   # symlink dot-emacs -> ~/.emacs
make all     # 'make setup' + reclone SLIME into ./slime
```

To pick up config changes in a running Emacs: `M-x eval-buffer` on `init.el`, or restart. There is no byte-compile step in the workflow.

## Git

Main branch is `main`. The owner commits directly; PRs are not used for this repo.
