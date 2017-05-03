(setq tekadv-highlights
      '(("#.*" . font-lock-comment-face)
	("\t[_a-z]*:" . font-lock-variable-name-face)
        ("[_a-z]*:" . font-lock-type-face)))

(define-derived-mode tekadv-mode fundamental-mode "tekadv"
  "major mode for editing tekadv language code."
  (global-set-key (kbd "C-<down>") 'tekadv-mode-move-next)
  (global-set-key (kbd "C-<up>") 'tekadv-mode-move-prev)

  (defun tekadv-mode-move-next ()
    (interactive)
    (re-search-forward "^[_a-zA-Z0-9\.\/]*:"))
  (defun tekadv-mode-move-prev ()
    (interactive)
    (search-backward-regexp "^[_a-zA-Z0-9\.\/]*:"))
  (setq font-lock-defaults '(tekadv-highlights)))
