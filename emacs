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

(if (eq system-type 'gnu-linux)(require 'xcscope))
(if (eq system-type 'gnu-linux)(setq cscope-do-not-update-database t))

;;auto highlight parenthess
;;(require 'highlight-parentheses)
(show-paren-mode 1)
