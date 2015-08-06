;; turn off bell
(message ">> Turning anoying bell off")
(setq visible-bell t)

;; Cursor
(message ">> Blink cursor")
(blink-cursor-mode)

;; dont show start up
(message ">> Hiding start up message")
(setq inhibit-startup-message t)

;; turn off toolbar
(message ">> Disabling toolbar")
(tool-bar-mode -1)
