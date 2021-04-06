% {{{ PARAMETRI
  myTitle = "Arapsko Kokonjeste"
  myFname = "Arapsko"
  mySubTitle = "Serbian"
  myKey = \key bes \major
  myTime = \time 2/4 
  myTempo =  #(ly:make-moment 190 4)
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

% {{{ PARTE A
  temaA = {
    \partial 8 g8 |
    c4. g8 | c4. g8 | c4. g8 | c16 ees d ees c8. g16 | 
    c16 ees d ees c8. g16 | c16 ees d ees c8. g16 | c16 ees d ees c8. g16 | c16 ees d ees c8. g16 | 
    \repeat volta 2 {
      bes8 bes16 c g8 d' | bes16 d a bes g8 d' | bes8 bes16 a g8 d' | bes16 d a bes g4 |
    } 
  }

  accordiA = \chordmode{
    \partial 8 s8 |
    c2:m | c2:m | c2:m | c2:m | c2:m | c2:m | c2:m | c2:m |
    \repeat volta 2{
      g2:m | g2:m | g2:m | d4 g4:m | 
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    \repeat volta 2 {
      g'16 d g8~ g16 f e d | cis d e f g f e d | cis d e d cis8 bes16 a | g a bes cis d4 |
      g16 d g8~ g16 f e d | cis d e f g f e d | cis d e d cis8 bes16 a | g a bes a g4 |
    } 
  }

  accordiB = \chordmode{
    \repeat volta 2{
      g2:m | g2:m | g2:m | g2:m | 
      g2:m | g2:m | d2 | g2:m | 
    }
  }
% }}}

% {{{ PARTE C
  temaC = {
    \repeat volta 2 {
      g16 a bes a bes4 | d16 e d cis d4 | cis16 e d cis bes d bes a | g a bes cis d4 | 
      g,16 a bes a bes4 | d16 e d cis d4 | cis16 e d cis bes d bes a | b a bes a g4 |
    } 
    g'16 fis ees d ees4 | g16 fis ees d c4 | g'16 fis ees d ees4 | g16 fis ees d c4 |
  }

  accordiC = \chordmode{
    \repeat volta 2{
      g2:m | g2:m | d2 | g2:m | 
      g2:m | g2:m | d2 | g2:m | 
    }
    c2:m | c2:m | c2:m | c2:m | 
  }
% }}}

% {{{ PARTE D
  temaD = {
    \repeat volta 2 {
      bes'8 bes16 a g8 d' | bes16 d a bes g8 d' | bes bes16 a g8 d' | bes16 d a bes16 g4 |
    } 
  }

  accordiD = \chordmode{
    \repeat volta 2{
      g2:m | g2:m | g2:m | d4 g4:m |
    }
  }
% }}}

% LYRICS {{{
testoCompleto=\markup {
  \vspace #2
  \fill-line {
    \hspace #1
    \column {
      \line {Jovno,Jovanke }
      \vspace #1
      \line {Jovano,Jovanke }
    }
    \hspace #2
    \column \italic {
      \line {Jovano, Jovanke,}
      \vspace #1
      \line {Jovano, Jovanke,}
    }
    \hspace #1
  }
}
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break
  \mark \default
  \temaB \break
  \mark \default
  \temaC \break \bar "||"
  \mark \default
  \temaD 
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
    \accordiB
    \accordiC
    \accordiD
  }
}

temaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \tema }

scoreContent = << 
  \chordsPart
  \temaPart
>>
%}}}

% {{{ BOOKS
  \book{
    \bookOutputName \myFname
    \bookOutputSuffix "C"
    \score {
      \scoreContent
      \layout {}
      \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 190 4) } }
    }
    \testoCompleto
  }

  \book{
    \bookOutputName \myFname
    \bookOutputSuffix "Bb"
    \score { \transpose c d {\scoreContent} }
    \testoCompleto
  }

  \book{
    \bookOutputName \myFname
    \bookOutputSuffix "Eb"
    \score { \transpose ees c { \scoreContent } }
    \testoCompleto
  }
% }}}
