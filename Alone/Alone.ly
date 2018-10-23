% {{{ PARAMETRI
  myTitle = "Alone in a sleeping city"
  myKey = \key f \major
  myTime = \time #'(2 2 2 3) 9/8
  myTempo =  #(ly:make-moment 100 4)
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
fakeBar = {  
  \bar""
  \cadenzaOn
  \once \omit Score.TimeSignature
  \time 1/16
  
    \bar ":|."
  s16  
  \cadenzaOff
  \once \omit Score.TimeSignature
  \myTime
}

struttura = \markup {
  \column {
      \line {
        \bold{Intro}, \bold{Bridge}, \bold{A}, \bold{B}, \bold{A}, \bold{Solo}-Intro, \bold{Bridge}, \bold{C}, \bold{Solo}-Vamp, \bold{A}
        \bold{D}, \bold{B}, \bold{A}, \bold{Coda}
    }
  }
}
%}}}

% {{{ PARTE Intro
  temaIntro = {
    \repeat volta 3{
      r4 bes'4 a bes8 a g~ | g4 g fis g8 fis e~ | e4 e d e8 d bes~ | bes2 r4 r4. | r2. r4. |
    }
    r4 bes4 a bes8 a g~ | g4 g fis g8 fis e~ | e4 e d e8 d bes~ | bes2 r4 r4. | r2. r4. | \break
    \mark "Bridge"
    bes'8 a bes a g fis g fis e | c2.~ c4. | r2. r4. | \break
    \mark "Vamp"
    \repeat volta 2{ s2. s4. | s2. s4. | s2. s4. | s2. s4. |}
  }

  ritmicaUnoIntro = {
    \repeat volta 3{
      c,8 r8 r2 c4. | c8 r8 r2 c4. | c8 r8 r2 c4. | c8 r8 r2 c4. | c8 r8 r2 c4. |
    }
    c8 r8 r2 c4. | c8 r8 r2 c4. | c8 r8 r2 c4. | c8 r8 r2 c4. | c8 r8 r2 c4. |
    d'8 c d c bes a bes a g | e2.~ e4. | r2. r4. |
    \repeat volta 2{ c'4 c c c8 c c | bes4 bes bes bes8 bes bes | a4 a a a8 a a | bes4 bes bes bes8 bes bes | }
  }

  ritmicaDueIntro = {
    \repeat volta 3{
      c,4 c'2 r4 g8 | c,4 c'2 r4 g8 | c,4 c'2 r4 g8 | c,4 c'2 r4 g8 | c,4 c'2 r4 g8 |
    }
    c,4 c'2 r4 g8 | c,4 c'2 r4 g8 | c,4 c'2 r4 g8 | c,4 c'2 r4 g8 | c,4 c'2 r4 g8 |
    s2. s4. | c4 c c c8 c c | c4 c c c8 c c |
    \repeat volta 2{ g4 g g g8 g g | g4 g g g8 g g | g4 g g g8 g g | g4 g g g8 g g | }
  }

  accordiIntro = \chordmode{
    \repeat volta 3{ s2. s4. | s2. s4. | s2. s4. | s2. s4. | s2. s4. |}
   s2. s4. | s2. s4. | s2. s4. | s2. s4. | s2. s4. |
   s2. s4. | c2.:7 c4.:7 | c2.:7 c4.:7 | 
   \repeat volta 2{c2.:7 c4.:7 | c2.:7/bes c4.:7/bes | c2.:7/a c4.:7/a | c2.:7/g c4.:7/g | }
  }
% }}}

% {{{ PARTE A
  temaA = {
    r8 f' c f a4 g8 e c | f d d2 e8 c a | d bes bes2 c8 a f | a e'16 f e2~ e4. | \break
    r8 bes f bes d4 c8 a f | g4 bes8 g bes g a4 cis8 | e4 e8 d a4~ a4.~ | a2. r4. | \break
    r8 f' c f a4 g8 e c | f d d2 e8 c a | d bes bes2 c8 a f | a e'16 f e2~ e4.^"(al Coda)" | \break
    r8 bes f bes d4 c8 a f | g4 bes8 a bes a g4 d'8^"(Soli su Intro)" | f2. r4. | r2. r4. | \bar "||"
  }

  accordiA = \chordmode{
      f2.:maj7 c4.:7 | d2.:m7 a4.:m7 | bes2.:maj7 f4.:maj7 | a1*9/8:m7 |
      bes2.:maj7 f4.:maj7 | g2.:m7 a4.:7 | d1*9/8:m9 | des2.:7.9+ c4.:13 |
      f2.:maj7 c4.:7 | d2.:m7 a4.:m7 | bes2.:maj7 f4.:maj7 | a1*9/8:m7 |
      bes2.:maj7 f4.:maj7 | g2.:m7 c4.:9 | f1*9/8:maj7 | f1*9/8:maj7 |
  }
% }}}

% {{{ PARTE B
  temaB = {
    \fakeBar
    \repeat volta 2 {
      f4 f a g e8 | c2. e8 d c | d4 d f e d8 | a2. r4. |
      g'4 g bes a f8 | e2. d8 c bes | c2.~ c4. | r2. r4. |
    }
  }

  accordiB = \chordmode{
    \fakeBar
    \repeat volta 2 {
      d2.:m7 d4.:m7 | c2.:6 c4.:6 | bes2.:maj7 c4.:7 | f2.:maj7 f4.:maj7 |
      g2.:m7 g4.:m7 | c2.:6 c4.:6 | a2.:m7 a4.:m7 | a2.:m7 a4.:m7 |
    }
  }
% }}}

% {{{ PARTE C
  temaC = {
    \repeat volta 2 {
      g8 c, bes'16 a g f g4 e d8 | fis16 e d c bes8 d e16 fis e d fis4 e8 |
    }
  }

  accordiC = \chordmode{
    \repeat volta 2 {
      c2.:7 c4.:7 | c2.:7 c4.:7 |
    }
  }
% }}}

% {{{ PARTE D
  temaD = {
    \repeat volta 2 {
      a8 d, bes'16 a g f g4 e d8 | f16 e d cis bes8 cis d16 cis bes a g4^"Stop" a8 |

    }
  }

  accordiD = \chordmode{
    \repeat volta 2 {
      d2.:m a4.:7 | d2:m a4:7 a4.:7 |
    }
  }
% }}}

% {{{ PARTE Soli
  temaSoli = {
    \repeat volta 2 {
      s2. s4. | s2. s4. | s2. s4. | s2. s4. |
    }
  }

  accordiSoli = \chordmode{
    \repeat volta 2 {
      d2.:m7 d4.:m7 | c2.:6 c4.:6 | bes2.:maj7 c4.:7 | f2.:maj7 f4.:maj7 |
    }
  }
% }}}

% {{{ PARTE Coda
  temaCoda = {
    r8 bes' f bes d4 c8 a f | g4 bes8 a g4~ g4.~ | g2. r4. | \break
    r8 bes f bes d4 c8 a f | g4 bes8 a bes a g4 d'8 | f2. r4. | r2. r4. |
  }

  accordiCoda = \chordmode{
      bes2.:maj7 f4.:maj7 | ees2.:maj9 ees4.:maj9 | ees2.:maj9 d4.:7 |
      c2.:m7 d4.:7 | g2.:m7 c4.:9 | f1*9/8:maj7 | f1*9/8:maj7 |
  }
% }}}

% SCORE {{{
tema = \relative c' {
  \mark "Intro"
  \temaIntro
  \break
  \pageBreak
  \mark \default
  \temaA \break 
  \mark \default
  \temaB \break 
  \mark \default
  \temaC \break 
  \mark \default
  \temaD \break 
  % \mark "Soli"
  % \temaSoli \break
  \mark "Coda"
  \temaCoda \bar "|."
}

ritmicaUno = \relative c' {
  \ritmicaUnoIntro
}

ritmicaDue = \relative c' {
  \ritmicaDueIntro
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiIntro
    \accordiA
    \accordiB
    \accordiC
    \accordiD
    % \accordiSoli
    \accordiCoda
  }
}

temaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \tema }

ritmicaUnoPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \ritmicaUno }

ritmicaDuePart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \ritmicaDue }

scoreContent = << 
  \chordsPart
  \temaPart
  \ritmicaUnoPart
  \ritmicaDuePart
>>
%}}}

% {{{ BOOKS
  \book{
    \struttura
    \bookOutputSuffix "C"
    \score {
      \scoreContent
      \layout {}
      \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 190 4) } }
    }
  }

  \book{
    \struttura
    \bookOutputSuffix "Bb"
    \score { \transpose c d {\scoreContent} }
  }
  
  \book{
    \struttura
    \bookOutputSuffix "C2"
    \score { \transpose c f {\scoreContent} }
  }
  
  \book{
    \struttura
    \bookOutputSuffix "Bes2"
    \score { \transpose c g {\scoreContent} }
  }
% }}}
