;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type `relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/GitHub/DigitalNotebook/org/")
(setq org-agenda-files '("~/GitHub/DigitalNotebook/org/MetaMorphTODO.org" "~/GitHub/DigitalNotebook/org/VLA_TODO.org" "~/GitHub/DigitalNotebook/org/GeneralTodo.org"))
;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;; Define a list of directories to be scanned for Org files
(after! org-preview-html
  ;; This command opens the HTML preview in a side window.
  (map! :leader
        :prefix "o"
        :desc "Toggle live HTML preview"
        "h" #'org-preview-html-mode)
  )

;; Cross-platform PDF viewer setup for LaTeX
(after! tex
  ;; Enable SyncTeX (forward/backward search)
  (setq TeX-source-correlate-mode t
        TeX-source-correlate-start-server t)

  ;; Select PDF viewer based on OS
  (cond
   ((eq system-type 'darwin) ;; macOS
    (setq TeX-view-program-selection '((output-pdf "Skim")))
    (setq TeX-view-program-list
          '(("Skim" "open -a Skim.app %o"))))

   ((eq system-type 'gnu/linux) ;; Linux
    (setq TeX-view-program-selection '((output-pdf "Zathura")))
    (setq TeX-view-program-list
          '(("Zathura" "zathura %o"))))))
;;; Berserk-ish tweaks – alpha-safe version ----------------------------
;; 1. still use the dark-red theme
(setq doom-theme 'doom-horizon)

(after! doom-themes
  (solaire-global-mode +1)

  ;; 2. *opaque* colours only – Emacs is happy
  (custom-set-faces!
    `(default :background "#0c0b0d" :foreground "#e0d9d1")
    `(font-lock-comment-face :foreground "#8b7d6b" :italic t)
    `(font-lock-string-face :foreground "#c0392e")
    `(error :foreground "#ff0055")
    `(doom-modeline-bar :background "#c0392e")
    `(doom-modeline-buffer-file :foreground "#ffffff" :weight bold))

  ;; 3. add the alpha *after* the face is defined
  (defun +my-set-alpha ()
    "Set background opacity to 85 % on GUI frames."
    (when (display-graphic-p)
      (set-frame-parameter nil 'alpha-background 85)))
  ;; run once now ...
  (+my-set-alpha)
  ;; ... and every time a new GUI frame appears
  (add-hook 'after-make-frame-functions
            (lambda (frame)
              (when (display-graphic-p frame)
                (with-selected-frame frame
                  (+my-set-alpha))))))

;; 4. floating windows (still legal – this is a frame parameter)
(setq doom-floating-windows-extra-parameters '((alpha . 85)))
