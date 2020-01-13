% {{{ PARAMETRI
  myTitle = "Dospatsko Horo"
  mySubTitle = "Bulgarian"
  myKey = \key g \major
  myTime = \time #'(3 2 2) 7/8 
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
      e,4. e4 b' | b4. b a8 | a4. a4 a8 g | a b4 g g8 fis |
    }
  }

  accordiA = \chordmode{
    \repeat volta 2{
      e1*7/8:m | e1*7/8:m | a1*7/8:m | e1*7/8:m |
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    \repeat volta 2 {
      a4 g8 g4 g | g a8 fis4 fis | e4.~ e2 | b'4. b4 g | \break
      a4 g8 g4 g4 | g a8 fis4 fis | e4.~ e2 | e4. e4 r4 |
    } 
  }

  accordiB = \chordmode{
    \repeat volta 2{
      c1*7/8 | d1*7/8 | e1*7/8:m | e1*7/8:m |
      a1*7/8:m | d1*7/8 | e1*7/8:m | a4. e2:m |
    }
  }
% }}}

% {{{ PARTE C
  temaC = {
    \repeat volta 2 {
      d8 e fis g a a g | c4 b8 b4 r4 | c4 b8 c d c b | a4 g8 g4 r | \break
      d8 e fis g a a g | c4 b8 b4 r4 | a4 g8 g a fis d | e4. e2 |
    } 
  }

  accordiC = \chordmode{
    \repeat volta 2{
      d1*7/8 | c4. g2 | c4. d2 | g1*7/8 |
      d1*7/8 | c4. g2 | a4.:m d2 | e1*7/8:m |
    }
  }
% }}}

% {{{ PARTE D
  temaD = {
    \repeat volta 2 {
      d'4. d8 c b a | a4 g8 g2 | d'8 g, e' d c b a | b4 a8 a2 | \break
      d4. d8 c b a | a4 g8 g2 | a8 e b' a g fis e | e2.. |
    } 
  }

  accordiD = \chordmode{
    \repeat volta 2{
      d1*7/8 | g1*7/8 | g1*7/8 | a1*7/8:m |
      d1*7/8 | g1*7/8 | a4.:m a4:m b4:m | e1*7/8:m
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
  \temaD 
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

  \book{
    \bookOutputSuffix "Eb"
    \score { \transpose ees c { \scoreContent } }
  }
% }}}
