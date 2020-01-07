% {{{ PARAMETRI
  myTitle = "Cetvorno Horo"
  mySubTitle = "Bulgarian"
  myKey = \key bes \major
  myTime = \time #'(3 2 2) 7/16 
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
    \repeat volta 2 {
      g8 d16 fis g a bes | g bes bes a8 bes16 a | g8 a16 bes d c8 | \break
      bes16 a g fis g a bes | g bes bes a8 bes16 a |
    } 
    \alternative{
      { g8 g16 g8 r8 }
      { g8 g16 g8\staccato g16 a }
    }
  }

  accordiA = \chordmode{
    \repeat volta 2{
      g8.:m g8:m d8:7 | g8.:m c8:m d8:7 | g8.:m g8:m c8:m |
      g4.:m g16:m | c8.:m c8:m d8:7 | 
    }
    \alternative{
      { g1*7/16:m }
      { g1*7/16:m }
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    \repeat volta 2 {
      bes8 f16 bes d c8 | a8 f16 a c bes8 | g8 d16 g bes a8 | g d16 e fis g a | \break
      bes8 f16 bes d c8 | a8 f16 a c bes8 | g8 d16 g bes a8 |
    } 
    \alternative{
      { g8 d16 g8\staccato g16 a }
      { g8 d16 g16 d bes' a }
    }
  }

  accordiB = \chordmode{
    \repeat volta 2{
      bes8. bes8 ees8 | f8. f8 d8:7 | g8.:m c8:m d8:7 | g1*7/16:m |
      bes8. bes8 ees8 | f8. f8 d8:7 | g8.:m c8:m d8:7 |
    }
    \alternative{
      { g1*7/16:m }
      { g1*7/16:m }
    }
  }
% }}}

% {{{ PARTE C
  temaC = {
    \repeat volta 2 {
      g16 fis g a bes g bes | a8 g16 a c bes a | bes8 a16 g d g d| \break
      g16 fis g a bes g bes | a8 g16 a c bes a | 
    } 
    \alternative{
      { bes8 a16 g d g8\staccato }
      { g8 g16 g8 r8 }
    }
  }

  accordiC = \chordmode{
    \repeat volta 2{
     g1*7/16:m | c8.:m d4:7 | g1*7/16:m |
     g1*7/16:m | c8.:m d4:7 | 
    }
    \alternative{
      { g1*7/16:m }
      { g1*7/16:m }
    }
  }
% }}}


% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break \bar "||"
  \mark \default
  \temaB \break \bar "||"
  \mark \default
  \temaC \break \bar "|."
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
    \accordiB
    \accordiC
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
