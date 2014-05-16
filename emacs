;; (add-to-list 'load-path "~/emacs-package") 
(let ((default-directory "~/emacs-package"))
  (setq load-path
        (append
         (let ((load-path (copy-sequence load-path))) ;; Shadow
           (append 
            (copy-sequence (normal-top-level-add-to-load-path '(".")))
            (normal-top-level-add-subdirs-to-load-path)))
         load-path)))
;; (autoload 'cuda-mode "cuda-mode" "Major mode for editing cuda code." t)
;; (add-to-list 'auto-mode-alist '("\\.cu$" . cuda-mode))
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))
(require 'tramp)
(setq tramp-default-method "ssh")
(setq inhibit-startup-message t)
;;share the clipboard with system so that emacs can communicate with other applications
(setq x-select-enable-clipboard t)
(if (eq system-type 'gnu-linux)(setq interprogram-paste-function 'x-cut-buffer-or-selection-value))
;;(if (eq system-type 'darwin))
(global-linum-mode 1)
;;set up shell mode as bash
(setq shell-file-name "/bin/bash")
;;set up colors of shell mode same as true one
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t) 
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t)
;;let cursor in the end.
(remove-hook 'comint-output-filter-functions 'comint-postoutput-scroll-to-bottom)

;;(require 'xcscope)
;;(setq cscope-do-not-update-database t)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))
;;set darwin font and size
(if (string= system-type "darwin") 
(progn 
(set-default-font "-adobe-courier-bold-o-normal--18-180-75-75-m-110-iso10646-1")))

(if (eq system-type 'gnu-linux)(require 'xcscope))
(if (eq system-type 'gnu-linux)(setq cscope-do-not-update-database t))

;;auto highlight parenthess
;;(require 'highlight-parentheses)
(show-paren-mode 1)
;;(c-set-offset 'substatement-open 0)
;;(setq-default c-basic-offset 4)
(setq c-default-style "linux")

;;Terminal mouse support
(unless window-system
  (xterm-mouse-mode 1)
  (global-set-key [mouse-4] '(lambda ()
                               (interactive)
                               (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda ()
                               (interactive)
                               (scroll-up 1))))
;;xcscope setting
(require 'xcscope)
(cscope-setup)
(define-key global-map [(meta s)] 'cscope-find-this-symbol)
(define-key global-map [(meta u)] 'cscope-pop-mark)

;;window move setting
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
(windmove-default-keybindings 'meta)