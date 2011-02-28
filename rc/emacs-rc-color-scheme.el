 (add-to-list 'load-path "/opt/local/share/emacs/site-lisp/color-theme-6.6.0")
(require 'color-theme)
(eval-after-load "color-theme"
 	'(progn
 		(color-theme-initialize)
 		(color-theme-robin-hood)
	)
)

(let ((spec '((t (:family "Monaco" :height 200)))))
        (mapc (lambda (face)
            (face-spec-set face spec)
            (put face 'face-defface-spec spec))
            '(default menu)))
