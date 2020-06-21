;; 탭
(require 'centaur-tabs)
(centaur-tabs-mode t)
(centaur-tabs-change-fonts "Avenir Next Condensed" 220)
(centaur-tabs-headline-match)
(setq centaur-tabs-style "bar"
      centaur-tabs-height 32
      centaur-tabs-set-icons t
      centaur-tabs-gray-out-icons 'buffer
      ;; 'under' | 'over' 값은 탭 높이에 따라 표시여부가 달라진다
      centaur-tabs-set-bar 'left
      x-underline-at-descent-line t
      centaur-tabs-set-close-button nil
      centaur-tabs-close-button "x"
      centaur-tabs-set-modified-marker t
      centaur-tabs-modified-marker "*"
      uniquify-separator "/"
      uniquify-buffer-name-style 'forward
      centaur-tabs-cycle-scope 'tabs)

(if (display-graphic-p)
      (progn
            ;; GUI형 Emacs 사용시, 탭으로 이동
            (define-key evil-normal-state-map (kbd "s-{") 'centaur-tabs-backward)
            (define-key evil-normal-state-map (kbd "s-}") 'centaur-tabs-forward))
      (progn
            ;; Terminal Emacs 사용시, 탭으로 이동
            (define-key evil-normal-state-map (kbd "C-c <left>") 'centaur-tabs-backward)
            (define-key evil-normal-state-map (kbd "C-c <right>") 'centaur-tabs-forward)))

