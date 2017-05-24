(defface tekadv-mode-comment
  '((((min-colors 8)) :foreground "brightblack"))
  "Face for comment in tekadv-mode")

(defface tekadv-mode-title
  '((((min-colors 8)) :foreground "brightgreen"))
  "Face for title in tekadv-mode")

(defface tekadv-mode-subtitle
  '((((min-colors 8)) :foreground "brightyellow"))
  "Face for subtitle in tekadv-mode")

(defface tekadv-mode-define
  '((((min-colors 8)) :foreground "brightblue"))
  "Face for define in tekadv-mode")

(defface tekadv-mode-macro
  '((((min-colors 8)) :foreground "cyan"))
  "Face for macro in tekadv-mode")

(defface tekadv-mode-id
  '((((min-colors 8)) :foreground "green"))
  "Face for id in tekadv-mode")

(defface tekadv-mode-default
  '((((min-colors 8)) :foreground "white"))
  "Face for default in tekadv-mode")

(setq tekadv-keyword
      '(("" ("^#define[ \t]+" (beginning-of-line) nil (0 'tekadv-mode-define)))
	("" ("#.*" (beginning-of-line) nil (0 'tekadv-mode-comment)))
	("^[\t ]+" ("[_a-z0-9]+:" (beginning-of-line) nil (0 'tekadv-mode-subtitle)))
	("^[_a-z]+:" ("[0-9]+[ \t]*$" (beginning-of-line) nil (0 'tekadv-mode-id)))
	("" ("[_a-z]*:" (beginning-of-line) nil (0 'tekadv-mode-title)))))

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
  (setq font-lock-defaults '(tekadv-keyword)))
