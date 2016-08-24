\version "2.18.2"

\header {
  title = "Gankino Horo"
    composer = "Bulgarian Traditional"
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
  \key c \major
    \numericTimeSignature
    \time #'(2 2 3 2 2) 11/8
    \set Score.markFormatter = #format-mark-box-alphabet
}

temaA = {
  \repeat volta 2 {
    d4 \slashedGrace c8 d'4 d d8 d c b a |
      c b a gis gis f a gis4 f8 e |
      d4 e8 f f d a' gis4 f8 a|
      gis4 f8 e e d f e4 e| 
  }
}

temaB = {
  \repeat volta 2 {
      d4 e8 f f d a' gis4 f8 e|
      d4 d'8 d d c b a g f e |
      d4 e8 f f d a' gis4 f8 a|
      gis4 f8 e e d f e4 e| 
  }
}

tema = \relative c {
  \global 
  \temaA
  \temaB
}

temaPart = \new Staff \with {
  instrumentName = "Guitar"
  midiInstrument = "guitar"
} { \clef "treble_8" \tema }

\book{
  \bookOutputSuffix "Score"
  \score {
    <<
      \temaPart
    >>
    \layout {
    }
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 120 4)
      }
    }
  }
}
