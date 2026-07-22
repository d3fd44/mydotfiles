;;; init.el --- WSL Emacs configuration -*- lexical-binding: t; -*-

;; this file was completely written by an LLM, and i have no
;; idea about what the hell is goddamn happening here. what 
;; i may know is that there's "evil mode" (vim mode), some 
;; options for nu/rnu, copy/paste through WSL, tokyonight t-
;; heme, some optimizations for BI-DI text (Arabic) and som-
;; e typst related settings/packages.

;; Package management
(require 'package)

(setq package-archives
      '(("gnu"    . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa"  . "https://melpa.org/packages/")))

(package-initialize)

;; Refresh only when no package archive information exists yet.
(unless package-archive-contents
  (package-refresh-contents))

;; use-package is built into recent Emacs versions, but this keeps
;; the configuration compatible with versions where it is separate.
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

(setq use-package-always-ensure t)


;; UTF-8

(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)


;; General interface
(setq inhibit-startup-screen t
      initial-scratch-message nil
      ring-bell-function #'ignore
      use-dialog-box nil)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode 1)

(column-number-mode 1)
(show-paren-mode 1)
(save-place-mode 1)
(savehist-mode 1)
(global-auto-revert-mode 1)

;; Relative line numbers are convenient with Evil.
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

;; Do not display line numbers in terminal and utility buffers.
(dolist (hook '(term-mode-hook
                shell-mode-hook
                eshell-mode-hook
                help-mode-hook
                compilation-mode-hook))
  (add-hook hook
            (lambda ()
              (display-line-numbers-mode -1))))


;; Fonts
(defconst my-latin-font-family
  "JetBrains Mono"
  "Font used for Latin text, code, and interface elements.")

(defconst my-arabic-font-family
  "IBM Plex Sans Arabic"
  "Font used for Arabic characters.")

;; 120 means approximately 12 pt.
(defconst my-default-font-height 120)

;; IBM Plex Sans Arabic can visually appear slightly smaller than
;; JetBrains Mono, so enlarge it a little.
(setq face-font-rescale-alist
      `((,my-arabic-font-family . 1.12)))


(defun my-apply-fonts (&optional frame)
  "Apply Latin and Arabic fonts to FRAME."

  (let ((frame (or frame (selected-frame))))
    (when (display-graphic-p frame)
      (with-selected-frame frame

        ;; Latin, English, code, and general interface font.
        (if (find-font
             (font-spec :family my-latin-font-family)
             frame)

            (set-face-attribute
             'default
             frame
             :family my-latin-font-family
             :height my-default-font-height)

          (message "Emacs font not found: %s"
                   my-latin-font-family))

        ;; Arabic font.
        (if (find-font
             (font-spec :family my-arabic-font-family)
             frame)

            (set-fontset-font
             nil
             'arabic
             (font-spec :family my-arabic-font-family)
             frame
             'prepend)

          (message "Emacs Arabic font not found: %s"
                   my-arabic-font-family))))))


;; Apply fonts to the current graphical frame.
(my-apply-fonts)

;; Also apply them to frames created by emacsclient or the daemon.
(add-hook 'after-make-frame-functions #'my-apply-fonts)


;; Evil: Vim emulation
(use-package evil
  :init
  ;; C-u scrolls upward, as it does in Vim.
  (setq evil-want-C-u-scroll t)

  ;; Preserve C-i for Emacs rather than treating it as Tab.
  (setq evil-want-C-i-jump nil)

  ;; Use the built-in modern Emacs undo/redo system.
  (setq evil-undo-system 'undo-redo)

  :config
  (evil-mode 1))


;; BiDi and mixed Arabic/English text

(defun my-typst-bidi-setup ()
  "Configure bidirectional text editing for Typst source files."

  ;; Enable Unicode bidirectional display.
  (setq-local bidi-display-reordering t)

  ;; Keep the source-code line anchored on the left.
  ;;
  ;; Arabic text inside the line still renders right-to-left, but
  ;; Typst syntax, indentation, brackets, and punctuation remain
  ;; easier to control. (i changed this so arabic is the domenant)
  (setq-local bidi-paragraph-direction nil) ;; (setq-local bidi-paragraph-direction 'left-to-right)

  ;; Treat every source line as a separate BiDi paragraph.
  ;; This prevents one Arabic line from changing the direction of
  ;; surrounding Typst source lines.
  (setq-local bidi-paragraph-start-re "^")
  (setq-local bidi-paragraph-separate-re "^")

  ;; Wrap long prose visually without changing the actual file.
  (visual-line-mode 1))


(defun my-arabic-prose-bidi-setup ()
  "Use automatic paragraph direction in prose-oriented files."

  (setq-local bidi-display-reordering t)

  ;; nil makes Emacs detect the base direction from the text.
  (setq-local bidi-paragraph-direction nil)

  (visual-line-mode 1))


;; Automatic direction is more natural in ordinary text files.
(add-hook 'text-mode-hook #'my-arabic-prose-bidi-setup)

;; Typst Tree-sitter grammar
(with-eval-after-load 'treesit
  (add-to-list
   'treesit-language-source-alist
   '(typst "https://github.com/uben0/tree-sitter-typst")))


;; Tinymist / Eglot
(with-eval-after-load 'eglot
  (add-to-list
   'eglot-server-programs
   '((typst-ts-mode) . ("tinymist"))))


(defun my-typst-start-eglot ()
  "Start Tinymist through Eglot when it is available."

  (when (executable-find "tinymist")
    (require 'eglot)
    (eglot-ensure)))


;; Typst mode
(use-package typst-ts-mode
  :mode "\\.typ\\'"

  :hook
  ((typst-ts-mode . my-typst-bidi-setup)
   (typst-ts-mode . my-typst-start-eglot)))


;; Useful editing defaults
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Highlight the current line in programming buffers.
(add-hook 'prog-mode-hook #'hl-line-mode)

;; Delete selected text when typing.
(delete-selection-mode 1)

;; Remember recently opened files.
(recentf-mode 1)

;; Matching parentheses.
(setq show-paren-delay 0)
(setq show-paren-style 'parenthesis)


;; Custom settings written by Emacs
(setq custom-file
      (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
  (load custom-file))


;; Theme
(use-package tokyo-night
  :ensure t
  :config
  (load-theme 'tokyo-night t))

;;; init.el ends here
