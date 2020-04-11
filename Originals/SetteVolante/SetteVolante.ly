% {{{ PARAMETRI
  myTitle = "Sette Volante"
  myKey = \key c \major
  myTime = \time #'(3 2 2) 7/8 
  myTempo =  #(ly:make-moment 190 4)
% }}}

% INTESTAZIONE {{{
\version "2.18.2"

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
    \partial 1*5/8 e,8 a a b c |
    \repeat volta 2 {
      b4 b8 c b a b | c4 g8 r8 c d e | 
      f e d d e f g | e4. r4 d8 e | \break
      f4 f8 a4 f | e d8 c4 d |
      dis4 fis8 dis4 b | e4 e,8 a a b c | \break
      b4 b8 c b a b | c4 g8 r8 c d e | 
      f e d d e f g | e4. r4 d8 e |  \break
      f4 f8 a4 f | e d8 c4 c8 e |
      d4 d8 d e c b | 
    } 
    \alternative{
      { a4 e8 a a b c | }
      { a4. r2 | }
    }
  }

  accordiA = \chordmode{
    \partial 1*5/8 s1*5/8 |
    \repeat volta 2{
      g1*7/8 | c1*7/8 | g1*7/8 | c1*7/8 |
      d1*7/8:m | c1*7/8 | b1*7/8:7 | e4. d2:7 |
      g1*7/8 | c1*7/8 | g1*7/8 | c1*7/8 |
      d1*7/8:m | c1*7/8 | e1*7/8:7 |
    }
    \alternative{
      { a4.:m d2:7 | }
      { a1*7/8:m | }
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    \time 4/4
    \repeat volta 2 {
      fis'4 fis8 e d e fis a | gis4 gis8 fis e fis gis a |
      b c b4 b8 c b4 | b8 c b4 gis a |
      fis4 fis8 e d e fis a |g4~ g8 a bes a g4 | 
      fis8 g fis ees a g fis ees | \trip fis g fis \trip ees d c a2 |

    } 
  }

  accordiB = \chordmode{
    \time 4/4
    \repeat volta 2{
      d1 | e1 | a1:m | a1:m |
      d1 | g1:m | c1:m | d1 |
    }
  }
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break
  \bar "||"
  \mark \default
  \temaB \break
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
    \accordiB
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
