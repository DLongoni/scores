% DEFINIZIONI {{{
\version "2.18.2"

\header {
  title = "The Beauty I Don't See - Armonia"
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
  \key a \minor
  \numericTimeSignature
  \time 3/4
  \set Score.markFormatter = #format-mark-box-alphabet
}

\layout {
  \context { 
    \Staff \RemoveEmptyStaves 
    \override VerticalAxisGroup.remove-first = ##t
  }
}


toCoda = {
  % the align part
  \once \override Score.RehearsalMark.self-alignment-X = #RIGHT  
  \once \override Score.RehearsalMark.break-visibility = #begin-of-line-invisible
  \mark \markup { { \lower #1 "al  " { \musicglyph #"scripts.coda"} } } 
}

  struttura = \markup {
    \column {
        \line {\bold{Intro}, \bold{A} Fisa, \bold{A} Tr, \bold{B} Fisa, 
               \bold{B} Gtr, \bold{A} Tr}
        \line{\bold{Solo} Gtr su B, \bold{B}, \bold{Solo} Tr su B, 
              \bold{B2}x2, \bold{A}, \bold{Coda}}
      }
    }
%}}}

% PARTE A {{{
armA = {
  <e, g c>2. | <e g b> | <f b c> | <e bes' c> |
  <e g c> | <e g bes> | < d f bes> | <d f a> | \break
  <cis e> | <d fis> | <e g> | <fis b> |
  <c f a>~ | <c f a> | <c e a>~ | <c e a> |
  <c e a> | \time 2/4 <c f a>4 <c f gis> | \time 3/4 <c e a>2. | r2. |
}

accordiA = \chordmode{
  \set chordChanges = ##t
    a2.:m | g2.:13 f2.:maj7 | bes2.:7.11+ |
    a2.:m | c2.:7 | bes2.:maj7 | f2.:maj7 |
    a2.:7 | b2.:m7 | c2.:maj7 | g2.:6 |
    d2.:m7 | d2.:m7 | c2.:maj7 | c2.:maj7/b |
    a2.:m |
    \time 2/4
    f4 e4:7.9- |
    \time 3/4
    a2.:m | a2.:m |
}
% }}}

% PARTE B {{{
armB = {
  \time 3/4 <g' c e>2.~ | <g c e> | <a c e>~ | \time 2/4 <a c e>4 <a c f>4 | 
  \time 3/4 <b c g'>2.~ | <b c g'> | <a b e>~ | <a b e> | \break \bar "||"
  \time 3/4 <g c e>2.~ | <g c e> | <a c e>~ | \time 2/4 <a c e>4 <a c f>4 | 
  \time 3/4 <g c g'>2.~ | <g c g'> | <e b' e>~ | <e b' e> | \break \bar "||"
}

accordiB = \chordmode{
  \set chordChanges = ##t
  \time 3/4
  a2.:m7 | a2.:m7 | f2.:maj7 |
  \time 2/4 f2:maj7 |
  \time 3/4
  a2.:m7 | a2.:m7 | g2.:6 | g2.:6 |
  \time 3/4
  a2.:m7 | a2.:m7 | f2.:maj7 |
  \time 2/4 f2:maj7 |
  \time 3/4
  a2.:m7 | a2.:m7 | g2.:6 | g2.:6 |
}
% }}}

% CODA {{{
armCoda = {
  \time 4/4 <c e a>2. <d e b'>4 | \time 3/4 <c e a>2.~ | <c e a> | <c ees g>2.~ | <c ees g> |
  <c ees g>2. | \time 2/4 <c ees ges>4 <b ees f>4 | <c ees g>2 |
}

accordiCoda = \chordmode{
  \set chordChanges = ##t
  \time 4/4 a2.:m7  g4:13 | \time 3/4 f2.:maj7 | f2.:maj7 | aes2.:maj7 | aes2.:maj7 | 
  c2.:m7 | \time 2/4 aes4 g4:7 | c2:m7 |
}
% }}}

% SCORE {{{
arm = \relative c' {
  \global 
  \mark \default
  \armA
  \break
  \mark \default
  \armB
  \break
  \mark \markup { \musicglyph #"scripts.coda"}
  \armCoda
  \bar"|."
}

chordsPart ={
  \new ChordNames {
    \accordiA
    \accordiB
    \accordiCoda
  }
}

armPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
  shortInstrumentName = "T"
} { \clef "treble_8" \arm }

scoreC = <<
      \chordsPart
      \armPart
    >>

\book{
  \bookOutputSuffix "C"
  \header{ composer="C" }
  \score {
    \scoreC
    \layout {
      indent = #0
    }
  }
}
% }}}
