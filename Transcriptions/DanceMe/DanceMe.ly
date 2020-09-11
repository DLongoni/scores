% {{{ PARAMETRI
  myTitle = "Dance Me to the End of Love"
  myKey = \key bes \major
  myTime = \time 4/4 
  myTempo =  #(ly:make-moment 190 4)

  struttura = \markup {
    \column {
        \line {\bold{A}, 
        \bold{B}, 
        \bold{C},
        \bold{B}, 
        \bold{C},
        \bold{A},
        \bold{B}1x
      }
    }
  }
% }}}

% INTESTAZIONE {{{
\version "2.18.2"

\header {
  title = \myTitle
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
\layout {
  indent = #0
  \context { 
    \Staff \RemoveEmptyStaves 
    \override VerticalAxisGroup.remove-first = ##t
  }
}

toCoda = {
  % the align part
  \mark \markup { { \lower #1 "al  " { \musicglyph #"scripts.coda"} } } 
}
%}}}

% {{{ PARTE A
  temaA = {
    \repeat volta 2 {
      <d f>4 <c ees>2. | <d f>4 <c ees>4 <d f> <c ees> |
      <c ees> <bes d>2.| <c ees>4 <bes d> <c ees> <bes d> |
      <bes d> <a c>2. | <bes d>2 <a c> |
      <g bes>1 | r1 |
    } 
  }

  accordiA = \chordmode{
    \repeat volta 2{
      c1:m | c1:m | g1:m | g1:m |
      d1:7 | d1:7 | g1:m | g1:m |
    }
  }
  
  silenzioA =  {
    \repeat volta 2 {
      s1 | s1 | s1 |s1 |
      s1 | s1 | s1 |s1 |
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    \repeat volta 2 {
      f'4 ees ees ees | f8 f~ f4 ees8 ees8~ ees4 | d d d cis | d2 r2 | \break
      f4 ees ees ees | g8 g8~g4 r8 ees ees4 | ees d d cis | d2 r2 | \break
      f4 ees ees ees8 f8~ | f4 ees8 f8~ f4 ees4 | ees d ees d | ees4 r4 r2 | \break
      d4 c r c8 c | d2 ees | d1 | r1 | \break
      d4 c r c8 c | d2. fis,4 | 
    } 
    \alternative{
      { g1 | r1 | }
      { g4 g' g g | a g a g | }
    }
  }

  temaBdue = {
    \repeat volta 2 {
      d4 c c c | d8 d~ d4 c8 c8~ c4 | bes bes bes a | bes2 r2 | \break
      d4 c c c | ees8 ees8~ees4 r8 c c4 | c bes bes a | bes2 r2 | \break
      d4 c c c8 d8~ | d4 c8 d8~ d4 c4 | c bes c bes | c4 r4 r2 | \break
      bes4 a r a8 a | bes2 c | bes1 | r1 | \break
      bes4 a r a8 a | bes2. a4 | 
    } 
    \alternative{
      { g1 | r1 | }
      { g4 bes bes bes | c bes c bes |}
    }
  }

  accordiB = \chordmode{
    \repeat volta 2{
      c1:m | c1:m | g1:m | g1:m |
      c1:m | c1:m | g1:m | g1:m |
      c1:m | c1:m | g1:m | g1:m |
      d1:7 | d1:7 | g1:m | g1:m |
      d1:7 | d1:7 | 
    }
    \alternative{
      { g1:m | g1:m | }
      { g1:m | g1:m | }
    }
  }
% }}}

% {{{ PARTE C
  temaC = {
    r4 f' f f | g f g f | r4 g g g | a g a g |
    r4 f f f | g f g f | r4 g g g | g1 |
  }

  temaCdue = {
    r4 a, a a | bes a bes a | r4 bes bes bes | c bes c bes |
    r4 a a a | bes a bes a | r4 bes bes bes | bes1 |
  }

  accordiC = \chordmode{
      f1:m | f1:m | g1:m | g1:m |
      f1:m | f1:m | g1:m | g1:m |
  }
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break
  \mark \default
  \new Voice <<{\temaB} {\temaBdue}>>
  \bar "||"
  \break
  \mark \default
  \new Voice <<{\temaC} {\temaCdue}>>
  \bar "|."
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
    \accordiB
    \accordiC
  }
}

temaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \tema }

scoreContent = << 
  \chordsPart
  \temaPart
  % \temaDuePart
>>
%}}}

% {{{ BOOKS
  \book{
    \bookOutputSuffix "C"
    \struttura
    \header{ composer="C" }
    \score {
      \scoreContent
      \layout {}
      \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 190 4) } }
    }
  }

  \book{
    \struttura
    \header{ composer="C" }
    \header{ composer="Bb" }
    \bookOutputSuffix "Bb"
    \score { \transpose c d {\scoreContent} }
  }
% }}}
