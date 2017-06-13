% DEFINIZIONI {{{
\version "2.18.2"

\header {
  title = "Arapsko Kokonjeste"
  composer = "Serbian"
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
  \key bes \major
  \numericTimeSignature
  \time 2/4
  \set Score.markFormatter = #format-mark-box-alphabet
}
%}}}

% {{{ PARTE A
temaA = {
  \partial 8 g8 |
  c4. g8 | c4. g8 | c4. g8 | c16 ees d ees c8. g16 | 
  c16 ees d ees c8. g16 | c16 ees d ees c8. g16 | c16 ees d ees c8. g16 | c16 ees d ees c8. g16 | 
  \repeat volta 2 {
    bes8 bes16 c g8 d' | bes16 d a bes g8 d' | bes8 bes16 a g8 d' | bes16 d a bes g4 |
  } 
}

accordiA = \chordmode{
  \set chordChanges = ##t
  \partial 8 s8 |
  c2:m | c2:m | c2:m | c2:m | c2:m | c2:m | c2:m | c2:m |
  \repeat volta 2{
    g2:m | g2:m | g2:m | d4 g4:m | 
  }
}
% }}}

% {{{ PARTE B
temaB = {
  \repeat volta 2 {
    g'16 d g8~ g16 f e d | cis d e f g f e d | cis d e d cis8 bes16 a | g a bes cis d4 |
    g16 d g8~ g16 f e d | cis d e f g f e d | cis d e d cis8 bes16 a | g a bes a g4 |
  } 
}

accordiB = \chordmode{
  \repeat volta 2{
    g2:m | g2:m | g2:m | g2:m | 
    g2:m | g2:m | d2 | g2:m | 
  }
}
% }}}

% {{{ PARTE C
temaC = {
  \repeat volta 2 {
    g16 a bes a bes4 | d16 e d cis d4 | cis16 e d cis bes d bes a | g a bes cis d4 | 
    g,16 a bes a bes4 | d16 e d cis d4 | cis16 e d cis bes d bes a | b a bes a g4 |
  } 
  g'16 fis ees d ees4 | g16 fis ees d c4 | g'16 fis ees d ees4 | g16 fis ees d c4 |
}

accordiC = \chordmode{
  \repeat volta 2{
    g2:m | g2:m | d2 | g2:m | 
    g2:m | g2:m | d2 | g2:m | 
  }
  c2:m | c2:m | c2:m | c2:m | 
}
% }}}

% {{{ PARTE D
temaD = {
  \repeat volta 2 {
    bes'8 bes16 a g8 d' | bes16 d a bes g8 d' | bes bes16 a g8 d' | bes16 d a bes16 g4 |
  } 
}

accordiD = \chordmode{
  \repeat volta 2{
    g2:m | g2:m | g2:m | d4 g4:m |
  }
}
% }}}

% SCORE {{{
tema = \relative c' {
  \global 
  \mark \default
  \temaA \break
  \mark \default
  \temaB \break
  \mark \default
  \temaC \break \bar "||"
  \mark \default
  \temaD 
}

chordsPart ={
  \new ChordNames {
    \accordiA
    \accordiB
    \accordiC
    \accordiD
  }
}

temaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \tema }

\book{
  \bookOutputSuffix "Score"
  \score {
    <<
      \chordsPart
      \temaPart
    >>
    \layout {
      indent = #0
    }
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 190 4)
      }
    }
  }
}

\book{
  \bookOutputSuffix "Bb"
  \score {
    <<
      \transpose c d { \chordsPart }
      \transpose c d { \temaPart}
    >>
    \layout {
      indent = #0
    }
  }
}
% }}}
