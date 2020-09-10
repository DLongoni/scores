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
  <e, g c>2. | <e g b> | <d g a> | <e aes c> |
  <e g c> | <e g bes> | < d f bes> | <d f a> | \break
  <cis e> | <d fis> | <e g> | <fis b> |
  <c f a>~ | <c f a> | <c e a>~ | <c e a> |
  <c e a> | \time 2/4 <c f a>4 <c f b> | \time 3/4 <c e a>2. | r2. |
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

silenzioA = {
    s2. | s2. | s2. | s2. |
    s2. | s2. | s2. | s2. |
    s2. | s2. | s2. | s2. |
    s2. | s2. | s2. | s2. |
    s2. | s2 |  s2. | s2. |
}
% }}}

% PARTE B {{{
armB = {
  \time 3/4 <g' c e>2.~ | <g c e> | <a c e>~ | \time 2/4 <a c e>4 <a c f>4 | 
  \time 3/4 <b c g'>2.~ | <b c g'> | <a b e>~ | <a b e> | \break \bar "||"
  \mark "B Alternativa"
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

silenzioB = {
  \repeat volta 2{
    \time 3/4 s2. | s2. | s2. | \time 2/4 s2 |
    \time 3/4 s2. | s2. | s2. | s2. |
  }
}
% }}}

% PARTE B2 {{{
armBdue = {
  r8 <e a c>8 r4 <e g c> | r8 <e a c>8 r4 <e g c> |
  r8 <d fis a> r4 <d fis b> | \time 2/4 <d fis a>2 |
  r4. <c e a>4 r8 | <c e a> r <c e a>2 |
  r4. <d fis a>4 r8 | <d fis a> r <d fis a>2 |

}

accordiBdue = \chordmode{
  \set chordChanges = ##t
  \time 3/4 a2.:m7 | a2.:m7 | d2.:7 | \time 2/4 d2:7 |
  \time 3/4
  a2.:m7 | a2.:m7 |
  g2.:6 | g2.:6 |
}

bassoBdue = { 
  \time 3/4 a,4 r8 c8~ c4 | a r8 c8~ c4 | d r8 c8~ c4 | \time 2/4 d g, |
  \time 3/4 a4. r4 a8 | r4 a2 | g4. r4 g8 | r4 g2 |
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
  \mark \markup{ \box \bold{B2} }
  \armBdue
  \break
  \mark \markup { \musicglyph #"scripts.coda"}
  \armCoda
  \bar"|."
}

bass = \relative c' {
  \silenzioA
  \silenzioB
  \bassoBdue
}

chordsPart ={
  \new ChordNames {
    \accordiA
    \accordiB
    \accordiBdue
    \accordiCoda
  }
}

armPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
  shortInstrumentName = "T"
} { \clef "treble_8" \arm }

bassPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "bass"
  shortInstrumentName = "B"
} { \clef "bass" \bass }

scoreC = <<
      \chordsPart
      \armPart
      \bassPart
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
