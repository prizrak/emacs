(custom-set-variables
 '(org-startup-folded nil)
 '(org-log-done t)
 '(org-hide-leading-stars t)
 '(org-agenda-include-diary t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-include-all-todo t)
 '(org-use-property-inheritance t)
; '(org-enforce-todo-dependencies t)
 '(org-special-ctrl-a/e t)
 '(org-special-ctrl-k t)
 '(org-blank-before-new-entry (quote ((heading . auto) (plain-list-item))))
 '(org-agenda-dim-blocked-tasks 'invisible)
 '(org-enforce-todo-checkbox-dependencies t)
 '(diary-file "~/emacs/OrgMode/diary")
 '(mark-diary-entries-in-calendar t)
 '(org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "STARTED(s)" "|" "DONE(d)"
                                     "CANCELED(c)")))
 '(org-agenda-files (directory-files "~/emacs/OrgMode/" t ".*\.org$"))
)

(require 'org-install)
(require 'org)

(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|/TODO\\)$" . org-mode))
(add-to-list 'file-coding-system-alist (cons "\\.\\(org\\|org_archive\\|/TODO\\)$"  'utf-8))

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cb" 'org-iswitchb)

;; remember mode
(org-remember-insinuate)
(setq org-directory "~/projects/OrgMode")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cr" 'org-remember)

;; diary setup
(require 'diary-lib)
(add-hook 'diary-display-hook 'fancy-diary-display)

(setq org-remember-templates
      '(
        ("Todo" ?t "* TODO %?\n  %i\n  %a" (concat org-directory "/TODO.org") "Tasks")
        ))

;; icalendar
(autoload 'icalendar-import-buffer "icalendar" "Import iCalendar data from current buffer" t)

;; 5 minute warning
(setq appt-message-warning-time '60)
(setq appt-display-interval '15)

;; on screen display
(defun org-osd-display (min-to-app new-time msg)
  (osd-display msg msg -1 "center" "center" "Droid Sans Mono 40")
)
