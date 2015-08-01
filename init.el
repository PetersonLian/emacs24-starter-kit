;;; init.el --- Where all the magic begins
;;
;; Part of the Emacs Starter Kit
;;
;; This is the first thing to get loaded.
;;

;;;Packages
;;;automatically download package if not exist
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(
   multi-web-mode
   yafolding
   yasnippet
   ace-jump-mode
   key-chord
   expand-region
   php-mode
   auto-complete
   window-number
   smex
   less-css-mode
   ac-html
  ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;don't know why 'window-number didn't work
;;I(ablian AKA Peterson Lian) have to manually add the package's path to 'load-path
;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/elpa/window-number-20140124.302"))

;; load the starter kit from the `after-init-hook' so all packages are loaded
(add-to-list 'load-path "/home/ablian/.emacs.d")

(add-hook 'after-init-hook
 `(lambda ()
    ;; remember this directory
    (setq starter-kit-dir
          ,(file-name-directory (or load-file-name (buffer-file-name))))
    ;; only load org-mode later if we didn't load it just now
    ,(unless (and (getenv "ORG_HOME")
                  (file-directory-p (expand-file-name "lisp"
                                                      (getenv "ORG_HOME"))))
       '(require 'org))
    ;; load up the starter kit
    (org-babel-load-file (expand-file-name "starter-kit.org" starter-kit-dir))
    (org-babel-load-file (expand-file-name "starter-kit-org.org" starter-kit-dir))
    
    ;;yafolding.el
    ;;yet another folding
    ;;'prog-mode-hook is introduced in version 24.1
    (add-hook 'prog-mode-hook (lambda()(yafolding-mode 1)))
    
    ;;prog-mode-hook is introduced in version 24.1
    ;;全局关闭flyspell-mode 和 auto-fill-mode
    ;;Didn't work
    ;; (add-hook 'prog-mode-hook (lambda() 
    ;;                             (progn 
    ;;                               (flyspell-mode 0)
    ;;                               (auto-complete-mode 1)
    ;;                               (auto-fill-mode 0)
    ;;                               (toggle-truncate-lines)
    ;;                               )
    ;;                             ))

    (flyspell-mode 0)
    (auto-complete-mode 1)
    (auto-fill-mode 0)
    (toggle-truncate-lines)
    
    (put 'narrow-to-region 'disabled nil)

    ;; the --si option displays file size in metric prifex of k (1000), m (1000k), etc.
    ;; the --time-style long-iso option displays date in the format “yyyy-mm-dd”.
    (setq dired-listing-switches "-Al --si --time-style long-iso")
    ;; allow dired to be able to delete or copy a whole dir.
    (setq dired-recursive-copies (quote always)) ; “always” means no asking
    (setq dired-recursive-deletes (quote top)) ; “top” means ask once
    ;; copy(rename||move) from one dired dir to the next dired dir shown in a split window
    ;; how to use?
    ;; Now, go to dired, then call split-window-vertically, then go to another dired dir. Now, when you press C to copy, the other dir in the split pane will be default destination. Same for R (rename; move).
    (setq dired-dwim-target t)

    ;;globally set up key-chord-mode
    (key-chord-mode 1)
    ))

;;added by ablian(PetersonLian)

;;; init.el ends here

;;; following is the key-macro saving by function 'save-marco
(fset 'stackoverflow
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("!
fb" 0 "%d")) arg)))


(fset 'yafolding-js-toggle-function
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("function(: function(

" 0 "%d")) arg)))


(fset 'wechatFaq
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([return 97 114 114 97 121 40 return 39 113 117 122 67 105 100 5 32 61 62 32 21 134217786 120 return 44 134217786 40 115 101 116 113 32 120 32 40 43 32 120 32 49 5 return return 39 113 117 122 84 105 116 108 101 5 32 61 62 32 39 24 111 134217848 return 65289 36 return 134217837 6 6 67108896 19 65288 2 23 24 111 25 6 44 return 39 113 117 122 65 110 115 119 101 114 5 32 61 62 32 39 24 111 134217848 return 65289 36 return 14 1 67108896 134217848 105 return 65289 36 return 16 5 23 24 111 25 6 44 return 39 113 117 122 70 105 108 116 101 114 5 32 61 62 32 97 backspace 39 24 111 16 134217848 return 65289 36 return 2 2 6 6 2 6 67108896 18 65288 return 23 24 111 25 5 14 44] 0 "%d")) arg)))


(fset '）$
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([return 97 114 114 97 121 40 return 39 113 117 122 67 105 100 5 32 61 62 32 21 134217786 120 return 44 134217786 40 115 101 116 113 32 120 32 40 43 32 120 32 49 5 return return 39 113 117 122 84 105 116 108 101 5 32 61 62 32 39 24 111 134217848 return 65289 36 return 134217837 6 6 67108896 19 65288 2 23 24 111 25 6 44 return 39 113 117 122 65 110 115 119 101 114 5 32 61 62 32 39 24 111 134217848 return 65289 36 return 14 1 67108896 134217848 105 return 65289 36 return 16 5 23 24 111 25 6 44 return 39 113 117 122 70 105 108 116 101 114 5 32 61 62 32 97 backspace 39 24 111 16 134217848 return 65289 36 return 2 2 6 6 2 6 67108896 18 65288 return 23 24 111 25 5 14 44] 0 "%d")) arg)))


(fset '）$
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([return 97 114 114 97 121 40 return 39 113 117 122 67 105 100 5 32 61 62 32 21 134217786 120 return 44 134217786 40 115 101 116 113 32 120 32 40 43 32 120 32 49 5 return return 39 113 117 122 84 105 116 108 101 5 32 61 62 32 39 24 111 134217848 return 65289 36 return 134217837 6 6 67108896 19 65288 2 23 24 111 25 6 44 return 39 113 117 122 65 110 115 119 101 114 5 32 61 62 32 39 24 111 134217848 return 65289 36 return 14 1 67108896 134217848 105 return 65289 36 return 16 5 23 24 111 25 6 44 return 39 113 117 122 70 105 108 116 101 114 5 32 61 62 32 97 backspace 39 24 111 16 134217848 return 65289 36 return 2 2 6 6 2 6 67108896 18 65288 return 23 24 111 25 5 14 44] 0 "%d")) arg)))


(fset 'wechatFaqFilter
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([19 113 117 122 102 105 108 116 101 114 return 5 2 134217826 67108896 5 2 134217848 102 return 23 25 24 111 19 113 117 122 70 105 108 116 101 114 return 6 6 6 6 6 67108896 134217848 102 return backspace 25 14 24 111] 0 "%d")) arg)))


(fset 'wechatFaq-useThis
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([1 6 6 6 2 2 2 134217830 6 67108896 19 40 return 2 23 24 111 97 114 114 97 121 40 return 39 113 117 122 67 105 100 6 32 61 62 32 21 134217786 120 return backspace backspace 134217786 40 115 101 116 113 32 120 32 40 43 32 120 32 49 return 21 134217786 120 return 44 return 39 113 117 122 84 105 116 108 101 5 32 61 62 32 39 25 6 44 return 39 113 117 122 65 110 115 119 101 114 5 32 61 62 32 39 5 44 2 2 24 111 23 67108896 134217848 105 return 41 36 return 16 5 23 24 111 25 6 6 return 39 113 117 122 70 105 108 116 101 114 5 32 61 62 32 97 114 114 97 121 40 return 14 14 44 24 111 11] 0 "%d")) arg)))


(fset 'dati-ziku
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([return 60 100 105 118 32 99 108 97 115 115 61 34 113 117 122 101 45 98 111 97 114 100 6 32 115 116 121 108 101 61 34 100 105 115 112 108 97 121 58 110 111 110 101 5 3 47 134217848 98 return return 60 100 105 118 32 99 108 97 115 115 61 34 109 117 108 116 105 45 108 105 110 101 115 32 116 105 116 108 101 5 3 47 134217848 98 return return 60 115 112 97 110 6 3 47 134217848 98 return 24 111 19 116 105 116 108 101 return 6 6 6 67108896 2 134217848 102 return 2 134217848 107 105 return 24 111 6 2 25 5 return 60 115 112 97 110 32 99 108 97 115 115 61 34 109 117 108 116 105 45 108 105 110 101 115 45 97 110 99 104 111 114 5 3 47 return 1 backspace 14 2 3 2 3 6 5 return 60 100 105 118 32 99 108 97 115 115 61 34 109 117 108 116 105 45 108 105 110 101 115 32 99 104 111 105 99 101 45 97 110 115 119 101 114 32 97 6 6 60 115 112 97 110 6 24 111 19 97 58 return 6 6 67108896 2 134217848 102 return 2 134217848 107 105 return 24 111 25 60 47 115 112 97 110 6 60 115 112 97 110 32 99 108 97 115 115 61 34 109 117 108 116 105 45 108 105 110 101 115 45 97 110 99 104 111 114 6 6 38 101 110 115 112 59 60 47 115 112 97 110 6 60 47 100 105 118 6 return 60 100 105 118 32 99 108 97 115 115 61 34 109 117 108 116 105 45 108 105 110 101 115 32 99 104 111 105 99 101 45 97 110 115 119 101 114 32 98 6 6 60 115 112 97 110 6 24 111 19 98 58 return 6 6 67108896 2 134217848 102 return 2 134217848 107 105 return 24 111 25 60 47 115 112 97 110 5 60 115 112 97 110 32 99 108 97 115 115 61 34 109 117 108 116 105 45 108 105 110 101 115 45 97 110 99 104 111 114 6 6 38 101 110 112 115 59 60 47 115 112 97 110 5 60 47 100 105 118 5 return 60 100 105 118 32 99 108 97 115 115 61 34 109 117 108 116 105 45 108 105 110 101 115 32 99 104 111 105 99 101 45 97 110 115 119 101 114 32 99 5 60 47 115 backspace backspace 115 112 97 110 6 24 111 19 99 58 return 6 6 67108896 2 134217848 102 return 2 134217848 107 105 return 24 111 25 60 47 115 112 97 110 6 60 115 112 97 110 32 99 108 97 115 115 61 34 109 117 108 116 105 45 108 105 110 101 115 45 97 110 99 104 111 114 5 38 101 110 115 112 59 18 101 110 112 115 return 134217828 101 110 115 112 19 101 110 115 112 5 60 47 115 112 97 110 5 60 47 100 105 118 5 return 60 100 105 118 32 99 108 97 115 115 61 34 109 117 108 116 105 45 108 105 110 101 115 32 99 104 111 117 backspace backspace 111 105 99 101 45 97 110 115 119 101 114 32 100 5 60 115 112 97 110 5 24 111 19 100 58 return 6 6 67108896 2 134217848 102 return 2 134217848 107 105 return 24 111 25 60 47 115 112 97 110 5 60 115 112 97 110 32 99 108 97 115 115 61 34 109 117 108 116 105 45 108 105 110 101 115 45 97 110 99 104 111 114 5 38 101 110 112 115 59 60 47 115 112 97 110 5 60 47 100 105 118 5 14 16 14 2 3 2 3 6 16 14 5 24 111 19 116 105 116 108 return 1 24 111] 0 "%d")) arg)))

