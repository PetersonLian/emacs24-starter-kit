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
    (add-hook 'prog-mode-hook (lambda() 
                                (progn 
                                  (flyspell-mode 0)
                                  (auto-complete-mode 1)
                                  (auto-fill-mode 0)
                                  (toggle-truncate-lines)
                                  )
                                ))
    ))

;;added by ablian(PetersonLian)

(put 'narrow-to-region 'disabled nil)


;;; init.el ends here
