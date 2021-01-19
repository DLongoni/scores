date = \markup{ \small \medium \italic #(strftime "%d/%m/%Y" (localtime (current-time)))}

\header {
  title = \myTitle
  subtitle = \date
}

\paper{
  % system-system-spacing =
  %   #'((basic-distance . 10) 
  %      (minimum-distance . 0)
  %      (padding . 5)
  %      (stretchability . 20)) 
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
  myStaffSize = #20
  fonts = #(make-pango-font-tree
  "DejaVu Serif"
  "DejaVu Serif"
  "DejaVu Serif"
  (/ myStaffSize 20))
}

global = {
  \myKey
  \numericTimeSignature
  \myTime
  \set Score.markFormatter = #format-mark-box-alphabet
}

\layout {
  #(set-global-staff-size 10)
  indent = #0
  \set chordChanges = ##t
  \override Score.RehearsalMark.self-alignment-X = #LEFT
  \context { 
    \Staff \RemoveEmptyStaves 
    \override VerticalAxisGroup.remove-first = ##t
  }
}

trip = #(define-music-function (parser location m1 m2 m3) 
  (ly:music? ly:music? ly:music?)
  "Triplets"             
  #{ \tuplet 3/2 { $m1 $m2 $m3 } #})

toCoda = {
  % the align part
  \mark \markup { { \lower #1 "al  " { \musicglyph #"scripts.coda"} } } 
}

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
