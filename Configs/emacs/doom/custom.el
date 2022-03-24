(server-start)

(setq org-bullets-face-name (quote org-bullet-face))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-bullets-bullet-list '("⚫" "⊚" "⊛" "⊙" "￮" "⚬" "∘" "∙"))
(setq org-latex-logfiles-extensions (quote
                                     ("lof" "lot" "tex~" "aux" "idx"
                                      "log" "out" "toc" "nav" "snm"
                                      "vrb" "dvi" "fdb_latexmk" "blg"
                                      "brf" "fls" "entoc" "ps" "spl"
                                      "bbl")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#1c1d20" "#ea3d54" "#78bd65" "#fedd38" "#4fb3d8" "#b978ab" "#4fb3d8" "#cbccd1"])
 '(custom-safe-themes
   '("613aedadd3b9e2554f39afe760708fc3285bf594f6447822dd29f947f0775d6c" "a7b20039f50e839626f8d6aa96df62afebb56a5bbd1192f557cb2efb5fcfb662" "246a9596178bb806c5f41e5b571546bb6e0f4bd41a9da0df5dfbca7ec6e2250c" "850bb46cc41d8a28669f78b98db04a46053eca663db71a001b40288a9b36796c" default))
 '(exwm-floating-border-color "#32363b")
 '(fci-rule-color "#5B6268")
 '(highlight-tail-colors ((("#252d26" "#252d26") . 0) (("#212c32" "#212c32") . 20)))
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#fedd38"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#78bd65"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#3f444a"))
 '(objed-cursor-color "#ea3d54")
 '(org-agenda-files '("/home/atai/Code-Steel (ORG)/ACCESS/Agenda"))
 '(package-selected-packages
   '(lua-mode zoom-window yaml org-bullets company-tabnine projectile))
 '(pdf-view-midnight-colors (cons "#cbccd1" "#1c1d20"))
 '(rustic-ansi-faces
   ["#1c1d20" "#ea3d54" "#78bd65" "#fedd38" "#4fb3d8" "#b978ab" "#4fb3d8" "#cbccd1"])
 '(vc-annotate-background "#1c1d20")
 '(vc-annotate-color-map
   (list
    (cons 20 "#78bd65")
    (cons 40 "#a4c756")
    (cons 60 "#d1d247")
    (cons 80 "#fedd38")
    (cons 100 "#f8bc33")
    (cons 120 "#f39b2e")
    (cons 140 "#ee7b29")
    (cons 160 "#dc7a54")
    (cons 180 "#ca797f")
    (cons 200 "#b978ab")
    (cons 220 "#c9648e")
    (cons 240 "#d95071")
    (cons 260 "#ea3d54")
    (cons 280 "#bf3e51")
    (cons 300 "#94404f")
    (cons 320 "#69424c")
    (cons 340 "#5B6268")
    (cons 360 "#5B6268")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:inherit outline-1 :height 1.1))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.05))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
 '(org-level-4 ((t (:inherit outline-4 :height 0.8))))
 '(org-level-5 ((t (:inherit outline-5 :height 0.8)))))



(add-hook 'LaTeX-mode-hook 'latex-preview-pane-mode)
;;(latex-preview-pane-enable)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
;(setq TeX-PDF-mode t)


(require 'flymake)

(defun flymake-get-tex-args (file-name)
(list "pdflatex"
(list "-file-line-error" "-draftmode" "-interaction=nonstopmode" file-name)))

(add-hook 'LaTeX-mode-hook 'flymake-mode)

(defun turn-on-outline-minor-mode ()
(outline-minor-mode 1))

(add-hook 'LaTeX-mode-hook 'turn-on-outline-minor-mode)
(add-hook 'latex-mode-hook 'turn-on-outline-minor-mode)
(setq outline-minor-mode-prefix "\C-c \C-o") ; Or something else



(setq ispell-program-name "aspell") ; could be ispell as well, depending on your preferences
(setq ispell-dictionary "english") ; this can obviously be set to any language your spell-checking program supports

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-buffer)





(defun org-title-view ()
  "Change header fint size to more closely resemble actual size in documents"
    (custom-set-faces
    '(org-level-1 ((t (:inherit outline-1 :height 1.8))))
    '(org-level-2 ((t (:inherit outline-2 :height 1.5))))
    '(org-level-3 ((t (:inherit outline-3 :height 1.2))))
    '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
    '(org-level-5 ((t (:inherit outline-5 :height 1.0))))))

(setq org-todo-keyword-faces
      '(
        ("DONE" . (:strike-through t))
        ("[x]" . (:strike-through t))
        ))

;; (load-theme 'doom-city-lights t)

(add-hook 'org-mode-hook (lambda ()
   "Beautify Org Checkbox Symbol"
   (push '("[ ]" .  "☐") prettify-symbols-alist)
   (push '("[X]" . "☑" ) prettify-symbols-alist)
   (push '("[-]" . "❍" ) prettify-symbols-alist)
    (push '("[?]" . "❓" ) prettify-symbols-alist)
   (prettify-symbols-mode)))



(setq org-file-apps
      '((auto-mode . emacs)
        ("\\.pdf\\'" . "google-chrome \"%s\"")
        ("\\.lyx\\'" . "lyx -r \"%s\"")
        )
      )


(setq org-latex-toc-command "\\tableofcontents \\clearpage")
;; (require 'company-tabnine)
;; (add-to-list 'company-backends #'company-tabnine)


;; (require 'rebox2)

;; ; The following template defines the specific style required here,
;; ; which does not correspond to any built-in rebox2 style.
;; ;
;; ; "75" means that the style is registered as x75, where "x" depends
;; ; on the current langauge mode. The "?" char is switched for the language
;; ; specific comment char
;; ;
;; ; "999" is the weighting used for recognising this comment style.
;; ; This value works for me.
;; (rebox-register-template
;;  75
;;  999
;;  '("?????????????????????????????????????????????????????????????????????????????????????????????????"
;;    "??                               box123456                                                     ??"
;;    "?????????????????????????????????????????????????????????????????????????????????????????????????"))

;; (add-hook 'perl-mode-hook (lambda ()
;; ; The "style loop" specifies a list of box styles which rebox will cycle
;; ; through if you refill (M-q) a box repeatedly. Having "11" in this loop
;; ; will allow you to easily "unbox" a comment block, e.g. for "uncomment-region"
;;                 (set (make-local-variable 'rebox-style-loop) '(75 11))
;; ; The "min-fill-column" setting ensures that the box is not made narrower
;; ; when the text is short
;;                 (set (make-local-variable 'rebox-min-fill-column) 79)
;;                 (rebox-mode 1)))
