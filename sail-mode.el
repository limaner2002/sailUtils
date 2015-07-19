(defvar sail-mode-hook nil)
(defvar sail-mode-map
  (let ((map (make-keymap)))
    (define-key map "\C-j" 'newline-and-indent)
    map)
  "Keymap for SAIL major mode")

;;(add-to-list 'auto-mode-alist '("\\.sail\\'" . sail-mode))
;;(setq sail-keywords '("local" "cons" "ri" "rf" "rule" "pv" "ac" "a" "fn"))
(setq sail-keywords '([a-z]+!))
(setq sail-functions '("load" "with"))

;;(setq sail-keywords-regexp (regexp-opt sail-keywords 'words))
(setq sail-keywords-regexp 'words)
(setq sail-functions-regexp (regexp-opt sail-functions 'words))

(setq sail-font-lock-keywords
      `(
	(,sail-keywords-regexp . font-lock-keyword-face)
	(,sail-keywords-regexp . font-lock-function-name-face)
	))

;;;###autoload
(define-derived-mode sail-mode fundamental-mode
  "lsl mode"
  "Major mode for editing LSL (Linden Scripting Language)…"

  ;; code for syntax highlighting
  (setq font-lock-defaults '((sail-font-lock-keywords))))

(setq sail-keywords nil)
(setq sail-keywords-regexp nil)
(setq sail-functions nil)
(setq sail-functions-regexp nil)

(provide 'sail-mode)
