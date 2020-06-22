;; (setq gc-cons-threshold most-positive-fixnum)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))

(require 'evil)
(evil-mode 1)

   ;; 커서 색상
   (if (display-graphic-p)
      (setq evil-default-cursor (quote (t "#750000"))
         evil-visual-state-cursor '("#880000" box)
         evil-normal-state-cursor '("#750000" box)
         evil-insert-state-cursor '("#e2e222" bar)))


   ;; In normal state
   (define-key evil-normal-state-map (kbd "C-c <up>") 'evil-window-up)
   (define-key evil-normal-state-map (kbd "C-c <down>") 'evil-window-down)
   (define-key evil-normal-state-map (kbd "C-c <left>") 'evil-window-left)
   (define-key evil-normal-state-map (kbd "C-c <right>") 'evil-window-right)

   ;; In terminal
   (evil-define-key 'insert term-raw-map (kbd "C-c <up>") 'evil-window-up)
   (evil-define-key 'insert term-raw-map (kbd "C-c <right>") 'evil-window-right)
   (evil-define-key 'insert term-raw-map (kbd "C-c <left>") 'evil-window-left)


;; Which-Key 메뉴
(require 'which-key)
   (setq which-key-show-early-on-C-h t) ;; Allow C-h to trigger which-key before it is done automatically
   (setq which-key-idle-delay 0.3) ;; make sure which-key doesn't show normally but refreshes quickly after it is triggered.
   (setq which-key-idle-secondary-delay 0.2)
   (setq which-key-sort-order #'which-key-prefix-then-key-order
         which-key-sort-uppercase-first t
         which-key-add-column-padding 1
         which-key-max-display-columns nil)

   (set-face-attribute 'which-key-local-map-description-face nil :weight 'bold)
   (which-key-setup-side-window-bottom)
   ; (setq-hook! 'which-key-init-buffer-hook line-spacing 3)
   ; (which-key-add-key-based-replacements "SPC" "<leader>")
   ; (which-key-add-key-based-replacements "SPC m" "<localleader>")
   (which-key-mode)

(require 'general)

;; (general-define-key
;;    :states '(normal motion insert emacs)
;;    :prefix "SPC"
;;    "ar" '(ranger :which-key "call ranger")
;;    "g"  '(:ignore t :which-key "Git")
;;    "gs" '(magit-status :which-key "git status"))


;; 어그레시브 인덴트!!
(require 'aggressive-indent)
(add-to-list
 'aggressive-indent-dont-indent-if
 '(and (derived-mode-p 'web-mode)
       (null (string-match "\\([;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
                           (thing-at-point 'line)))))
(aggressive-indent-mode 1)

;; 들여쓰기 공백 3칸
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
(global-display-line-numbers-mode)

;; ranger
(require 'ranger)
(ranger-override-dired-mode t)
(setq ranger-show-hidden t) ;;show dot files
(setq ranger-dont-show-binary t) ;; don't show binary
(setq helm-descbinds-window-style 'same-window) ;; helm-descbinds 패키지와 같이 씀에 따라 생기는 문제 해결
(setq ranger-hide-cursor nil)
(setq ranger-width-parents 0.2)
(setq ranger-width-preview 0.55)
(setq ranger-excluded-extensions '("mkv" "iso" "mp4" "DS_Store" "zip" "tgz" "tar" "gz"))

;; 한국어 입력 설정 & 파일 인코딩
(set-language-environment "Korean")
(prefer-coding-system 'utf-8)

;; Make whitespace-mode with very basic background coloring for whitespaces.
;; http://ergoemacs.org/emacs/whitespace-mode.html
;; (global-whitespace-mode)
(setq whitespace-style (quote (face spaces tabs newline space-mark tab-mark newline-mark )))
;; Make whitespace-mode and whitespace-newline-mode use “¶” for end of line char and “▷” for tab.
(setq whitespace-display-mappings
    ;; all numbers are unicode codepoint in decimal. e.g. (insert-char 182 1)
    '((space-mark 32 [183] [46]) ; SPACE 32 「 」, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
      (newline-mark 10 [182 10]) ; LINE FEED,
      (tab-mark 9 [9655 9] [92 9]))) ; tab


(require 'fzf)

(require 'rg)
;; (rg-enable-default-bindings)
(rg-enable-menu)


(require 'js2-mode)
(custom-set-faces
  '(js2-object-property ((t (:inherit font-lock-variable-name-face)))))
(add-to-list 'auto-mode-alist '("\\.mjs\\'" . js2-mode))


(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(require 'magit)

(require 'flycheck)
(global-flycheck-mode)
(setq flycheck-javascript-eslint-executable "eslint_d")

;;(require 'lsp-mode)
;;(setq lsp-enable-symbol-highlighting t)


;; (require 'treemacs)

(require 'vimrc-mode)
(add-to-list 'auto-mode-alist '("\\.vim\\(rc\\)?\\'" . vimrc-mode))


(require 'evil-multiedit)

