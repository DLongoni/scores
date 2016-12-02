% INITIALIZATION {{{
\version "2.18.2"

\header {
  title = "500 Miles High"
  composer = "As played by Bireli Lagrene"
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
% }}}

% TEMA {{{
accordi=\chordmode{
  e1:m7 | e1:m7 | g1:m7 | g1:m7 | \break
  bes1:maj7 | bes1:maj7 | b1:m7.5- | e1:7.9+ |\break
  a1:m7 | a1:m7 | fis1:m7.5- | fis1:m7.5- |\break
  f1:m7 | f1:m7 | c1:m11 | c1:m11 |
  b1:7.5+.9+ | b1:7.5+.9+ |\break
}

soloBireli={
  r2 r8. r8. \appoggiatura cis16 d16~ d16 b a g | fis d e8~ e2 r4 | 
  r8. d16 r16 c bes d, f a g f ees d c b | bes d a aes g d' bes d' r2 |
  r2 r16 a'16 r16 g | f8 a16 c,16~ c16 f a8 c16 f,8 a16 d8 r8 r2|
 R1*12
}
  % }}}

  % MAIN {{{
  solo = \relative c' {
    \global
    \soloBireli
  }

  chordsPart ={
    \new ChordNames {
      \accordi
    }}

    guitarPart = \new Staff \with {
      instrumentName = "Bireli"
      shortInstrumentName = #"B"
      midiInstrument = "guitar"
    } { \clef "treble_8" \solo }
  %}}}

  % {{{ BOOKS
    \book{
      \bookOutputSuffix "Score"
      \score {
        <<
          \chordsPart
          \guitarPart
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

  % }}}
