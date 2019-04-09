\header {
  title = \myTitle
}

\paper{  
  print-first-page-number = ##t
  oddHeaderMarkup = \markup \null
  evenHeaderMarkup = \markup \null
  oddFooterMarkup = \markup {
    \fill-line {
      \on-the-fly \print-page-number-check-first
      \fromproperty #'page:page-number-string
    }
  }
  evenFooterMarkup = \oddFooterMarkup
  myStaffSize = #2
  fonts = #(make-pango-font-tree
  "FontAwesome"
  "FontAwesome"
  "FontAwesome"
  (/ myStaffSize 2))  
  
  scoreTitleMarkup = \markup { 
    \column {
      \fill-line {
        \fontsize #2.5 \italic \fromproperty #'header:piece
        \fromproperty #'header:opus
      }
    }
  }
  
%    markup-system-spacing =
%    #'((basic-distance . 0)
%       (padding . 0))
    
%    score-markup-spacing =
%    #'((basic-distance . 0)
%       (padding . 0))
}

global = {
  \numericTimeSignature
  \set Score.markFormatter = #format-mark-box-alphabet
}
\layout { 
  \override Score.RehearsalMark.self-alignment-X = #LEFT
  \set chordChanges = ##t
  indent = #0
  \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = #2

}

#(define-markup-command (LickCounter layout props) ()
  "Increases and prints out the value of the given counter named @var{name}.
  If the counter does not yet exist, it is initialized with 1."
  (let* ((oldval (assoc-ref counter-alist 'LickC))
         (newval (if (number? oldval) (+ oldval 1) 1)))
  (set! counter-alist (assoc-set! counter-alist 'LickC newval))
  (interpret-markup layout props
    (markup (number->string newval)))))

trip = #(define-music-function (parser location m1 m2 m3) 
  (ly:music? ly:music? ly:music?)
  "Triplets"             
  #{ \tuplet 3/2 { $m1 $m2 $m3 } #})

LickScore = 
#(define-scheme-function (p l tempo majkey tema accordi author tune) 
   (scheme? scheme? ly:music? scheme? string? string?)
   #{ 
  \score {
    \header{ piece = \markup \concat{\LickCounter ". " $author ", " $tune ""}}
    << 
        \relative c' {
          $tempo
          $majkey 
          $tema
        }
        \new ChordNames{$accordi \bar "|."}
    >>    
  }
#})

#(define-public includeLocal (define-music-function (parser location 
file)(string?)
     (let ((outname (format "~A.ly" (ly:parser-output-name parser)))
           (locname (car (ly:input-file-line-char-column location)))
           (file (ly:find-file file)))
          (if (or (string=? outname locname) (string-suffix? outname 
locname))
              (begin
                ;(ly:input-message location "include ~A" file)
                (ly:parser-include-string parser (format 
"\\sourcefilename \"~A\" \\sourcefileline 0\n~A"
                    file (ly:gulp-file file))))
          )
          (make-music 'SequentialMusic 'void #t))))
