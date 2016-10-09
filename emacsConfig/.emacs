;;(set-language-environment 'UTF-8)

(add-to-list 'load-path "~/.emacs.d/personalLisp")
(add-to-list 'load-path "~/.emacs.d/personalLisp/autoComplete")
(add-to-list 'load-path "~/.emacs.d/personalLisp/haxe")
(add-to-list 'load-path "~/.emacs.d/personalLisp/lua")
(add-to-list 'load-path "~/.emacs.d/personalLisp/multiWeb")
(add-to-list 'load-path "~/.emacs.d/personalLisp/rainbow")
(add-to-list 'load-path "~/.emacs.d/personalLisp/gtags")
(add-to-list 'load-path "~/.emacs.d/personalLisp/googleCStyle")
(add-to-list 'load-path "~/.emacs.d/personalLisp/protobuf")
(add-to-list 'load-path "~/.emacs.d/personalLisp/cmake")
(add-to-list 'load-path "~/.emacs.d/personalLisp/cal_china")

(display-time-mode 1) ; 显示时间
(setq display-time-24hr-format t) ; 24小时格式
(setq display-time-day-and-date t) ; 显示日期

;;(mouse-avoidance-mode 'animate) ; 光标移动到鼠标下时，鼠标自动弹开

(setq frame-title-format "Face2wind@%b") ; 显示当前编辑的文档

;; insert-date
(defun insert-date ()
  "Insert date at point."
  (interactive)
  (insert (format-time-string "%Y年%m月%e日 %l点%M分 %a %p")))

(show-paren-mode) ;;显示匹配的括号

(setq make-backup-files nil); 设定不产生备份文件
(setq auto-save-mode nil);自动保存模式
(setq-default make-backup-files nil); 不生成临时文件
(setq backup-inhibited t);;不产生备份 
(setq auto-save-default nil);不生成名为#filename# 的临时文件 

(setq inhibit-startup-message t)
;;关闭emacs启动时的画面

(setq track-eol t)
;; 当光标在行尾上下移动的时候，始终保持在行尾。

(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                  (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
                  (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
(multi-web-global-mode 1)

(add-to-list 'load-path "~/.emacs.d/plugins/")
(require 'rainbow-mode)
(dolist (hook '(css-mode-hook html-mode-hook sass-mode-hook))
  (add-hook hook 'rainbow-turn-on))

(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(require 'haxe-mode)
(require 'lua-mode)
(require 'auto-complete-config)
(require 'auto-complete-clang)

(global-auto-complete-mode)
(global-linum-mode)
(ido-mode)

(autoload 'gtags-mode "gtags" "" t);gtags-mode is true
(require 'gtags)

;; Add cmake listfile names to the mode list.
(require 'cmake-mode)
(setq auto-mode-alist
      (append
       '(("CMakeLists\\.txt\\'" . cmake-mode))
       '(("\\.cmake\\'" . cmake-mode))
       auto-mode-alist))
;;(autoload 'cmake-mode "cmake-mode.el" t)

(require 'cal-china-x)
(setq mark-holidays-in-calendar t)
(setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
(setq calendar-holidays (append cal-china-x-important-holidays))
(setq calendar-week-start-day 1)            ; 设置星期一为每周的第一天

(load-theme 'wombat t)

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(require 'protobuf-mode)
(setq auto-mode-alist  (cons '(".proto$" . protobuf-mode) auto-mode-alist))

(tool-bar-mode 0)
;;(menu-bar-mode 0)
(scroll-bar-mode 0)

;; shortcut keys ==============================

(global-set-key (kbd "C-l") 'goto-line)
(global-set-key (kbd "C-u") 'undo)

;;(global-set-key (kbd "C-f") 'gtags-find-file)
(global-set-key (kbd "C-f") 'grep-find)

(global-set-key (kbd "C-a") 'mark-whole-buffer)

(global-set-key (kbd "C-x C-g") 'gtags-find-tag)
;;(global-set-key (kbd "C-d") 'gtags-find-with-grep)

(global-set-key (kbd "C-c C-f") 'rgrep)
(global-set-key (kbd "C-c C-a") 'set-mark-command)

(global-set-key (kbd "<f5>") (lambda ()
			       (interactive)
			       (revert-buffer t t t)
			       (message "buffer is reverted")))
;;(global-set-key (kbd "<f5>") 'revert-buffer)
(global-set-key (kbd "<f2>") 'rename-buffer)

