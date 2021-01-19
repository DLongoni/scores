% {{{ PARAMETRI
  myTitle = "At the Wrong Time"
  myFname = "AtTheWrongTime"
  myKey = \key bes \major
  myTime = \time 9/8 
  myTempo =  #(ly:make-moment 60 4)

  struttura = \markup {
    \column {
        \line {\bold{A}, \bold{B}x2 Fisa, \bold{B}x2 Fisa+Gtr, \bold{Solo} su B, \bold{B}x2 su solo}
        \line{\bold{C} Fisa,\bold{D} Tr, \bold{Solo} su E, \bold{E} Fisa, \bold{B}x2 Fisa+Gtr, \bold{C} Tr, \bold{A} Gtr, \bold{Coda}}
    }
  }
% }}}

% INTESTAZIONE {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"
%}}}

% {{{ PARTE A
  temaA = {
    \partial 4. c'4 a8 |
      bes4.~ bes4 a8 g8 e des |
      c4 d8 ees4 g8 f4.~ | f2. g4 a8 | bes2. bes4 g8 | 
      aes4.~ aes4 g8 f8 ges f |\toCoda des2. ees4. | c2.~ c4. | c2.  c'4 a8 |
  }

  silenzioA = {
    \partial 4. s4. |
    \repeat volta 2{
      s1*9/8 | s1*9/8 | s1*9/8 | s1*9/8 | 
      s1*9/8 | s1*9/8 | s1*9/8 | s1*9/8 |
    }
  }

  accordiA = \chordmode{
    \partial 4. s4. |
    \repeat volta 2{
      bes1*9/8:maj7 | aes1*9/8:6 | bes1*9/8:6 | g1*9/8:m7 |
      bes1*9/8:m7 | ges1*9/8:7 | f1*9/8:6 | f1*9/8:6 |
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    \repeat volta 2{
      \time 9/8
      g8 d bes' g4 f16 g16 f8 d c~ |
      c8 g bes c d e f4 d8 |
      g8 d bes' g4 f16 g16 f8 d c~ |
      \time 6/8
      c8 e c a8 g8 g8 |
    }
  }

  temaBdue = {
    \time 9/8
    \repeat volta 2{
      bes'8 g d' bes4 a16 bes16 a8 f e~ |
      e8 f g a c bes a4 f8 |
      bes8 g d' bes4 a16 bes16 a8 f e~ |
      \time 6/8
      e8 g e a8 g g |
    }
  }

  bassoB = {
    \repeat volta 2{
      g,2. bes,4. | c4. d2. |
      g,2. d4. | 
      \time 6/8
      c2. |
    }
  }

  ritmicaB = {
    \repeat volta 2{
      r8 <bes' d''>8 r8 <bes' d''>8 r4 r8 <bes' d''>8 r8 |
      <c'' e''>8 r4 r8 <d'' f''>8 r8 <d'' f''>8 r4 |
      r8 <bes' d''>8 r8 <bes' d''>8 r4 r8 <bes' d''>8 r8 |
      \time 6/8
      <c'' e''>8 r4 r8 <c'' e''>8 r8 |
    }
  }

  accordiB = \chordmode{
    g1*9/8:m7 | c4.:9 d2.:m7 |
    g1*9/8:m7 | 
    \time 6/8
    c2.:9 |
  }
% }}}

% {{{ PARTE C
  temaC = {
    \partial 4. c'4 a8 |
    \time 9/8
    \repeat volta 2{
      bes4.~ bes4 a8 g8 e d |
      c4 d8 ees4 g8 f4.~ | f2. g4 a8 | bes2. d4. | 
      c4.~ c4 a8 c a g | f2. a4. | g2.~ g4. | r2. c4 a8 |
    } \break 
    \mark \default
    bes4.~ bes4 a8 g8 e d |
    c4 d8 ees4 g8 f4.~ | f2. g4 a8 | bes2. d4. | 
    c2. e4. | d2. r4. |
  }

  silenzioC = {
    \partial 4. s4. |
    \time 9/8
    \repeat volta 2{
      s1*9/8 | s1*9/8 | s1*9/8 | s1*9/8 | 
      s1*9/8 | s1*9/8 | s1*9/8 | s1*9/8 |
    }
    s1*9/8 | s1*9/8 | s1*9/8 | s1*9/8 | 
    s1*9/8 | s1*9/8 | 
  }

  accordiC = \chordmode{
    \partial 4. s4. |
    \time 9/8
    \repeat volta 2{
      bes1*9/8 | aes1*9/8 | bes1*9/8 | g1*9/8:m7 |
      f1*9/8 | d1*9/8:m | ees1*9/8 | ees1*9/8 |
    }
    bes1*9/8 | aes1*9/8 | bes1*9/8 | g1*9/8:m7 |
    f1*9/8 | g1*9/8:m |
  }
% }}}

% {{{ PARTE D
  temaD = {
    \repeat volta 2{
      g,8 d bes' g4 f16 g16 f8 d bes~ |
      bes8 g bes c d e f4 d8 |
      g8 d bes' g4 f16 g16 f8 d bes~ |
      bes8 g bes c d e f4 d8 |
    }
  }

  temaDdue = {
    \repeat volta 2{
      bes8 g d' bes4 a16 bes16 a8 f e~ |
      e8 f g a c bes a4 f8 |
      bes8 g d' bes4 a16 bes16 a8 f e~ |
      e8 f g a c bes a4 f8 |
    }
  }

  bassoD = {
    \repeat volta 2{
      g,4 g8 r4 g8~ g4.~ | g2. r4. | g4 g8 r4 g8 r4. | g2.~ g4. |
    }
  }

  silenzioD = {
    \repeat volta 2{
      s1*9/8 | s1*9/8 | s1*9/8 | s1*9/8 | 
    }
  }

  accordiD = \chordmode{
    \repeat volta 2{
      g1*9/8:m | g1*9/8:m | g1*9/8:m | g1*9/8:m |
    }
  }
% }}}

% {{{ PARTE Coda
  temaCoda = {
    cis2. dis4. | eis2.~ eis4. |
  }

  silenzioCoda = {
      s1*9/8 | s1*9/8 |
  }

  accordiCoda = \chordmode{
    a1*6/8 b4. | cis1*9/8 |
  }
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break
  \mark \default
  \temaB \break
  \mark \default
  \temaC \break
  \mark \default
  \temaD \break
  \mark \markup { \musicglyph #"scripts.coda"}
  \temaCoda
  \bar"|."
}

temaDue = \relative c' {
  \silenzioA
  \temaBdue 
  \silenzioC
  \temaDdue
  \silenzioCoda
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
    \accordiB
    \accordiC
    \accordiD
    \accordiCoda
  }
}

ritmicaPart = \new Staff {
  \silenzioA
  \ritmicaB
  \silenzioC
  \silenzioD
  \silenzioCoda
}

bassoPart = \new Staff {
  \clef "bass"
  \silenzioA
  \bassoB
  \silenzioC
  \bassoD
  \silenzioCoda
}

temaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \tema }

temaPartDue = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \temaDue }

scoreContent = << 
  \chordsPart
  \temaPart
  \temaPartDue
  \ritmicaPart
  \bassoPart
>>
%}}}

% {{{ BOOKS
  \book{
    \bookOutputName \myFname
    \header{ composer="C" }
    \struttura
    \markup { \vspace #1 }
    \bookOutputSuffix "C"
    \score {
      \scoreContent
      \layout { indent = #0 }
      \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 90 4) } }
    }
  }

  \book{
    \bookOutputName \myFname
    \header{ composer="Bb" }
    \struttura
    \bookOutputSuffix "Bb"
    \markup { \vspace #1 }
    \score { \transpose c d, {\scoreContent} }
  }
% }}}
