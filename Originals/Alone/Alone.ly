% {{{ PARAMETRI
  myTitle = "Alone in a sleeping city"
  myFname = "Alone"
  myKey = \key bes \major
  myTime = \time #'(2 2 2 3) 9/8
  myTempo =  #(ly:make-moment 100 4)
% }}}

% INTESTAZIONE {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"

struttura = \markup {
  \column {
      \line {
        \bold{Intro} 1x Gtr, 3x Gtr+Fisa, \bold{A} Tr, \bold{B} Fisa, \bold{B} Tr, 
        \bold{A} Tr}
      \line{\bold{Solo}Tr: Pedale F +\bold{C}, \bold{Solo}Fisa: Pedale F +\bold{C},
            \bold{D}, \bold{B}, \bold{A} 1/2 Fisa II voce, 1/2 Tr
    }
  }
}
%}}}

% {{{ PARTE Intro - OLD
  % temaIntro = {
  %   \repeat volta 3{
  %     r4 es4 d es8 d c~ | c4 c b c8 b a~ | a4 a g a8 g es~ | es2 r4 r4. | r2. r4. |
  %   } \break
  %  \new Voice <<{es'8 d es d c b c b a |} {c8 b c b a gis a gis f |}>>
  %   
  %   \repeat volta 2{ 
  %     f4 f f f8 f f | ees4 ees ees ees8 ees ees |
  %     d4 d d d8 d d | c4 c c c8 c c |
  %   }
  % }
  %
  % ritmicaUnoIntro = {
  %   \repeat volta 3{
  %     f,8 r8 r2 f4. | f8 r8 r2 f4. | f8 r8 r2 f4. | 
  %     ees8 r8 r2 ees4. | ees8 r8 r2 ees4. |
  %   }
  %   s2. s4. | 
  %   \repeat volta 2{ s1*9/8 | s1*9/8 | s1*9/8 | s1*9/8 | }
  % }
  %
  % ritmicaDueIntro = {
  %   \repeat volta 3{
  %     f,4 f'2 r4 c8 | f,4 f'2 r4 c8 | f,4 f'2 r4 a,8 | 
  %     g4 ees'2 r4 a,8 | g4 ees'2 r4 c8 |
  %   }
  %   s2. s4. | 
  %   \repeat volta 2{ s1*9/8 | s1*9/8 | s1*9/8 | s1*9/8 | }
  % }
  %
  % accordiIntro = \chordmode{
  %   \repeat volta 3{ f2. f4. | f2. f4. | f2. f4. | 
  %     ees2.:maj7.11+ ees4.:maj7.11+ | ees2.:maj7.11+ ees4.:maj7.11+ |}
  %  s2. s4. | 
  %  \repeat volta 2{f2.:7 f4.:7 | f2.:7/es f4.:7/es | f2.:7/d f4.:7/d | f2.:7/c f4.:7/c | }
  % }
  %
  % silenzioIntro = {
  %   \repeat volta 3{
  %     s1*9/8 | s1*9/8 | s1*9/8 | s1*9/8 | s1*9/8 |
  %   }
  %   s2. s4. | 
  %   \repeat volta 2{ s1*9/8 | s1*9/8 | s1*9/8 | s1*9/8 | }
  % }
% }}}

% {{{ PARTE Intro
  ritmicaUnoIntro = {
    \repeat volta 2 {
      bes4\staccato bes4\staccato bes8 g a4 f8 | bes4\staccato bes4\staccato bes8 g a4 f8 |
      bes4\staccato bes4\staccato bes8 g a4 f8 | bes4\staccato bes4\staccato bes8 g a4 f8 | bes4\staccato bes4\staccato bes8 g a4 f8 |
    }
  }

  ritmicaDueIntro = {
    \repeat volta 2 {
       \new Voice <<
         { d4 r4 r8 d8 f4. | f4 r4 r8 f8 f4. | 
         g4 r4 r8 g8 f4. | f4 r r8 f8 f4. | f4 r4 r8 f8 ees4. | } 
         { a,4 r4 r8 a8 c4. | d4 r r8 d8 d4. | 
         d4 r r8 d d4. | d4 r r8 d c4. | d4 r r8 c a4. |}
       >>
    }
  }

  accordiIntro = \chordmode{
     \repeat volta 2 {
        bes2. f4. | g2.:m d4.:m |
        bes2. f4. | g2.:m d4.:m | bes2. f4.:7 |
     }
  }

  bassoIntro ={
    \repeat volta 2 {
     r8 bes4. g4 f4 d8 | r8 g4. ees4 d4. | 
     r8 bes4. g4 f4 d8 | r8 g4. ees4 d4. | 
     bes,4 bes, d ees8 e f |
    } 
  }

  silenzioIntro = {
    \repeat volta 2{ s1*9/8 | s1*9/8 | s1*9/8 | s1*9/8 | s1*9/8 | }
  }
% }}}

% {{{ PARTE A
  temaA = {
    r8 bes' f bes d4 c8 a f | bes g g2 a8 f d | g es es2 f8 d bes | d a'16 bes a2~ a4. | \break
    r8 es bes es g4 f8 d bes | c4 es8 c es c d4 fis8 | a4 a8 g d4~ d4.~ | d2. r4. | \break
    r8 bes' f bes d4 c8 a f | bes g g2 a8 f d | g es es2 f8 d bes | d a'16 bes a2~ a4.^"(al Coda)" | \break
    r8 es bes es g4 f8 d bes | c4 es8 c es d c4 g'8| bes2. r4. | 
  }

  temaAbis = {
    r8 f d f bes4 a8 f d | bes2. f'8 d bes | g2. d'8 bes g | a d f2~ f4. | 
    r8 bes, g bes ees4 d8 bes f | g4 c8 r c r a4 c8 | d2.~ d4.~ | d2. r4. | 
    r8 f d f bes4 a8 f d | bes2. f'8 d bes | g2. d'8 bes g | a d f2~ f4. |
    r8 bes, g bes ees4 d8 bes f | g2. f4. | d2.~ d4. |
  }

  temaAtris = {
    d2. ees4. | d2 c8 bes c4. | bes2 bes8 c d4. | f8 d f2 f8 g a |
    g2. f4. | ees4 g8 r g r fis4 a8 | bes2.~ bes4.~ | bes2. r4. |
    d,2. ees4. | d2 c8 bes c4. | bes2 bes8 c d4. | f8 d f2 f8 g a |
    g2. f4. | ees4 g8 r g r f ees d | bes2. r4. |
  }

  ritmicaA = \relative c''{
     \new Voice <<
       { d4 r4 r8 d8 f4. | f4 r4 r8 f8 f4. | g4 r4 r8 g8 f4. | f4 r r8 f8 f4. | 
         g4 r4 r8 g8 f4. | ees4 r r8 ees d4. | d4 r r8 d d4. | d4 r r8 d d4. | 
         d4 r4 r8 d8 f4. | f4 r4 r8 f8 f4. | g4 r4 r8 g8 f4. | f4 r r8 f8 f4. | 
         g4 r4 r8 g8 f4. | f4 r r8 ees f4. | f4 r r4 r4. | } 
       { a,4 r4 r8 a8 c4. | d4 r r8 d8 d4. | d4 r r8 d d4. | d4 r r8 d d4. | 
         d4 r r8 d d4. | c4 r r8 c c4. | bes4 r4 r8 bes bes4. | bes4 r r8 bes a4. |
         a4 r4 r8 a8 c4. | d4 r r8 d8 d4. | d4 r r8 d d4. | d4 r r8 d d4. | 
         d4 r r8 d d4. | c4 r r8 c c4. | d4 r4 r4 r4. |
       }
     >>
  }

  ritmicaAsignola ={
    \repeat volta 2 {
      bes'4 bes bes8 g a4 f8 | bes4 bes bes8 g a4 f8 | 
      bes4 bes bes8 g bes4 f8 | a4 a a8 f a4 f8 |
      bes4 bes bes8 g bes4 f8 | c'4 c c8 g8 c4 ges8 |
      bes4 bes bes8 g bes4 g8 | bes4 bes bes8 g a4 f8 | 
      bes4 bes bes8 g a4 f8 | bes4 bes bes8 g a4 f8 | 
      bes4 bes bes8 g bes4 f8 | a4 a a8 f a4 f8 |
      bes4 bes bes8 g bes4 f8 | bes4 bes bes8 g a4 f8 |
      bes4 bes bes8 f bes4 r8 |
    } 
  }

  accordiA = \chordmode{
      bes2.:maj7 f4.:7 | g2.:m7 d4.:m7 | es2.:maj7 bes4.:maj7 | d1*9/8:m7 |
      % es2.:maj7 bes4.:maj7 | c2.:m7 d4.:7 | g1*9/8:m9 | ges2.:7.9+ f4.:13 |
      es2.:maj7 bes4.:maj7 | a2.:m7.5- aes4.:7.11+ | g1*9/8:m9 | ges2.:7.9+ f4.:13 |
      bes2.:maj7 f4.:7 | g2.:m7 d4.:m7 | es2.:maj7 bes4.:maj7 | d1*9/8:m7 |
      es2.:maj7 bes4.:maj7 | c2.:m7 f4.:9 | bes1*9/8:maj7 |
  }

  bassoA ={
    \repeat volta 2 {
     r8 bes4. g4 f4 d8 | r8 g4. ees4 d4. | r8 ees4. g8 a bes4 f8 | r8 d4. f4 a8 f d |
     r8 ees4. g4 bes4. | r8 a4. g4 aes4. | r8 g8 g4 r4 g4. | r8 ges4 bes8 a g f4. |
     r8 bes4. g4 f4. | r8 g4. ees4 d4. | r8 ees4. g8 aes bes4 f8 | r8 d4. f4 f8 ees d |
     r8 ees4. g4 bes4. | r8 c'4. g4 f4. | r8 bes,4. d4 f8 fis g |
    } 
  }
% }}}

% {{{ PARTE B
  temaB = {
    \repeat volta 2 {
      bes4 bes d c a8 | f2. a8 g f | g4 g bes a g8 | d2. r4. |
      c'4 c es d bes8 | a2. g8 f es | f2.~ f4. |
    }
    \alternative{
      {r2. r4. |}
      {r2. r4. |}
    }
  }

  lineaB = {
    \repeat volta 2 {
      g1*9/8 | a1*9/8 | bes2. a4.~ | a2. r4. |
      s1*9/8 | s1*9/8 | s1*9/8 |
    }
    \alternative{
      {s1*9/8 | }
      {s1*9/8 | }
    }
  }

  silenzioB = {
    \repeat volta 2 {
      s1*9/8 | s1*9/8 | s1*9/8 | s1*9/8 |
      s1*9/8 | s1*9/8 | s1*9/8 |
    }
    \alternative{
      {r1*9/8 |}
      {r1*9/8 |}
    }
  }

  accordiB = \chordmode{
    \repeat volta 2 {
      g2.:m7 g4.:m7 | f2.:6 f4.:6 | es2.:maj7 f4.:7 | bes2.:maj7 bes4.:maj7 |
      c2.:m7 c4.:m7 | f2.:6 f4.:6 | d2.:m7 d4.:m7 |
    }
    \alternative{
      {d2.:m7 d4.:m7 |}
      {d2.:m7 d4.:m7/a |}
    }
  }
% }}}

% {{{ PARTE B 2
  temaBdue = {
      bes4 bes d c a8 | f2. a8 g f | g4 g bes a g8 | d2. r4. | \break
      c'4 c es d bes8 | a2. g8 f es | f2.~ f4. | r2. r4. |
  }

  compBdue = {
       \new Voice <<
         { bes'2.~ bes4. | a2.~ a4. | c2.~ c4. | d2.~ d4. | 
         ees2.~ ees4. | d2. d4. | a2. a4. | r2. r4. | }
         { g,2.~ g4. | f2.~ f4. | ees'2.~ ees4. | bes2. bes4. |
         c2.~ c4. | f2.~ f4. | d2.~ d4. | r2. r4. | }
       >>
    }

  silenzioBdue = {
      s1*9/8 | s1*9/8 | s1*9/8 | s1*9/8 |
      s1*9/8 | s1*9/8 | s1*9/8 | r1*9/8 |
  }

  accordiBdue = \chordmode{
      g2.:m7 g4.:m7 | f2.:6 f4.:6 | es2.:maj7 ees4.:maj7 | bes2.:maj7 bes4.:maj7 |
      c2.:m7 c4.:m7 | f2.:6 f4.:6 | d2.:m7 d4.:m7 | d2.:m7 d4.:m7 |
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

  bassoC = {
    \repeat volta 2 {
      g4 g r g4. | ees4 ees r ees4. | f4 f r f4. |
    }
    \alternative{
      { d4 d r f4. | }
      { d4 d r fis4. | }
    }
  }

  voicingC = {
    \repeat volta 2 {
       \new Voice <<
         { r8 d4. c4 d c8 | r8 d4. c4 d4. | r8 d4. c4 d c8 | }
         { r8 bes4. bes4 bes4. | r8 bes4. bes4 bes4. | r8 a4. a4 a4. | }
       >>
    }
    \alternative{
      {
      \new Voice <<
        { r8 d4. c4 d4. | }
        { r8 a4. a4 a4. | }
      >>
      }
      {
      \new Voice <<
        { r8 d4. c4 d4. | }
        { r8 a4. a4 a4. | }
      >>
      }
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
  \ritmicaUnoIntro
  \break
  \mark \default
  \temaA \break 
  \mark \default
  \temaB \pageBreak 
  \mark \markup{ \box \bold{B2} }
  \temaBdue \bar "||" \break 
  \mark \default
  \voicingC \break 
  \mark \default
  \temaD \bar "|."
  % \mark "Soli"
  % \temaSoli \break
  % \mark "Coda"
  % \temaCoda \bar "|."
}

ritmicaUno = \relative c' {
  \ritmicaDueIntro
  \temaAbis
  \lineaB
  \compBdue
}

temaTris = \relative c' {
  \silenzioIntro
  \temaAtris
}

ritmicaSingolaA = \relative c' {
  \global
  \silenzioIntro
  \ritmicaAsignola
}

ritmicaApart = \new Staff {
  \global
  \silenzioIntro
  \ritmicaA
}

bassoPart = \new Staff {
  \global
  \clef "bass"
  \bassoIntro
  \bassoA
  \silenzioB
  \silenzioBdue
  \bassoC
}

% ritmicaDue = \relative c' {
%   \ritmicaDueIntro
% }

chordsPart ={
  \new ChordNames \with{midiInstrument = "acoustic guitar (nylon)"}
    \powerChords % necessario per Ees lyd
    \set chordChanges = ##t
    \accordiIntro
    \accordiA
    \accordiB
    \accordiBdue
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

temaTrisPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "acoustic guitar (nylon)"
} { \clef "treble_8" \global \temaTris }

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
  \temaTrisPart
  \ritmicaApart
  \ritmicaSingolaA
  \bassoPart
>>
%}}}

% {{{ BOOKS
  \book{
    \bookOutputName \myFname
    \bookOutputSuffix "C"
    \header{ composer="C" }
    \struttura
    \markup { \vspace #1 }
    \score {
      \scoreContent
      \layout {}
      \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 190 4) } }
    }
  }

  \book{
    \bookOutputName \myFname
    \struttura
    \markup { \vspace #1 }
    \header{ composer="Bb" }
    \bookOutputSuffix "Bb"
    \score { \transpose c d {\scoreContent} }
  }
% }}}
