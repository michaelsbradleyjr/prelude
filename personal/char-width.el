;; the specified range is for https://codepoints.net/symbols_for_legacy_computing

(set-char-table-range char-width-table '(#x1fb00 . #x1fbf9) 1)

;; to query the range instead of setting it:
;; (char-table-range char-width-table '(#x1fb00 . #x1fbf9))
