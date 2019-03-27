% {{{ PARAMETRI
  myTitle = "Kopanitsa a la Turca"
  mySubTitle = "Bulgarian Dance"
  myKey = \key c \major
  myTime = \time #'(2 2 3 2 2) 11/8
  myTempo =  #(ly:make-moment 100 4)
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
%}}}

% {{{ PARTE A
  temaA = {
    \repeat volta 2 {
      e8 f gis a b c a b4 b | b8 d c b a gis a b4 b | e,8 f gis a b c a b4 b | gis8 b a gis f e d e4 e|
    } 
  }

  accordiA = \chordmode{
    \repeat volta 2{
      e1*11/8 | e1*11/8 | e1*11/8 | e2 d4.:m e2 |
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    \repeat volta 2 {
      cis'8 d d4 d8 cis e d c b a | b c c4 c8 b d c b a f | gis a b c d4 c8 b4 a | gis8 b a gis f e d e4 e |
    } 
  }

  accordiB = \chordmode{
    \repeat volta 2{
      d1*11/8:m | a1*11/8:m | e2 d4.:m d2:m | e2 d4.:m e2 |
    }
  }
% }}}

% {{{ PARTE C
  temaC = {
    \repeat volta 2 {
      gis8 b a gis f e d e f gis a | gis b a gis f e d e4 e | gis8 b a gis f e d e f gis a | gis8 b a gis f e d e4 e |
    } 
  }

  accordiC = \chordmode{
    \repeat volta 2{
      \once \set chordChanges = ##f e2 d4.:m e2 |
      \once \set chordChanges = ##f e2 d4.:m e2 |
      \once \set chordChanges = ##f e2 d4.:m e2 | 
      \once \set chordChanges = ##f e2 d4.:m e2 |
    }
  }
% }}}

% {{{ PARTE D
  temaD = {
    \repeat volta 2 {
      gis8 a b4 gis8 a b gis a b4 | gis8 a b4 a8 gis f e4 e | gis8 a b4 gis8 a b gis a b4 | gis8 a b4 a8 gis f e4 e |
    } 
  }

  accordiD = \chordmode{
    \repeat volta 2{
      e1*11/8 |
      \once \set chordChanges = ##f e2 d4.:m e2 |
      \once \set chordChanges = ##f e1*11/8 |
      \once \set chordChanges = ##f e2 d4.:m e2 |
    }
  }
% }}}

% LYRICS {{{
testoCompleto=\markup { }
% }}}

% SCORE {{{
tema = \relative c {
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
    \testoCompleto
  }

  \book{
    \bookOutputSuffix "Bb"
    \score { \transpose c d {\scoreContent} }
    \testoCompleto
  }

  \book{
    \bookOutputSuffix "Eb"
    \score { \transpose ees c { \scoreContent } }
    \testoCompleto
  }
% }}}
