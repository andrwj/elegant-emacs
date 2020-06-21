(require 'evil)
(evil-mode 1)

(require 'which-key)
(setq which-key-show-early-on-C-h t) ;; Allow C-h to trigger which-key before it is done automatically
(setq which-key-idle-delay 0.3) ;; make sure which-key doesn't show normally but refreshes quickly after it is triggered.
(setq which-key-idle-secondary-delay 0.2)
(which-key-mode)

(require 'aggressive-indent)
(add-to-list
 'aggressive-indent-dont-indent-if
 '(and (derived-mode-p 'web-mode)
       (null (string-match "\\([;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
                           (thing-at-point 'line)))))
(aggressive-indent-mode 1)


(defun andrwj/setup-indent-env (n)
  (interactive)
  (setq-default c-basic-offset n) ; java/c/c++
  (setq-default javascript-indent-level n) ; javascript-mode
  (setq-default js-indent-level n) ; js-mode
  (setq-default js2-basiceoffset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq-default web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq-default web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq-default web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq-default css-indent-offset n) ; css-mode
  (setq-default typescript-indent-level n) ; TypeScript
  (message (format "Set indenation to %d spaces" n))
  )
(andrwj/setup-indent-env 3)

;; 라인번호 표시
(setq display-line-numbers-type t)
