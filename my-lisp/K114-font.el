;; Provided by Sebastian Urban
;; More information at https://idiocy.org/emacs-fonts-and-fontsets.html

;; 1. 设置默认字体使用 set-face-attribute。直接设置默认大小
;; 2. 没有单独的英文 latin 字体设置，该字符集的设置就是默认字体
;; 3. 设置其他字符集的方式为 (set-fontset-font "fontset-default" '字符集 "字体名字")，如果要设置大小，使用 (font-spec) 包装
;; 4. cjk-misc 是中文的句号等字符
;; 5. daemon 模式启动不会加载face相关设置，上述字体设置不生效，需要使用 after-make-frame-functions。
;; 6. (display-graphic-p) 函数可用来判断是否在字符终端还是 UI 终端。

(defun config-fonts ()
  (set-face-attribute 'default nil :font "Monaco-12")
  (set-fontset-font "fontset-default" 'han (font-spec :family "Noto Sans CJK SC Medium" :size 20))
  (set-fontset-font "fontset-default" 'cjk-misc (font-spec :family "Noto Sans CJK SC Medium" :size 20)))

;; daemon模式启动的时候,上面的设置不生效，这里判断每次创建新的frame的时候设置一下。
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (select-frame frame)
            (config-fonts)))

;; (set-fontset-font "fontset-default" 'adlam "Noto Sans Adlam")
;; (set-fontset-font "fontset-default" 'anatolian "Noto Sans Anatolian Hieroglyphs")
;; (set-fontset-font "fontset-default" 'arabic "Noto Sans Arabic")
;; (set-fontset-font "fontset-default" 'aramaic "Noto Sans Imperial Aramaic Regular")
;; (set-fontset-font "fontset-default" 'armenian "Noto Sans Armenian")
;; (set-fontset-font "fontset-default" 'avestan "Noto Sans Avestan")
;; (set-fontset-font "fontset-default" 'balinese "Noto Sans Balinese")
;; (set-fontset-font "fontset-default" 'bamum "Noto Sans Bamum")
;; (set-fontset-font "fontset-default" 'batak "Noto Sans Batak")
;; (set-fontset-font "fontset-default" 'bengali "Noto Sans Bengali")
;; (set-fontset-font "fontset-default" 'brahmi "Noto Sans Brahmi")
;; (set-fontset-font "fontset-default" 'buginese "Noto Sans Buginese")
;; (set-fontset-font "fontset-default" 'buhid "Noto Sans Buhid")
;; (set-fontset-font "fontset-default" 'burmese "Noto Sans Myanmar")
;; (set-fontset-font "fontset-default" 'canadian-aboriginal "Noto Sans Canadian Aboriginal")
;; (set-fontset-font "fontset-default" 'carian "Noto Sans Carian")
;; (set-fontset-font "fontset-default" 'chakma "Noto Sans Chakma")
;; (set-fontset-font "fontset-default" 'cham "Noto Sans Cham")
;; (set-fontset-font "fontset-default" 'cherokee "Noto Sans Cherokee")
;; (set-fontset-font "fontset-default" 'cjk-misc "Noto Sans CJK SC Regular")
;; (set-fontset-font "fontset-default" 'coptic "Noto Sans Coptic Regular")
;; (set-fontset-font "fontset-default" 'cuneiform "Noto Sans Cuneiform")
;; (set-fontset-font "fontset-default" 'cypriot-syllabary "Noto Sans Cypriot")
;; (set-fontset-font "fontset-default" 'deseret "Noto Sans Deseret")
;; (set-fontset-font "fontset-default" 'devanagari "Noto Sans Devanagari")
;; (set-fontset-font "fontset-default" 'egyptian "Noto Sans Egyptian Hieroglyphs Regular")
;; (set-fontset-font "fontset-default" 'ethiopic "Noto Sans Ethiopic")
;; (set-fontset-font "fontset-default" 'georgian "Noto Sans Georgian")
;; (set-fontset-font "fontset-default" 'glagolitic "Noto Sans Glagolitic")
;; (set-fontset-font "fontset-default" 'gothic "Noto Sans Gothic")
;; (set-fontset-font "fontset-default" 'gujarati "Noto Sans Gujarati")
;; (set-fontset-font "fontset-default" 'gurmukhi "Noto Sans Gurmukhi")
;; (set-fontset-font "fontset-default" 'han "Noto Sans CJK SC Regular")
;; (set-fontset-font "fontset-default" 'han "Noto Sans CJK TC Regular" nil 'append)
;; (set-fontset-font "fontset-default" 'hangul "Noto Sans CJK KR Regular")
;; (set-fontset-font "fontset-default" 'hanunoo "Noto Sans Hanunoo")
;; (set-fontset-font "fontset-default" 'hebrew "Noto Sans Hebrew")
;; (set-fontset-font "fontset-default" 'inscriptional-pahlavi "Noto Sans Inscriptional Pahlavi")
;; (set-fontset-font "fontset-default" 'inscriptional-parthian "Noto Sans Inscriptional Parthian")
;; (set-fontset-font "fontset-default" 'javanese "Noto Sans Javanese")
;; (set-fontset-font "fontset-default" 'kaithi "Noto Sans Kaithi")
;; (set-fontset-font "fontset-default" 'kana "Noto Sans CJK JP Regular")
;; (set-fontset-font "fontset-default" 'kannada "Noto Sans Kannada")
;; (set-fontset-font "fontset-default" 'kayah-li "Noto Sans Kayah Li")
;; (set-fontset-font "fontset-default" 'kharoshthi "Noto Sans Kharoshthi")
;; (set-fontset-font "fontset-default" 'khmer "Noto Sans Khmer")
;; (set-fontset-font "fontset-default" 'lao "Noto Sans Lao")
;; (set-fontset-font "fontset-default" 'lepcha "Noto Sans Lepcha")
;; (set-fontset-font "fontset-default" 'limbu "Noto Sans Limbu")
;; (set-fontset-font "fontset-default" 'linear-b "Noto Sans Linear B")
;; (set-fontset-font "fontset-default" 'lisu "Noto Sans Lisu")
;; (set-fontset-font "fontset-default" 'lycian "Noto Sans Lycian")
;; (set-fontset-font "fontset-default" 'lydian "Noto Sans Lydian")
;; (set-fontset-font "fontset-default" 'malayalam "Noto Sans Malayalam")
;; (set-fontset-font "fontset-default" 'mandaic "Noto Sans Mandaic")
;; (set-fontset-font "fontset-default" 'meetei-mayek "Noto Sans Meetei Mayek")
;; (set-fontset-font "fontset-default" 'mongolian "Noto Sans Mongolian")
;; (set-fontset-font "fontset-default" 'tai-lue "Noto Sans New Tai Lue Regular")
;; (set-fontset-font "fontset-default" 'nko "Noto Sans NKo Regular")
;; (set-fontset-font "fontset-default" 'ogham "Noto Sans Ogham")
;; (set-fontset-font "fontset-default" 'ol-chiki "Noto Sans Ol Chiki")
;; (set-fontset-font "fontset-default" 'old-italic "Noto Sans Old Italic Regular")
;; (set-fontset-font "fontset-default" 'old-persian "Noto Sans Old Persian Regular")
;; (set-fontset-font "fontset-default" 'old-south-arabian "Noto Sans Old South Arabian Regular")
;; (set-fontset-font "fontset-default" 'old-turkic "Noto Sans Old Turkic")
;; (set-fontset-font "fontset-default" 'oriya "Noto Sans Oriya")
;; (set-fontset-font "fontset-default" 'osage "Noto Sans Osage")
;; (set-fontset-font "fontset-default" 'osmanya "Noto Sans Osmanya")
;; (set-fontset-font "fontset-default" 'phags-pa "Noto Sans Phags Pa")
;; (set-fontset-font "fontset-default" 'phoenician "Noto Sans Phoenician")
;; (set-fontset-font "fontset-default" 'rejang "Noto Sans Rejang")
;; (set-fontset-font "fontset-default" 'runic "Noto Sans Runic")
;; (set-fontset-font "fontset-default" 'samaritan "Noto Sans Samaritan")
;; (set-fontset-font "fontset-default" 'saurashtra "Noto Sans Saurashtra")
;; (set-fontset-font "fontset-default" 'shavian "Noto Sans Shavian")
;; ;; (set-fontset-font "fontset-default" 'sinhala "Noto Sans Sinhala")
;; ;; (set-fontset-font "fontset-default" 'sinhala-archaic-number "Noto Sans Sinhala")
;; (set-fontset-font "fontset-default" 'sundanese "Noto Sans Sundanese")
;; (set-fontset-font "fontset-default" 'syloti-nagri "Noto Sans Syloti Nagri")
;; ;;(set-fontset-font "fontset-default" 'syriac "Noto Sans Syriac Eastern")
;; (set-fontset-font "fontset-default" 'syriac "Noto Sans Syriac Estrangela")
;; ;;(set-fontset-font "fontset-default" 'syriac "Noto Sans Syriac Western")
;; (set-fontset-font "fontset-default" 'tagalog "Noto Sans Tagalog")
;; (set-fontset-font "fontset-default" 'tagbanwa "Noto Sans Tagbanwa")
;; (set-fontset-font "fontset-default" 'tai-le "Noto Sans Tai Le")
;; (set-fontset-font "fontset-default" 'tai-tham "Noto Sans Tai Tham")
;; (set-fontset-font "fontset-default" 'tai-viet "Noto Sans Tai Viet")
;; (set-fontset-font "fontset-default" 'tamil "Noto Sans Tamil")
;; (set-fontset-font "fontset-default" 'telugu "Noto Sans Telugu")
;; (set-fontset-font "fontset-default" 'thaana "Noto Sans Thaana")
;; (set-fontset-font "fontset-default" 'thai "Noto Sans Thai")
;; (set-fontset-font "fontset-default" 'tibetan "Noto Sans Tibetan")
;; (set-fontset-font "fontset-default" 'tifinagh "Noto Sans Tifinagh")
;; (set-fontset-font "fontset-default" 'ugaritic "Noto Sans Ugaritic")
;; (set-fontset-font "fontset-default" 'vai "Noto Sans Vai")
;; (set-fontset-font "fontset-default" 'yi "Noto Sans Yi")
