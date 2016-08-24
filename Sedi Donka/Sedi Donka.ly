\version "2.18.2"

\header {
  title = "Sedi Donka"
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
  \key f \major
  \numericTimeSignature
  \time #'(3 2 2) 7/8
  \set Score.markFormatter = #format-mark-box-alphabet
}

struttura = \markup {
  \column {
    \line {
      Struttura: \bold{A}(f)
    }
    \line {
      % linea2
    }
  }
}

%%% PARTE A
temaA={
  \time #'(3 2 2) 7/8
  a8 c, f a bes16 a g8 f| g c, e g a16 g f8 e |
  \time #'(2 2 3 2 2) 11/8
  d e c a c d e f4 f|
  \time #'(3 2 2) 7/8
  a8 c, f a bes16 a g8 f| g c, e g a16 g f8 e |
  \time #'(2 2 3 2 2) 11/8
  d e c a c d e d4 d|
}

accordiA=\chordmode{
  \set chordChanges = ##t
  \time #'(3 2 2) 7/8
  f4. f2| c4. c2|
  \time #'(2 2 3 2 2) 11/8
  c2 c4. f2:|
  \time #'(3 2 2) 7/8
  f4. f2| c4. c2|
  \time #'(2 2 3 2 2) 11/8
  c2 c4. g2|
}

bassoAintro={
  \time #'(3 2 2) 7/8
  f,4. fis2| g4. a2|
  \time #'(2 2 3 2 2) 11/8
  g2 ges4. f4 f|
  \time #'(3 2 2) 7/8
  f4. fis2| g4. a2|
  \time #'(2 2 3 2 2) 11/8
  a2 aes4. g4 g|
}

bassoA={
  \time #'(3 2 2) 7/8
  f4 a8 f4 c| c4 e8 c4 g'4|
  \time #'(2 2 3 2 2) 11/8
  c4 e c g8 f4 f|
  \time #'(3 2 2) 7/8
  f4 a8 f4 c| c4 e8 c4 g'4|
  \time #'(2 2 3 2 2) 11/8
  c4 e c e,8 g4 g|
}

fisaA={

}

%%% PARTE B
temaB={
  \time #'(3 2 2) 7/8
  d,8 e c e f16 e d8 c| e f c g' a16 g f8 e |
  \time #'(2 2 3 2 2) 11/8
  d e c a c d e f4 f|
  \time #'(3 2 2) 7/8
  d8 e c e f16 e d8 c| e f c g' a16 g f8 e |
  \time #'(2 2 3 2 2) 11/8
  d e c a c d e d4 d|
}

accordiB=\chordmode{
  \set chordChanges = ##t
  \time #'(3 2 2) 7/8
  c4. c2| c4. c2|
  \time #'(2 2 3 2 2) 11/8
  c2 c4. f4 f|
  \time #'(3 2 2) 7/8
  c4. c2| c4. c2|
  \time #'(2 2 3 2 2) 11/8
  c2 c4. g2|
}

bassoBintro={
  \time #'(3 2 2) 7/8
  c4. b2| bes4. a2|
  \time #'(2 2 3 2 2) 11/8
  g2 ges4. f4 f|
  \time #'(3 2 2) 7/8
  c'4. b2| bes4. a2|
  \time #'(2 2 3 2 2) 11/8
  a2 aes4. g4 g|
}

trombaBintro={
  R1*2*7/8|
  \time #'(2 2 3 2 2) 11/8
  R1*11/8|
  \time #'(3 2 2) 7/8
  R1*2*7/8|
  \time #'(2 2 3 2 2) 11/8
  r2 r4. g'4\f g\f
}

clarinoBintro={
  R1*2*7/8|
  \time #'(2 2 3 2 2) 11/8
  R1*11/8|
  \time #'(3 2 2) 7/8
  R1*2*7/8|
  \time #'(2 2 3 2 2) 11/8
  r2 r4. d4\f d\f
}

fisaBintro={
  \time #'(3 2 2) 7/8
  c4. b2| bes4. a2|
  \time #'(2 2 3 2 2) 11/8
  g2 ges4. f4 f|
  \time #'(3 2 2) 7/8
  c'4. b2| bes4. a2|
  \time #'(2 2 3 2 2) 11/8
  a2 aes4. g4\f g\f|
}

%%% PARTE C
temaC={
  \time #'(3 2 2) 7/8
  fis' 8 ees c d16 ees d c d4 | ees 8 fis c d16 ees ees d d4 |
  \time #'(2 2 3 2 2) 11/8
  d8 ees fis g a bes g a16 bes a g a4|
  \time #'(3 2 2) 7/8
  fis 8 ees c d16 ees d c d4 | fis 8 ees c d16 ees ees d d4 |
  \time #'(2 2 3 2 2) 11/8
  g8 fis ees d c ees c d4 d|
}

temaCdue={
  \time #'(3 2 2) 7/8
  a8 fis ees fis g fis4| fis8 a ees fis g fis4|
  \time #'(2 2 3 2 2) 11/8
  fis8 g a bes c d bes c16 d c bes a4|
  \time #'(3 2 2) 7/8
  a8 fis ees fis g fis4| fis8 a ees fis g fis4|
  \time #'(2 2 3 2 2) 11/8
  bes8 a g fis ees g ees fis4 fis|
}

accordiC=\chordmode{
  \set chordChanges = ##t
  \time #'(3 2 2) 7/8
  d4. d2| d4. d2|
  \time #'(2 2 3 2 2) 11/8
  d2 ees4. d2|
  \time #'(3 2 2) 7/8
  d4. d2| d4. d2|
  \time #'(2 2 3 2 2) 11/8
  d2 ees4. d2|
}

bassoCcinque={
  \time #'(3 2 2) 7/8
  d4. r4 d4 | r4. d4 r4|
  \time #'(2 2 3 2 2) 11/8
  r8 d4. r4 d4. r4|
  \time #'(3 2 2) 7/8
  d4. r4 d4 | r4. d4 r4|
  \time #'(2 2 3 2 2) 11/8
  r8 d4. ees4 ees8 d4 d|
}

accordionCcinque=\chordmode{
  \time #'(3 2 2) 7/8
  d4. r4 d4 | r4. d4 r4|
  \time #'(2 2 3 2 2) 11/8
  r8 d4. r4 d4. r4|
  \time #'(3 2 2) 7/8
  d4. r4 d4 | r4. d4 r4|
  \time #'(2 2 3 2 2) 11/8
  r8 d4. ees4 ees8 d4 d|
}

trombaCcinque={
  \time #'(3 2 2) 7/8
  d4.~\p\< d2~ | d4.~ d2~ |
  \time #'(2 2 3 2 2) 11/8
  d8~ d8-.\f r4 ees8-.\f r4 r2|
  \time #'(3 2 2) 7/8
  d4.~\p\< d2~ | d4.~ d2~ |
  \time #'(2 2 3 2 2) 11/8
  d8~ d8-.\f r4 ees8 r ees d4-. r4|
}

clarinoCcinque={
  \time #'(3 2 2) 7/8
  a'4.~\p\< a2~ | a4.~ a2~ |
  \time #'(2 2 3 2 2) 11/8
  a8~ a8-.\f r4 bes8-.\f r4 r2|
  \time #'(3 2 2) 7/8
  a4.~\p\< a2~ | a4.~ a2~ |
  \time #'(2 2 3 2 2) 11/8
  a8~ a8-.\f r4 bes8 r bes a4-. r4|
}

%%% PARTE D

temaD={
  \time #'(3 2 2) 7/8
  c,8 d c c bes a g| bes c bes a g fis g|
  \time #'(2 2 3 2 2) 11/8
  a bes \tuplet 3/2 {a16 bes a} g8 a a g fis g a4|
  \time #'(3 2 2) 7/8
  c8 d c c bes a g| bes c bes a g fis g|
  \time #'(2 2 3 2 2) 11/8
  a8 a g fis g fis ees  d4 d|
}

temaDdue={
  \time #'(3 2 2) 7/8
  ees'8 f ees ees d c bes| d ees d d c bes a|
  \time #'(2 2 3 2 2) 11/8
  c d \tuplet 3/2 {c16 d c} bes8 c c bes a bes c4|
  \time #'(3 2 2) 7/8
  ees8 f ees ees d c bes| d ees d d c bes a|
  \time #'(2 2 3 2 2) 11/8
  c c bes a bes a g fis4 fis|
}

accordiD=\chordmode{
  \set chordChanges = ##t
  \time #'(3 2 2) 7/8
  c4.:m c2:m| g4.:m g2:m|
  \time #'(2 2 3 2 2) 11/8
  d2 c4.:m d2|
  \time #'(3 2 2) 7/8
  c4.:m c2:m| g4.:m g2:m|
  \time #'(2 2 3 2 2) 11/8
  d2 c4.:m d2|
}

%%% MAIN

pausa = {
  R1*2*7/8|
  \time #'(2 2 3 2 2) 11/8
  R1*11/8|
  \time #'(3 2 2) 7/8
  R1*2*7/8|
  \time #'(2 2 3 2 2) 11/8
  R1*11/8|
}

clarinet = \relative c'' {
  %\transposition bes
  \global
  \pausa
  \clarinoBintro
  \clarinoCcinque
  \temaA
  
}

trumpetBb = \relative c'' {
  %\transposition bes
  \global
  \pausa
  \trombaBintro
  \trombaCcinque  
}

accordion = \relative c'' {
  \global
  \pausa
  \fisaBintro
  \accordionCcinque
  \fisaA
}

guitar = \relative c'' {
  \global
  \mark \markup{ \box \bold{A1} }
  \temaA
  \mark \markup{ \box \bold{B1} }
  \temaB
  \mark \markup{ \box \bold{C1} }
  \temaC
  \mark \markup{ \box \bold{A2} }
  \accordiA
}

contrabass = \relative c {
  \global
  \bassoAintro
  \bassoBintro
  \bassoCcinque
  \bassoA
}

chordsPart ={
  \new ChordNames {
    \accordiA
    \accordiB
    \accordiC
    \accordiA
  }
}

accordionPart = \new Staff \with {
  instrumentName = "Accordion"
  midiInstrument = "piano"
} \accordion

clarinetPart = \new Staff \with {
  instrumentName = "Clarinet"
  midiInstrument = "clarinet"
} \clarinet

trumpetPart =  \new Staff \with {
  instrumentName = "Trumpet"
  midiInstrument = "trumpet"
} \trumpetBb

guitarPart = \new Staff \with {
  instrumentName = "Guitar"
  midiInstrument = "guitar"
} { \clef "treble_8" \guitar }

contrabassPart = \new Staff \with {
  instrumentName = "Contrabass"
  midiInstrument = "tuba"
} { \clef bass \contrabass }

\book{
  \bookOutputSuffix "Score"
  \struttura
  \score {
    <<
      \chordsPart
      \clarinetPart
      \trumpetPart
      \accordionPart
      \guitarPart
      \contrabassPart
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

%{
  \book{
  \bookOutputSuffix "ClTr"
  \struttura
  \score {
  <<
  \transpose c d { \chordsPart }
  \transpose c d { \clarinetPart}
  \transpose c d { \trumpetPart}
  >>
  }
  }

  \book{
  \bookOutputSuffix "Basso"
  \struttura
  \score {
  <<
  \chordsPart
  \clarinetPart
  \trumpetPart
  \contrabassPart
  >>
  }
  }

  \book{
  \bookOutputSuffix "GuitAcc"
  \struttura
  \score {
  <<
  \chordsPart
  \clarinetPart
  \accordionPart
  \guitarPart
  >>
  }
  }
%}