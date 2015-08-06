
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

;; cask
(message ">> Initializing Cask")
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; pallet
(message ">> Initializing Pallet")
(require 'pallet)
(pallet-mode t)

;; initialize custom stuffs
(message ">> Adding custom load path..")
(add-to-list 'load-path "~/.emacs.d/custom/")
(let ((default-directory "~/.emacs.d/custom/"))
  (normal-top-level-add-subdirs-to-load-path))

;; Load ruby
(message ">> Loading ruby.. ")
(load "ruby.el")

;; load ag (silver searcher)
(message ">> Initializing The Silver Searcher")
(load "ag.el")
(require 'ag)

;; Load php
(load "php.el")
(add-to-list 'auto-mode-alist
	     '("\\.php[34]?\\'\\|\\.phtml\\'" . php-mode))

;; Hide Scroll bar
(message ">> Hiding scroll bar")
(scroll-bar-mode -1)
;;(set-specifier horizontal-scrollbar-visible-p nil)
;;(set-specifier vertical-scrollbar-visible-p nil)

;; Load Solarized color
(message ">> Loading color theme...")
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/custom/emacs-color-theme-solarized/")

;;(load "emacs-color-theme-solarized/solarized-definitions.el")
;;(load "emacs-color-theme-solarized/solarized-theme.el")
;;(package-initialize)

;;(load-theme 'solarized t)
;;(set-frame-parameter nil 'background-mode 'dark)
;;(set-terminal-parameter nil 'background-mode 'dark)
;;(enable-theme 'solarized)

;; make the fringe stand out from the background
;;(setq solarized-distinct-fringe-background t)

;; Don't change the font for some headings and titles
;;(setq solarized-use-variable-pitch nil)

;; make the modeline high contrast
;;(setq solarized-high-contrast-mode-line t)

;; Use less bolding
;;(setq solarized-use-less-bold t)

;; Use more italics
;;(setq solarized-use-more-italic t)

;; Use less colors for indicators such as git:gutter, flycheck and similar
;;(setq solarized-emphasize-indicators nil)

;; Don't change size of org-mode headlines (but keep other size-changes)
;;(setq solarized-scale-org-headlines nil)

;; Avoid all font-size changes
;;(setq solarized-height-minus-1 1)
;;(setq solarized-height-plus-1 1)
;;(setq solarized-height-plus-2 1)
;;(setq solarized-height-plus-3 1)
;;(setq solarized-height-plus-4 1)

;; Tango Tango color theme
(require 'color-theme)
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/custom/color-theme-tangotango.el")
(setq color-theme-load-all-themes nil)

(require 'color-theme-tangotango)

;; select theme - first list element is for windowing system, second is for console/terminal
;; Source : http://www.emacswiki.org/emacs/ColorTheme#toc9
(setq color-theme-choices 
      '(color-theme-tangotango color-theme-tangotango))

;; default-start
(funcall (lambda (cols)
    	   (let ((color-theme-is-global nil))
    	     (eval 
    	      (append '(if (window-system))
    		      (mapcar (lambda (x) (cons x nil)) 
    			      cols)))))
    	 color-theme-choices)

;; test for each additional frame or console
(require 'cl)
(fset 'test-win-sys 
      (funcall (lambda (cols)
    		 (lexical-let ((cols cols))
    		   (lambda (frame)
    		     (let ((color-theme-is-global nil))
		       ;; must be current for local ctheme
		       (select-frame frame)
		       ;; test winsystem
		       (eval 
			(append '(if (window-system frame)) 
				(mapcar (lambda (x) (cons x nil)) 
					cols)))))))
    	       color-theme-choices ))
;; hook on after-make-frame-functions
(add-hook 'after-make-frame-functions 'test-win-sys)

(color-theme-tangotango)

;; Flyspell
(require 'flyspell)
(setq flyspell-issue-message-flg nil)
(add-hook 'enh-ruby-mode-hook
          (lambda () (flyspell-prog-mode)))

(add-hook 'web-mode-hook
          (lambda () (flyspell-prog-mode)))
;; flyspell mode breaks auto-complete mode without this.
(ac-flyspell-workaround)

;; Textmate
(add-to-list 'load-path "~/.emacs.d/custom/textmate.el")
(require 'textmate)
(textmate-mode)




