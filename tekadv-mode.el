(setq tekadv-highlights
      '(("#.*" . font-lock-comment-face)
	("\t[_a-z]*:" . font-lock-variable-name-face)
        ("[_a-z]*:" . font-lock-type-face)))

(define-derived-mode tekadv-mode fundamental-mode "tekadv"
  "major mode for editing tekadv language code."
  (setq font-lock-defaults '(tekadv-highlights)))
