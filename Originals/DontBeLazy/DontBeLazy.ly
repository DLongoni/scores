% {{{ PARAMETRI
  myTitle = "Don't Be Lazy"
  myFname = "DontBeLazy"
  myKey = \key bes \major
  myTime = \time 2/4 
  myTempo =  #(ly:make-moment 60 4)
% }}}

% INTESTAZIONE {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"

struttura = \markup {
  \column {
    \line {
      \bold{B}, \bold{A}, \bold{B}, \bold{A}, Soli, \bold{C}, \bold{B}, \bold{A}, \bold{C}, Coda
    }
  }
}
%}}}

% PARTE A {{{
temaA = {
  \repeat volta 2 {
    \time 2/4
    d,8. g16~ g4~ g8 d'4 c8 | f16 f r16 f f8 g d4 r4 |
    r4 c8 ees bes8. g16 r4 | c16 c r c c8 ees bes8. g16 r4 |
    r4 c8 d a8. g16 r4 | 
    \time 3/4
    c16 c r c c8 ees a,8 g |
  }
}

temaAdue = {
  \repeat volta 2 {
    \time 2/4
    s1 | bes'16 bes s bes bes8 c g4 s4 |
    s1 | s1 |
    s4 g8 bes f8. ees16 s4 | 
    \time 3/4
    g16 g s g g8 bes f8 ees |
  }
}

bassoA = {
  \repeat volta 2 {
    \time 2/4
    g2 d'2 | f4 c bes2 |
    c8 r ees f g r c, r | ees r f g d g r4 |
    c,8 r ees f d r c r | 
    \time 3/4
    d8 r c r f d |
  }
}

accordiA = \chordmode{
  \repeat volta 2 {
    \time 2/4
    \set chordChanges = ##t
    g2:sus2 d2:sus4 | f4:m7 f4:m7/c bes2:6 |
    c2:m7 g2:m9 | c2:m7 g2:m9 | 
    c2:m7 f2:9 | 
    \time 3/4
    c2:m7 d4:m7 | 
  }
}
% }}}

% PARTE B {{{
temaB = {
  \repeat volta 2 {
    ees,2 g 4 bes | d c bes g | a2 \tuplet 3/2 {c4 b g} | 
    e'2 g4 fis | b,2 e4 d | fis,2 |
  }
  \alternative{
    {
      c'4 b |
      r4 d,4 |
    }
    {
      c'8. bes16~ bes4~ | 
      bes4 r8 d,8 |
    }
  }
}

bassoB = {
  \repeat volta 2 {
    s1 | s1 | s1 | s1 | s1 | s2 |
  }
  \alternative{
    {s2 | s2|}
    {s2 | s2|}
  }
}

accordiB = \chordmode{
  \repeat volta 2 {
    ees1:maj9 | ees2:maj9 bes2:7.11+ | a2:m7 c2:maj7/aes | 
    g1:6 | c1:maj7 | b2:m7 |
  }
  \alternative{
    {b2:m7 | bes2:7 |}
    { b8.:m7 d16:7.9+ d4:7.9+ | d2:7.9+|}
  }
}
% }}}

% PARTE C {{{
temaC = {
  \repeat volta 2 {
    f'16 g f d f g bes c d c d c~ c bes8 a16~ |
    a8 f8~ f4 r4 f8 g | d8. c16 r4 f16 f r f f8 g |
    d8. c16 r4 |
  }
}

bassoC = {
  \repeat volta 2 {
    g,2 d'4. a8 | bes4. a8 bes4 d | ees2 f4 d | c a |
  }
}

accordiC = \chordmode{
  \repeat volta 2 {
    g2:m7 d2:m7 |bes1:maj7 | ees2:maj7 d2:m7 | c2:m7 |
  }
}
% }}}

% PARTE Soli {{{
temaSoli = {  
  \repeat volta 2 {
    \mark "Soli"
    s1 | s1 | s1 |
  }
  \alternative{ {s1|} {s1|} }
}

bassoSoli = {
  \repeat volta 2 {
    c8 r ees f g r c, r | ees f g r d g r4 |
    c,8 r ees g f r c r | 
  }
  \alternative{
    {r4 ees8 r8 c8 r8 r4 |}
    {c8 c' cis, cis' d,4 a |}
  }
}

accordiSoli = \chordmode{
  \repeat volta 2 {
    c2:m7 g2:m9 |c2:m7 g2:m9 | c2:m7 f2:9 | 
  }
  \alternative{
    {c2:m7 f2:9 |}
    {c4:m7 cis4:dim7 d2:7.9+|}
  }
}
% }}}

% PARTE Coda {{{
temaCoda = {
    \mark "Coda"
    f16 g f d f g bes c d c d c~ c8 bes8\fermata |
    a2 |
}

bassoCoda = {
    g2 d'8. d16 r8 bes8 | a2 |
}

accordiCoda = \chordmode{
    g2:m7 d4.:m7 a8:dim7 | g2:m9 |
}
% }}}

% SCORE {{{
tema = \relative c' {
  \global 
  \mark \default
  \new Voice <<
    \temaA
    \temaAdue
  >>
  \mark \default
  \time 2/4
  \temaB
  \bar "||"
  \break
  \mark \default
  \temaC
  \break
  \temaSoli
  \break
  \temaCoda
  \bar "|."
}

basso = \relative c {
  \global 
  \bassoA
  \bassoB
  \bassoC
  \bassoSoli
  \bassoCoda
}

chordsPart = \new ChordNames \with {
  midiMaximumVolume = #0.7
}{
  \accordiA
  \accordiB
  \accordiC
  \accordiSoli
  \accordiCoda
}


temaPart = \new Staff \with {
  instrumentName = "T"
  shortInstrumentName = "T"
  midiInstrument = "trumpet"
  
} { \clef "treble_8" \tema }

bassPart = \new Staff \with {
  instrumentName = "B"
  shortInstrumentName = "B"
  midiInstrument = "contrabass"
  midiMaximumVolume = #0.8
} { \clef bass \basso }

\book{
  \struttura
  \markup { \vspace #1 }
  \bookOutputSuffix "C"
  \score {
    <<
      \chordsPart
      \temaPart
      \bassPart
    >>
    \layout {
      indent = #0
    }
  }
  \score {
    \unfoldRepeats 
    <<
      \chordsPart
      \temaPart
      \bassPart
    >>
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 120 4)
      }
    }
  }
}

\book{
  \struttura
  \markup { \vspace #1 }
  \bookOutputSuffix "Bb"
  \score {
    <<
      \transpose c d { \chordsPart }
      \transpose c d { \temaPart}
      \transpose c d { \bassPart}
    >>
    \layout {
      indent = #0
    }
  }
}
% }}}
