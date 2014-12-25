;;; init.el --- Where all the magic begins
;;
;; Part of the Emacs Starter Kit
;;
;; This is the first thing to get loaded.
;;

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
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("! fb" 0 "%d")) arg)))


(fset 'yafolding-js-toggle-function
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("function(: function(" 0 "%d")) arg)))

