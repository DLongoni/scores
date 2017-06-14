% {{{ PARAMETRI
  myTitle = "Kopanitsa"
  mySubTitle = "Bulgarian Traditional"
  myKey = \key c \major
  myTime = \time #'(2 2 3 2 2) 11/8
  myTempo =  #(ly:make-moment 190 4)
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
%}}}

% PARTE A {{{
temaA = {
  \repeat volta 2 {
    a8 bes cis d d d4 d d | d8 e d e, cis'4.\prall bes8 a g4 | a8 bes cis d cis bes bes cis4\prall bes8 cis|\break
    bes4\prall a4 a4.\prall bes8 a g4 | a8 bes cis d cis bes bes cis4\prall bes8 cis | bes4\prall a a4.\prall a4\prall a8 g|
  }
}

accordiA = \chordmode{
  \set chordChanges = ##t
  \repeat volta 2{
    a2 d4.:m d2:m | d2:m g4.:m g2:m | g1*11/8:m |
    g2:m a4. a2 | g1*11/8:m | g2:m a4. a2 |
  }
}
% }}}

% PARTE B {{{
temaB = {
  \repeat volta 2 {
    cis8 d d cis bes cis4\prall bes8 a bes8 g | cis8 g d' cis bes cis4\prall bes8 a bes g | 
    cis8 e d cis bes cis4\prall bes8 a bes cis | bes4\prall a a4.\prall a4 a8 g |
  }
}

accordiB = \chordmode{
  \set chordChanges = ##t
  \repeat volta 2{
    g1*11/8:m | g1*11/8:m | g1*11/8:m | g2:m a4. a2 |
  }
}
% }}}

% PARTE C {{{
temaC = {
  \repeat volta 2 {
    g8 a~\prall a a d cis bes a g fis e | g8 a\prall~ a a d cis bes a a e' e, |
    a8 e g a d cis bes a g fis e | g8 a~\prall a a d cis bes a4 a8 e |
  }
}

accordiC = \chordmode{
  \set chordChanges = ##t
  \repeat volta 2{
    a1*11/8 | a1*11/8 | a1*11/8 | g2:m g4.:m a2 |
  }
}
% }}}

% PARTE D {{{
temaD = {
  \repeat volta 2 {
    c'8 d~ d b c4 b8~ b b d g, | c8 d~ d b c4 b8 b g a g |
    c8 d~ d b c4 b8~ b b d g, | c8 d~ d b c4 b8 b g a g |
  }
}

accordiD = \chordmode{
  \set chordChanges = ##t
  \repeat volta 2{
    g1*11/8 | g2 g4. g4 d4 |
    g1*11/8 | g2 g4. g4 d4 |
  }
}
% }}}

% PARTE E {{{
temaE = {
  \repeat volta 2 {
    c8 g b4 c4 b8 b4 d8 g, | c8 g b4 c4 b8 b g a g |
    c8 g b4 c4 b8 b4 d8 g, | c8 g b4 c4 b8 b g a g |
  }
}

accordiE = \chordmode{
  \set chordChanges = ##t
  \repeat volta 2{
    g1*11/8 | g2 g4. g4 d4 |
    g1*11/8 | g2 g4. g4 d4 |
  }
}
% }}}

% PARTE F {{{
temaF = {
  \repeat volta 2 {
    c'8 b8~ b g a4 g8 a b c g | c b~ b g d'4 e8 c4 c8 g |
    c8 b8~ b g a4 g8 a b c g | c b~ b g a d4 a a8 g |
  }
}

accordiF = \chordmode{
  \set chordChanges = ##t
  \repeat volta 2{
    g1*11/8 | g2 g4. c2 |
    g1*11/8 | d2:m a4.:m a2:m |
  }
}
% }}}

% PARTE G {{{
temaG = {
  \repeat volta 2 {
    c8 d~ d e e4 d8 d4 c4 | c8 d~ d e e4 e,8 d'4~ d8 c | c8 d~ d e e4 d8 d4 a4 | c8 bes a4 a4 a8 a4 a8 g |
  }
}

accordiG = \chordmode{
  \set chordChanges = ##t
  \repeat volta 2{
    c1*11/8 | c1*11/8 |
    c1*11/8 | d2:m a4.:m a2:m |
  }
}
% }}}

% PARTE H {{{
temaH = {
  \repeat volta 2 {
    a8 b c d d4 c8~ c b~ b g | a b c d e b4 g g8 e | a b c d d4 c8~ c b~ b g | c8 bes a4 a8 d4 a a8 g |
  }
}

accordiH = \chordmode{
  \set chordChanges = ##t
  \repeat volta 2{
    a2:m g4. g2 | g1*11/8 |
    g1*11/8 | d2:m a4.:m a2:m |
  }
}
% }}}

% PARTE I {{{
temaI = {
  \repeat volta 2 {
    cis'8 d e r e d cis bes a e' a, | cis d e r e d cis bes a a e |
    cis'8 d e r e d cis bes a e' a, | cis d e r e d cis bes a a4 |
  }
}

accordiI = \chordmode{
  \set chordChanges = ##t
  \repeat volta 2{
    a1*11/8 | a2 g4.:m g4 a4 |
    a1*11/8 | a2 g4.:m g4 a4 |
  }
}
% }}}

% PARTE J {{{
temaJ = {
  \repeat volta 2 {
    g8 a a a cis d e d cis bes a | a e g g d' cis bes a a e' e, | 
    g8 a a a cis d e d cis bes a | a e g g d' cis bes a a a4 |
  }
}

accordiJ = \chordmode{
  \set chordChanges = ##t
  \repeat volta 2{
    a1*11/8 | a1*11/8 | 
    a1*11/8 | a2 g4.:m g4 a4 |
  }
}
% }}}

% PARTE K {{{
temaK = {
  \repeat volta 2 {
    a8 e g g d' cis bes a a e' e, | a e g g d' cis bes a a a e |
    a8 e g g d' cis bes a a e' e, | a e g g d' cis bes a a a4 |
  }
}

accordiK = \chordmode{
  \set chordChanges = ##t
  \repeat volta 2{
    a2 g4.:m g4 a4 | a2 g4.:m g4 a4 |
    a2 g4.:m g4 a4 | a2 g4.:m g4 a4 |
  }
}
% }}}

% PARTE L {{{
temaL = {
  \repeat volta 2 {
    dis8 a c c dis c b b a b c | dis a c c dis c b b a b fis |
    dis'8 a c c dis c b b a b c | dis a c c dis c b b a b4 |
  }
}

accordiL = \chordmode{
  \set chordChanges = ##t
  \repeat volta 2{
    b1*11/8 | b2 a4.:m b2 |
    b1*11/8 | b2 a4.:m b2 |
  }
}
% }}}

% LYRICS {{{
testoCompleto=\markup { }
% }}}

% SCORE {{{
tema = \relative c' {
  \global 
  \mark \markup{ \box \bold{A} }
  \temaA
  \break
  \mark \markup{ \box \bold{B} }
  \temaB
  \break
  \mark \markup{ \box \bold{C} }
  \temaC
  \break
  \mark \markup{ \box \bold{D} }
  \temaD
  \break
  \mark \markup{ \box \bold{E} }
  \temaE
  \break
  \mark \markup{ \box \bold{C2} }
  \temaC
  \break
  \mark \markup{ \box \bold{F} }
  \temaF
  \break
  \mark \markup{ \box \bold{G} }
  \temaG
  \break
  \mark \markup{ \box \bold{H} }
  \temaH
  \break
  \mark \markup{ \box \bold{G2} }
  \temaG
  \break
  \mark \markup{ \box \bold{H2} }
  \temaH
  \break
  \mark \markup{ \box \bold{F2} }
  \relative c{\temaF}
  \break
  \mark \markup{ \box \bold{C3} }
  \temaC
  \break
  \mark \markup{ \box \bold{I} }
  \temaI
  \break
  \mark \markup{ \box \bold{J} }
  \temaJ
  \break
  \mark \markup{ \box \bold{K} }
  \temaK
  \break
  \mark \markup{ \box \bold{L} }
  \temaL
  \break
  \bar "|."
}

chordsPart ={
  \new ChordNames {
    \accordiA
    \accordiB
    \accordiC
    \accordiD
    \accordiE
    \accordiC
    \accordiF
    \accordiG
    \accordiH
    \accordiG
    \accordiH
    \accordiF
    \accordiC
    \accordiI
    \accordiJ
    \accordiK
    \accordiL
  }
}

temaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \tema }

scoreContent = << 
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
