% {{{ PARAMETRI
  myTitle = "Alone in a sleeping city"
  myKey = \key f \major
  myTime = \time #'(2 2 2 3) 9/8
  myTempo =  #(ly:make-moment 100 4)
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
fakeBar = {  
  \bar""
  \cadenzaOn
  \once \omit Score.TimeSignature
  \time 1/16
  
    \bar ":|."
  s16  
  \cadenzaOff
  \once \omit Score.TimeSignature
  \myTime
}
%}}}

% {{{ PARTE A
  temaA = {
    r8 f c f a4 g8 e c | f d d2 e8 c a | d bes bes2 c8 a f | a e'16 f e2~ e4. | \break
    r8 bes f bes d4 c8 a f | g4 bes8 g bes g a4 cis8 | d4 e8 d e d a4.~ | a2. r4. | \break
    r8 f' c f a4 g8 e c | f d d2 e8 c a | d bes bes2 c8 a f | a e'16 f e2~ e4. | \break
    r8 bes f bes d4 c8 a f | g4 bes8 a bes a g4 d'8 | f2. r4. | r2. r4. |
  }

  accordiA = \chordmode{
      f2.:maj7 c4.:7 | d2.:m7 a4.:m7 | bes2.:maj7 f4.:maj7 | a1*9/8:m7 |
      bes2.:maj7 f4.:maj7 | g2.:m7 a4.:7 | d1*9/8:m9 | d2.:m9 c4.:13 |
      f2.:maj7 c4.:7 | d2.:m7 a4.:m7 | bes2.:maj7 f4.:maj7 | a1*9/8:m7 |
      bes2.:maj7 f4.:maj7 | g2.:m7 c4.:9 | f1*9/8:maj7 | f1*9/8:maj7 |
  }
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break \bar "|."
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
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
