% {{{ PARAMETRI
  myTitle = "Alone in a sleeping city"
  myKey = \key bes \major
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
% \paper{
%   system-system-spacing =
%     #'((basic-distance . -1) 
%        (minimum-distance . -1)
%        (padding . -1)
%        (stretchability . 60)) 
% }

struttura = \markup {
  \column {
      \line {
        \bold{Intro}, \bold{A}, \bold{B}, \bold{A}, \bold{Solo}:Vamp+\bold{C},
        \bold{D}, \bold{B}, \bold{A}, \bold{Coda}
    }
  }
}
\layout {
  \context { 
    \Staff \RemoveEmptyStaves 
    \override VerticalAxisGroup.remove-first = ##t
  }
}
%}}}

% {{{ PARTE Intro
  temaIntro = {
    \repeat volta 3{
      r4 es4 d es8 d c~ | c4 c b c8 b a~ | a4 a g a8 g es~ | es2 r4 r4. | r2. r4. |
    } \break
    es'8 d es d c b c b a | f2.~ f4. | r2. r4. | \break
    \mark "Vamp"
    \repeat volta 2{ 
      f4 f f f8 f f | ees4 ees ees ees8 ees ees |
      d4 d d d8 d d | c4 c c c8 c c |
    }
  }

  ritmicaUnoIntro = {
    \repeat volta 3{
      f,8 r8 r2 f4. | f8 r8 r2 f4. | f8 r8 r2 f4. | 
      ees8 r8 r2 ees4. | ees8 r8 r2 ees4. |
    }
    s2. s4. | s2. s4. | s2. s4. | 
    \repeat volta 2{ s1*9/8 | s1*9/8 | s1*9/8 | s1*9/8 | }
  }

  ritmicaDueIntro = {
    \repeat volta 3{
      f,4 f'2 r4 c8 | f,4 f'2 r4 c8 | f,4 f'2 r4 a,8 | 
      g4 ees'2 r4 a,8 | g4 ees'2 r4 c8 |
    }
    s2. s4. | f4 f f f8 f f | f4 f f f8 f f |
    \repeat volta 2{ s1*9/8 | s1*9/8 | s1*9/8 | s1*9/8 | }
  }

  accordiIntro = \chordmode{
    \repeat volta 3{ f2. f4. | f2. f4. | f2. f4. | 
      ees2.:maj7.11+ ees4.:maj7.11+ | ees2.:maj7.11+ ees4.:maj7.11+ |}
   s2. s4. | f2.:7 f4.:7 | f2.:7 f4.:7 | 
   \repeat volta 2{f2.:7 f4.:7 | f2.:7/es f4.:7/es | f2.:7/d f4.:7/d | f2.:7/c f4.:7/c | }
  }
% }}}

% {{{ PARTE A
  temaA = {
    r8 bes' f bes d4 c8 a f | bes g g2 a8 f d | g es es2 f8 d bes | d a'16 bes a2~ a4. | \break
    r8 es bes es g4 f8 d bes | c4 es8 c es c d4 fis8 | a4 a8 g d4~ d4.~ | d2. r4. | \break
    r8 bes' f bes d4 c8 a f | bes g g2 a8 f d | g es es2 f8 d bes | d a'16 bes a2~ a4.^"(al Coda)" | \break
    r8 es bes es g4 f8 d bes | c4 es8 d es d c4 g'8^"(Soli su Intro)" | <<{bes2.} \\ {f2.}>> r4. | \bar "||"
  }

  temaAbis = {
    r8 f' d f bes4 a8 f d | bes2. f'8 d bes | g2. d'8 bes g | a d f2~ f4. | 
    r8 bes, g bes ees4 d8 bes f | g4 c8 r c r a4 c8 | d2.~ d4.~ | d2. r4. | 
    r8 f d f bes4 a8 f d | bes2. f'8 d bes | g2. d'8 bes g | a d f2~ f4. |
    r8 bes, g bes ees4 d8 bes f | g2. f4. | d2.~ d4. |
  }

  temaAtris = {
    d2. ees4. | d2 c8 bes c4. | bes2 bes8 c d4. | f8 d f2 f8 g a |
    g2.~ g4. | d4 g8 r g r fis4 a8 | bes2.~ bes4.~ | bes2. r4. |
    d,2. ees4. | d2 c8 bes c4. | bes2 bes8 c d4. | f8 d f2 f8 g a |
    g2.~ g4. | ees4 g8 r g r f ees d | bes2. r4. |
  }

  accordiA = \chordmode{
      bes2.:maj7 f4.:7 | g2.:m7 d4.:m7 | es2.:maj7 bes4.:maj7 | d1*9/8:m7 |
      es2.:maj7 bes4.:maj7 | c2.:m7 d4.:7 | g1*9/8:m9 | ges2.:7.9+ f4.:13 |
      bes2.:maj7 f4.:7 | g2.:m7 d4.:m7 | es2.:maj7 bes4.:maj7 | d1*9/8:m7 |
      es2.:maj7 bes4.:maj7 | c2.:m7 f4.:9 | bes1*9/8:maj7 |
  }
% }}}

% {{{ PARTE B
  temaB = {
    \fakeBar
    \repeat volta 2 {
      bes4 bes d c a8 | f2. a8 g f | g4 g bes a g8 | d2. r4. |
      c'4 c es d bes8 | a2. g8 f es | f2.~ f4. | r2. r4. |
    }
  }

  accordiB = \chordmode{
    \fakeBar
    \repeat volta 2 {
      g2.:m7 g4.:m7 | f2.:6 f4.:6 | es2.:maj7 f4.:7 | bes2.:maj7 bes4.:maj7 |
      c2.:m7 c4.:m7 | f2.:6 f4.:6 | d2.:m7 d4.:m7 | d2.:m7 d4.:m7 |
    }
  }
% }}}

% {{{ PARTE C - Dismessa
  % temaC = {
  %   \repeat volta 2 {
  %     c8 f, es'16 d c bes c4 a g8 | b16 a g f es8 g a16 b a g b4 a8 |
  %   }
  % }
  %
  % accordiC = \chordmode{
  %   \repeat volta 2 {
  %     f2.:7 f4.:7 | f2.:7 f4.:7 |
  %   }
  % }
% }}}

% {{{ PARTE C - Soli
  silenzioC = {
    \repeat volta 2 {
      g1*9/8 | r1*9/8 | r1*9/8 |
    }
    \alternative{
      {r1*9/8 |}
      {r1*9/8 |}
    }
  }

  accordiC = \chordmode{
    \repeat volta 2 {
      g1*9/8:m | ees1*9/8 | f1*9/8 |
    }
    \alternative{
      {d1*9/8:m |}
      {d1*9/8:7 |}
    }
  }
% }}}

% {{{ PARTE D
  temaD = {
    \repeat volta 2 {
      d'8 g, ees'16 d c bes c4 a g8 | bes16 a g fis es8 fis g16 fis es d c4^"Stop" d8 |
    }
  }

  accordiD = \chordmode{
    \repeat volta 2 {
      g2.:m d4.:7 | g2:m d4:7 d4.:7 |
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
  % \pageBreak
  \mark \default
  \temaA \break 
  \mark \default
  \temaB \break 
  \mark \default
  \silenzioC \break 
  \mark \default
  \temaD \bar "|."
  % \mark "Soli"
  % \temaSoli \break
  % \mark "Coda"
  % \temaCoda \bar "|."
}

ritmicaUno = \relative c' {
  % \ritmicaUnoIntro
  \ritmicaDueIntro
  \temaAtris
}

% ritmicaDue = \relative c' {
%   \ritmicaDueIntro
% }

chordsPart ={
  \new ChordNames \with{midiInstrument = "acoustic guitar (nylon)"}
    \set chordChanges = ##t
    \accordiIntro
    \accordiA
    \accordiB
    \accordiC
    \accordiD
    % \accordiSoli
    % \accordiCoda
  }

temaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "trumpet"
} { \clef "treble_8" \global \tema }

ritmicaUnoPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "acoustic guitar (nylon)"
} { \clef "treble_8" \global \ritmicaUno }

% ritmicaDuePart = \new Staff \with {
%   
%   \override VerticalAxisGroup.default-staff-staff-spacing =#'((basic-distance . 30))
%   instrumentName = ""
%   midiInstrument = "acoustic guitar (nylon)"
% } { \clef "treble_8" \global \ritmicaDue }

scoreContent = << 
  \chordsPart
  \temaPart
  \ritmicaUnoPart
  % \ritmicaDuePart
>>
%}}}

% {{{ BOOKS
  \book{
    \struttura
    \bookOutputSuffix "C"
    \header{ composer="C" }
    \score {
      \scoreContent
      \layout {}
      \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 190 4) } }
    }
  }

  \book{
    \struttura
    \header{ composer="Bb" }
    \bookOutputSuffix "Bb"
    \score { \transpose c d {\scoreContent} }
  }
% }}}
