% {{{ PARAMETRI
  myTitle = "Ispajce"
  mySubTitle = "Bulgarian"
  myKey = \key ees \major
  myTime = \time #'(3 2 3 2 3) 13/16 
  myTempo =  #(ly:make-moment 120 4)
% }}}

% INTESTAZIONE {{{
\version "2.18.2"

\header {
  title = \myTitle
  composer = \mySubTitle
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
  #(set-global-staff-size 10)
  myStaffSize = #20
  fonts = #(make-pango-font-tree
  "FontAwesome"
  "FontAwesome"
  "FontAwesome"
  (/ myStaffSize 20))
}

global = {
  \myKey
  \numericTimeSignature
  \myTime
  \set Score.markFormatter = #format-mark-box-alphabet
}
\layout { indent = #0 }
trip = #(define-music-function (parser location m1 m2 m3) 
  (ly:music? ly:music? ly:music?)
  "Triplets"             
  #{ \tuplet 3/2 { $m1 $m2 $m3 } #})
%}}}

% {{{ PARTE A
  temaA = {
    \repeat volta 2{
      \acciaccatura{e,8} f8. f8 f8. ees16 d \acciaccatura{ees8} c8 r16 | 
      \acciaccatura{e8} \tuplet 4/3 {f8 ees16 d} ees8 ees f16 d ees c8 r16 | \break
      \acciaccatura{ais} b8 c16 d8 d f16 ees d \acciaccatura{ees8} c8. | 
      \acciaccatura{e8} f16 ees d ees8 ees f16 d ees c8. | \break
      b8 c16 d8 d f16 ees d \acciaccatura{ees8} c8.\prall | 
      \acciaccatura{d} ees16 d \acciaccatura{ees} c b c d b8 c c r16 | \break
    }
  }

  accordiA = \chordmode{
    \repeat volta 2{
      f2:m c1*5/16:m | c1*13/16:m |
      g2 c1*5/16:m | c1*13/16:m |
      g2 c1*5/16:m | c8.:m g1*5/16 c1*5/16:m | 
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    \repeat volta 2{
      b'16 \acciaccatura{des} c8 b16 c d ees8 d\prall c16 aes8 | 
      b aes16 aes\prall g aes b8 aes16 g \acciaccatura{aes} g8. | \break
      \tuplet 4/3 {g16 d' c b} aes16 g aes b8 aes16 g aes f8 | 
      g8. g8 d'8. g,8 g8. | \break 
    }
  }

  accordiB = \chordmode{
    \repeat volta 2{
      g1*13/16 | f2:m g1*5/16 |
      g8. f1*10/16:m | g1*13/16 | 
    }
  }
% }}}

% {{{ PARTE C
  temaC = {
    \time #'(3 4 4) 11/16
    \repeat volta 2{
      f8. f8 f ees16 d c8 | f16 ees d ees8 ees16 f d ees c8 | \break
      b8 c16 d8 d16 f ees d c8 | f16 ees d ees8 ees16 f d ees c8 | \break
      b8 c16 d8 d16 f ees d c8 | ees16 d c b c d b c8 c | \break
    }
  }

  accordiC = \chordmode{
    \time #'(3 4 4) 11/16
    \repeat volta 2{
      f1*7/16:m c4:m | c1*11/16:m |
      g1*7/16 c4:m | c1*11/16:m |
      g1*7/16 c4:m | c8.:m  g4 c4:m |
    }
  }
% }}}

% {{{ PARTE D
  temaD = {
    \repeat volta 2{
      b'16 c8 b16 c d ees d8 c16 aes | b8 aes16 aes g aes b aes g g8 | \break
      g16 c b aes g aes b aes g aes f | g8. g8 d' g, g |
    }
  }

  accordiD = \chordmode{
    \repeat volta 2{
      g1*11/16 | f1*7/16:m g4 |
      g8. f2:m | g1*11/16 |
    }
  }
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break
  \mark \default
  \temaB \break
  \mark \default
  \temaC \break
  \mark \default
  \temaD \break
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
    \accordiB
    \accordiC
    \accordiD
  }
}

temaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \tema }

scoreContent = << 
  \chordsPart
  \temaPart
>>
%}}}

% {{{ BOOKS
  \book{
    \bookOutputSuffix "C"
    \score {
      \scoreContent
      \layout {}
      \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 190 4) } }
    }
  }

  \book{
    \bookOutputSuffix "Bb"
    \score { \transpose c d {\scoreContent} }
  }
% }}}
