(require 'tramp)
(setq tramp-default-method "ssh")
(setq inhibit-startup-message t)
;;share the clipboard with system so that emacs can communicate with other applications
(setq x-select-enable-clipboard t)
(if (eq system-type 'gnu-linux)(setq interprogram-paste-function 'x-cut-buffer-or-selection-value))
;;(if (eq system-type 'darwin))
(global-linum-mode 1)
