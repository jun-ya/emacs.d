;; 基本的なタブは4にする、インデントはハードタブ
(setq-default tab-width 4 indent-tabs-mode t)

;; dired利用時、ディレクトリを先頭に並べる
(setq ls-lisp-dirs-first t)

;; 最終変更日の自動挿入
;; ファイルの先頭から8行以内に Revised: <Thu Apr 02 10:17:35 2015 junya> または
;; Revised: " " と書いてあれば、セーブ時に自動的に日付が挿入される
(require 'time-stamp)
(add-hook 'write-file-hooks 'time-stamp)
(setq time-stamp-active t)
(setq time-stamp-start "Revised: <")
(setq time-stamp-format "%3a %3b %02d %02H:%02M:%02S %:y %u")
(setq time-stamp-end ">")
(setq time-stamp-line-limit 12) ;; 変ていいのかな? time-stamp.elには変えるなと書いてある

;; mode lineに時間表示
(setq display-time-24hr-format t)
(setq display-time-string-forms '(month "/" day " " 24-hours ":" minutes))
(display-time)

;; 行末の^Mを削除
(add-hook 'comint-output-filter-functions 'shell-strip-ctrl-m nil t)

;; 行頭にあるときC-kの挙動を１行+LFをkillさせる設定
(setq kill-whole-line t)

;; 文字補完機能を有効にする
;; M-nでexpand-abbrevを行う
(let ((file "~/.abbrev_defs"))
  (if (file-exists-p file)
      (quietly-read-abbrev-file file))) ; 定義ファイルの読込み

;; MacFusionを使ったときに表示される、
;; Listing directory failed but access-file worked エラーの解消
(when (eq system-type 'darwin)
  (require 'ls-lisp)
  (setq ls-lisp-use-insert-directory-program nil));;

(add-hook 'dired-load-hook (lambda () (load "dired-x")))