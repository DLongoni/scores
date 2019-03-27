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
  r2 r8. \appoggiatura cis16 d16~ d16 b a g | fis d e8~ e2 r4 | 
  r8. d'16 r16 c bes d, f a g f e d c b | bes d a aes g d' bes d' r2 |
  r4 r16 a'16 r16 g f8 a16 c,16~ c16 f a,8 | c16 f,8 a16 d,8 r8 r2|
  r8. f'16 e'8 d16 a16~ a16 f8 g16~ g16 f8 aes16 | g16 f e d c aes g e f d e f a c e a, |
  b d c e, r8. e16 c b a d b c e g | b r a e r4 r16 e a b c d e g |
  gis2 b16 gis16 a8~ a16 e r d | c d e c b a gis e g e fis e ees des c r |  
  r2 r16 d f aes c ees g bes | g ees c bes r a aes f' aes bes32 aes g16 ges f ees d ces |
  bes aes b d f aes \tuplet 3/2 {bes d g} f8. ees16 d c bes g | f ees d c bes aes g f ees c8. c8 r16 ees''32 d|
  ees,8 b'16 c, r aes'32 g a,8 r16 f'16 ges,8  d'16 ees,8 c'16 | des,8. aes'16 b,8 e4. r4|
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
            tempoWholesPerMinute = #(ly:make-moment 120 4)
          }
        }
      }
    }

  % }}}
