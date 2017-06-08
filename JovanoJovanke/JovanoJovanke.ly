% DEFINIZIONI {{{
\version "2.18.2"

\header {
  title = "Jovano Jovanke"
  composer = "Macedonian"
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
  \key f \major
  \numericTimeSignature
  \time #'(3 2 2) 7/8
  \set Score.markFormatter = #format-mark-box-alphabet
}
%}}}


tema = {
  \mark \default
  \repeat volta 2 {
    e8 f d e4 d8 cis |
    cis d bes cis4 b8 a |
  }
  \alternative{
    { a8 bes g a bes cis d | e f d e4 r4 | }
    { a, bes g a bes cis g | a4.~ a2~ | a4.~ a2 |}
  }\bar"||" \break

  cis4 e8 d cis bes4 | a4.~ a2 | 
  \new Voice <<
    {cis4 e8 d cis bes4 | a4.~ a2 | }
    {e'4 g8 f e d4 | e4.~ e2 |}
  >>

  \repeat volta 2{
    \new Voice <<
      {a4 a8 a4 a| a8 g a b4 b8 a| }
      {}
    >>
  }
}

accordi = \chordmode{
  \set chordChanges = ##t
  \repeat volta 2{
    a1*7/8 |a1*7/8 |
  }
  \alternative{
    {a1*7/8 |a1*7/8 |}
    {a1*7/8 |a1*7/8 |a1*7/8 |}
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
        tempoWholesPerMinute = #(ly:make-moment 100 4)
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
  }
}
% }}}
