% DEFINIZIONI {{{
\version "2.18.2"

\header {
  title = "Zemer Atik"
  composer = "Israel"
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
  \time 4/4
  \set Score.markFormatter = #format-mark-box-alphabet
}
%}}}

tema = {
  cis8 d e f e d cis bes  | a4 e8 e a4 r | \bar "||"

  \break
  \repeat volta 2{
    cis8 d bes cis d e cis d | e2. r4 | e8 f g a g f e d | e2. r4 | \break
    e8 a a g g f f e | d4 e cis2 | cis8 d bes cis d e cis bes | a2. r4 | \break
    a'2 a2 | g8 a g f g4 e | f2. e8 d | e4 a e a, | \break
    a'2 a2 | g8 a g f g4 e | d8 e f d e f e cis | d2. r4 | \break
  }
}

accordi = \chordmode{
  \set chordChanges = ##t
  a1 | a4 e4:7 a2 |
  \repeat volta 2{
    a1 | a1 | g1:m | a1 |
    a1 | d2:m a2 | g1:m | a1 |
    f1 | c2 c4 a4:7 | d1:m | a1 |
    f1 | c1 | d2:m a2 | d1:m |
  }
}

% LYRICS {{{
testoCompleto=\markup {
  \vspace #2
  \fill-line {
    \hspace #1
    \column {
      \line {Od nashuva el nigun atik}
      \line {vehazemer yif veye'erav.}
      \line {Od gavia meshumar nashik, nashik,}
      \line {alizei einayim ulevav.}
      \vspace #1
      \line {Tovu, tovu ohaleinu}
      \line {ki machol hiftsi'a.}
      \line {Tovu, tovu ohaleinu,}
      \line {od nashuva el nigun atik.}
    }
    \hspace #2
    \column \italic {
      \line{We will return again to an ancient melody}
      \line{and the song will linger on.}
      \line{When we raise our glasses together}
      \line{our eyes and hearts will be bright.}
      \vspace #1
      \line{How good are our tents}
      \line{because there's dancing there.}
      \line{How good are our tents,}
      \line{still we return to an ancient melody.}
    }
    \hspace #1
  }
}
% }}}

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
      indent = #0
    }
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 100 4)
      }
    }
  }
  \testoCompleto
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
  \testoCompleto
}
% }}}
