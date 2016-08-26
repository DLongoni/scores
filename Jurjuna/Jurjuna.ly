% DEFINIZIONI {{{
\version "2.18.2"

\header {
  title = "Jurjuna"
  composer = "Sufi Traditional"
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
  \key b \minor
  \numericTimeSignature
  \time #'(3 2 2 3) 10/8
  \set Score.markFormatter = #format-mark-box-alphabet
}
%}}}


tema = {
  \repeat volta 2 {
    r4 a8 b4 b c b8 |
    d4 e8 c4 b b4.~ |\noBreak
    b4 d8 e4 e e d8 |\noBreak
    e4 fis8~ fis8 e e d e4.|
  }
  r4 d8 e4 e8 fis d4 cis8|
  d4 e8 c b c b c4 b8|
  b4 d8 e4 e8 fis d4 cis8|
  d4 e8 c4 b b4.|\bar"||" \break

  r4 a8 b4 b c b8 |
  fis'4 e8 e d cis fis d4 c8|
  b4 d8 e4 e8 fis d4 cis8|
  d4 e8 c4 b b4.|\bar"||" \break

  r4 g'8 fis e e d e4 cis8 |
  d4 e8 cis e d e c4 b8 |
  b4 g'8 fis e e d e4 cis8 |
  d4 c8 b a cis d e4.~ |\bar"||" \break

  e4 g8 fis e e d e4 cis8 |
  d4 e8 cis e d e c4 b8 |
  b4 b'8 a g fis e d4 cis8 |
  d4 e8 c b b4.| \bar"|."
}

accordi = \chordmode{
  \set chordChanges = ##t
  \repeat volta 2{
     b4.:m b4:m b4:m b4.:m |
     b4.:m b4:m b4:m b4.:m |
     b4.:m b4:m b4:m b4.:m |
     b4.:m b4:m b4:m b4.:m |
  }
}

% SCORE {{{
tema = \relative c' {
  \global 
  \tema
}

chordsPart ={
  \new ChordNames {
    \accordi
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
    }
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 80 4)
      }
    }
  }
}
% }}}
