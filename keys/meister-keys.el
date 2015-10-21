(provide 'meister-keys)

;;;;;;
;; Extra keybindings
(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")
(defmacro define-my-key (kbd func)
  `(define-key my-keys-minor-mode-map (kbd ,kbd) ,func))

(message "defining keys")
(define-my-key "C-f"         'evil-scroll-page-down)
(define-my-key "C-b"         'evil-scroll-page-up)

;; Activate my-keys possibly everywhere
(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " My-Keys" 'my-keys-minor-mode-map)

(message "turning on minor mode")
(my-keys-minor-mode 1)
(defun my-minibuffer-setup-hook () (my-keys-minor-mode 0))
(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

(defadvice load (after give-my-keybindings-priority)
  "Try to ensure that my keybindings always have priority."
  (if (not (eq (car (car minor-mode-map-alist)) 'my-keys-minor-mode))
      (let ((mykeys (assq 'my-keys-minor-mode minor-mode-map-alist)))
        (assq-delete-all 'my-keys-minor-mode minor-mode-map-alist)
        (add-to-list 'minor-mode-map-alist mykeys))))

(message "ad-activate")
(ad-activate 'load)
