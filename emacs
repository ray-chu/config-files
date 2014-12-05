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
  ;; (defun toggle-xterm-mouse-mode()
  ;;   "Toggle mouse usage in terminal. If enabled, mouse can not use host xterm copy function."
  ;;   (interactive)
  ;;   (if (null xterm-mouse-mode)
  ;; 	(setq xterm-mouse-mode 1)
  ;;     (setq xterm-mouse-mode nil)
  ;; 	)
  ;;   )
  ;; (global-set-key [(meta m)] 'toggle-xterm-mouse-mode)
  ;;When turned on, the normal xterm mouse functionality for such clicks is still available by holding down the SHIFT key while pressing the mouse button.
  (xterm-mouse-mode 1)
  (global-set-key [mouse-4] '(lambda ()
                               (interactive)
                               (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda ()
                               (interactive)
                               (scroll-up 1))))
;;xcscope setting
;;(hs-minor-mode 1)
(if (eq system-type 'gnu-linux)
    (progn
      ;;(require 'xcscope)
      (cscope-setup)
      (define-prefix-command 'xcscope-map)
      (global-set-key [(meta c)] 'xcscope-map)
      (define-key xcscope-map (kbd "s") 'cscope-find-this-symbol)
      (define-key xcscope-map (kbd "p") 'cscope-pop-mark)
      (define-key xcscope-map (kbd "n") 'cscope-history-forward-file-current-result)
      (define-key xcscope-map (kbd "d") 'cscope-find-global-definition)
      (define-key xcscope-map (kbd "c") 'cscope-find-functions-calling-this-function)
      (define-key xcscope-map (kbd "h") 'hs-toggle-hiding)      
      )
  )

;; So meta-C is capitalize word, but meta-c occupied by cscope


;;window move setting
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
(windmove-default-keybindings 'meta)

;;open files with read-only mode
;;(view-mode 1)

;;ctags setup
(eval-after-load 'etags
  '(progn
     (defun xz-etags-apropos-symbol ()
       (interactive)
       (setq tag-name (thing-at-point 'symbol))
     ;;  (interactive (find-tag-interactive "Locate tag: "))
       (tags-apropos (concat "\\_<" tag-name "\\_>")))))


(define-key global-map [(meta l)] 'xz-etags-apropos-symbol)

;; Tuareg Mode for Object caml
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
;;(autoload 'tuareg-imenu-set-imenu "tuareg-imenu" 
;;  "Configuration of imenu for tuareg" t)

;;(add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu)

(setq auto-mode-alist 
      (append '(("\\.ml[ily]?$" . tuareg-mode)
		("\\.topml$" . tuareg-mode))
	      auto-mode-alist))

;;show column number
(setq column-number-mode t)

;;cedet settings
;;cedet is big and slow. If unecessary, no need to use it. So I define a start function and unload function to control it
(defun start-cedet ()
  "start cedet IDE mode"
  (interactive)
  (load-file "~/emacs-package/cedet/cedet-1.1/common/cedet.el")
  (semantic-load-enable-code-helpers))

;; (define-key global-map [(ctrl i)]  nil)
;; (define-prefix-command 'cedet-map)
;; (global-set-key [(ctrl i)] 'cedet-map)
;; (define-key cedet-map [(s)] 'start-cedet)

;;allow no-window clip using system clip
;;(require 'xclip)
;;(xclip-mode 1)
