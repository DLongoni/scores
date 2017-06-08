% DEFINIZIONI {{{
\version "2.18.2"

\header {
  title = "Hora din Maurodin"
  composer = "Romanian Traditional"
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
  \key d \major
  \numericTimeSignature
  \time 2/4
  \set Score.markFormatter = #format-mark-box-alphabet
}
%}}}


tema = {
  \mark \default
  \repeat volta 2 {
    gis16~ a fis d a d fis d |
    fis~ g e cis a cis a cis |
    a b cis dis e fis g e |
  }
  \alternative{
    {fis16~ g e cis d fis a a,}
    {d8 r r4}
  }\bar"||" \break

  \mark \default
  \acciaccatura{ais'16 cis}b2 |
  \acciaccatura{ais16 cis}b2 |
  \acciaccatura{ais16 cis}b2 |
  \acciaccatura{ais16 cis}b2 |
  b8. a16 d c b a | b8. a16 g8 g16 fis |
  fis g e8 e4 | e4. a,8 | \bar"||" \break

  \mark \default
  \repeat volta 2{
    d16 e fis g a8 g |
    fis8. e16 d8 cis |
    cis d16 c d e fis cis |
    d4 a' |
    d,16 e fis g a8 g |
    fis8. e16 d8 cis |
    b b16 ais b cis d cis |
  }
  \alternative{
    { b4 b8 a | }
    {b4. r8 |}
  }\bar"||" \break

  \mark \default
  \repeat volta 2{
    fis'16 g g e e dis e fis |
    e bes' g fis e d cis b |
    cis d d cis cis b cis d |
    b cis d e fis8 b |
    fis16 g g e e dis e fis |
    e bes' g fis e d cis b |
    cis d d cis cis b cis d |
  }
  \alternative{
    { b fis gis ais b8 r| }
    { b8 fis' g gis | }
  }\bar"||" \break

  \acciaccatura{gis8} a2 |
  \acciaccatura{gis8} a2 |
  \acciaccatura{gis8} a2 |
  \acciaccatura{gis8} a4 r8 a, |
  }\bar"|."

}

accordi = \chordmode{
  \set chordChanges = ##t
  \repeat volta 2{
    d2 | a2 | a2 | 
  }
  \alternative{
    {a4 d4}
    {\once \set chordChanges = ##f d2}
  }

  g2 | g2 | g2:dim7 | g2:dim7 | 
  d2 | d2 | a2 | a2 |

  \repeat volta 2{
    d2 | a2 | d2 | d2 | d2 | fis2 | b2:m | 
  }
  \alternative{
    {b2:m |}
    {b2:m |}
  }

  \repeat volta 2{
    e2:m | e2:m | fis2 | b2:m | e2:m | e2:m | fis |
  }
  \alternative{
    {b2:m |}
    {b2:m |}
  }

  d2 | d2 | d2 | d2 |

}

% SCORE {{{
tema = \relative c'' {
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
