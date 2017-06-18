% {{{ PARAMETRI
  myTitle = "Djunguritsa"
  mySubTitle = "Bulgarian, Pirin"
  myKey = \key c \major
  myTime = \time #'(2 2 2 3) 9/8
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
fakeBar = {  
  \cadenzaOn
  \once \omit Score.TimeSignature
  \time 1/16
  s16 \bar ""
  \cadenzaOff
  \once \omit Score.TimeSignature
  \time #'(2 2 2 3) 9/8
}
%}}}

% {{{ PARTE A
  temaA = {
    \repeat volta 2 {
      d,16 e e e e8 e' d c b a g | a16 a a g a8 b c d b4 b8 | cis16 d d cis d8 e d c b a g | a16 a a g a8 b g16 a g fis e4.|
    } 
  }

  accordiA = \chordmode{
    \repeat volta 2{
      e4:m c4 d4 g4. | a4:m a4:m d4:/fis g4. | c2 d4 g4. | a2:m b4:m e4.:m |
    }
  }

  accordiAbis = \chordmode{
    \repeat volta 2{
      e1*9/8:m | a2:m b4:m e4.:m | e1*9/8:m | s1*9/8 |
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    \repeat volta 2 {
      g16 d a' a a8 fis g16 d fis d g8 fis d | g16 d a' a a8 fis g fis d4. |
      g8 a16 a a8 a d8 c b a g | a16 a a g a8 b g16 a g fis e4. |
      \once \override Score.RehearsalMark.direction = #DOWN
      \once \override Score.RehearsalMark.break-visibility = #begin-of-line-invisible
      \once \override Score.RehearsalMark.self-alignment-X = #RIGHT  
      \mark \markup { \lower #1 \italic "D.C."} 
    } 
  }

  accordiB = \chordmode{
    \repeat volta 2{
      a2:m d4 g4. | a2:m a4 d4. | b2:m c4 g4. | a2:m b4:m e4.:m |
    }
  }

  accordiBbis = \chordmode{
    \repeat volta 2{
      s1*9/8 | s1*9/8 | s1*9/8 | s1*9/8 | 
    }
  }
% }}}

% {{{ PARTE C
  temaC = {
    \fakeBar
    \mark \default
    \bar ".|:"
    \repeat volta 2 {
      cis'16 d d cis d8 r8 cis16 d d cis d8 e4 | cis16 d d cis d8 e8 d8 c8 b a g |
    } 
  }

  accordiC = \chordmode{
    \fakeBar
    \repeat volta 2{
      e1*9/8 | e1*9/8 | 
    }
  }

  accordiCbis = \chordmode{
    \fakeBar
    \repeat volta 2{
      s1*9/8 | s1*9/8 |
    }
  }
% }}}

% {{{ PARTE D
  temaD = {
    \repeat volta 2 {
      cis16 d d cis d8 e d c b a g | a16 a a g a8 b c d b4 b8 |
      cis16 d d cis d8 e d c b a g | a16 a a g a8 b g16 a g fis e4. |
    } 
  }

  accordiD = \chordmode{
    \repeat volta 2{
      d2:7 d4:/fis g4. | c2:m d4:/fis g4. | a2:m d4 g4. | a2:m b4:m e4.:m |
    }
  }

  accordiDbis = \chordmode{
    \repeat volta 2{
      s1*9/8 | s1*9/8 | s1*9/8 | s1*9/8 | 
    }
  }
% }}}

% {{{ PARTE E
  temaE = {
    \repeat volta 2 {
      g8 a16 a a8 fis g fis g fis d | g a16 a a8 fis g fis d4. |
      g8 a16 a a8 a d c b a g | a16 a a g a8 b g16 a g fis e4. |
    } 
  }

  accordiE = \chordmode{
    \repeat volta 2{
      a2:m d4 g4. | a2:m a4 d4. | b4:m c4:m d4:/fis g4. | a2:m b4:m e4.:m |
    }
  }

  accordiEbis = \chordmode{
    \repeat volta 2{
      e1*9/8:m | \once \set chordChanges = ##f e2:m a4 d4. | s1*9/8 | s1*9/8 |
    }
  }
% }}}

% {{{ PARTE F
  temaF = {
    \repeat volta 2 {
      b'16 c c a b b b8 b16 c c a gis8 a b | b16 c c a b b b8 b16 a gis f e f gis a b8 |
      b16 c c a b b b8 b16 c c a gis8 a b | b16 c c a b b b8 b16 a gis f e b e4 |
    } 
  }

  accordiF = \chordmode{
    \repeat volta 2{
      e1*9/8 | e2 d4:m e4. | e2 a4:m e4. | e2 d4:m e4. |
    }
  }
% }}}

% {{{ PARTE G
  temaG = {
    \repeat volta 2 {
      d'16 cis d e d c b a b c b a gis8 a b | d16 c b a b b b8 b16 c b a gis8 a b |
      d16 cis d e d c b a b c b a gis8 a b | d16 c b a b b b8 b16 a gis f e b e4 |
    } 
  }

  accordiG = \chordmode{
    \repeat volta 2{
      e2 d4:m e4. | a4:m e4 a4:m d4.:m |
      e2 d4:m e4. | a4:m e4 d4:m e4. |
    }
  }
% }}}

% {{{ PARTE H
  temaH = {
    \repeat volta 2 {
      d'16 c b a b b b8 b16 c b a gis f e f gis a | d c b a b b b8 b16 a gis f e8 e4 |
      d'16 c b a b b b8 b16 c b a gis f e f gis a | d c b a b b b8 b16 a gis f e16 b e4 |
    } 
  }

  accordiH = \chordmode{
    \repeat volta 2{
      a4:m e2 e4. | e2 d4:m e4. |
      a4:m e2 e4. | a4:m e4 d4:m e4. |
    }
  }
% }}}

% {{{ PARTE I
  temaI = {
    \fakeBar
    \mark \markup { \musicglyph #"scripts.segno" }
    \bar ".|:"
    \repeat volta 2 {
      e4 e'8 e e e e e4 | d8 c b a b a d e4 | d8 c b a g a b4 a8 | g fis fis16 fis f e e4 e8 e4 |
    } 
  }

  accordiI = \chordmode{
    \fakeBar
    \repeat volta 2{
      a2:m g4 c4. | a4:m d4 g4 c4. |a2:m d4 g4. | a4:m b4:m e4 e4. |
    }
  }
% }}}

% {{{ PARTE J
  temaJ = {
    \repeat volta 2 {
      g8 a16 a a8 a a g b4 a8 | g fis fis d e fis g a b | 
      \acciaccatura{cis8} d8 c b a g a b4 a8 | g8 fis fis16 fis f e e4 e8 e4 |
    } 
  }

  accordiJ = \chordmode{
    \repeat volta 2{
      a4:m c4:m d4 d4. | a4:m b4:m e4:m e4.:m | a4:m d4 g4 c4. | a4:m b4:m e4:m e4.:m |
    }
  }
% }}}

% {{{ PARTE K
  temaK = {
    \repeat volta 2 {
      g8 a16 a a8 a c16 b a g g d g8 g | g16 g fis a fis fis d8 e fis g a b |
      g8 a16 a a8 a c16 b a g g d g8 g | g16 g fis a fis fis d8 e16 e e b e b
      \once \override Score.RehearsalMark.direction = #DOWN
      \once \override Score.RehearsalMark.self-alignment-X = #RIGHT  
      \mark \markup { { \lower #1 \italic "D.S."} }  e4 |
    } 
  }

  accordiK = \chordmode{
    \repeat volta 2{
      a4:m c4:m d4 d4. | a2:m e4:m e4.:m | a4:m c4:m d4 g4. | a4:m b4:m e4:m e4.:m |
    }
  }
% }}}

% {{{ PARTE L
  temaL = {
    \repeat volta 4 {
      b'16 c c a b b b8 b16 c c a gis8 a b | b16 c c a b b b8 b16 a gis f e f gis a b8 |
      b16 c c a b b b8 b16 c c a gis8 a b | b16 c c a b b b8 b16 a gis f e b e4 |
      \mark \markup{ "4x" }
    } 
  }

  accordiL = \chordmode{
    \repeat volta 4{
      e1*9/8 | e2 d4:m e4. | e2 a4:m e4. | e2 d4:m e4. |
    }
  }
% }}}

% LYRICS {{{
testoCompleto=\markup { }
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break
  \mark \default
  \temaB \break
  \temaC
  \mark \default
  \temaD \break
  \mark \default
  \temaE \break
  \mark \default
  \temaF \break
  \mark \default
  \temaG
  \mark \default
  \temaH \break
  \mark \default
  \temaI \break
  \mark \default
  \temaJ \break
  \mark \default
  \temaK \break
  \mark \default
  \temaL 
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
    \accordiB
    \accordiC
    \accordiD
    \accordiE
    \accordiF
    \accordiG
    \accordiH
    \accordiI
    \accordiJ
    \accordiK
    \accordiL
  }
}

chordsPartBis ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiAbis
    \accordiBbis
    \accordiCbis
    \accordiDbis
    \accordiEbis
  }
}

temaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \tema }

scoreContent = << 
  \chordsPartBis
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
