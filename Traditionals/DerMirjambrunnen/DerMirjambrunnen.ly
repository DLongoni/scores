% {{{ PARAMETRI
  myTitle = "Der Mirjambrunnen"
  mySubTitle = ""
  myKey = \key f \major
  myTime = \time 4/4 
  myTempo =  #(ly:make-moment 100 4)
% }}}

% INTESTAZIONE {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"
%}}}

% {{{ PARTE A
  temaA = {
    \partial 4 d8 f |
    \repeat volta 2 {
      a4. d8 c bes a g | a4 bes8 a g4 d8 e | f8 g16 f e8 f g c, f g | a2 r8 e f g | 
      a4. d8 c b a g | a4 g4 f e8 f | g4 g8 a f e g f |
    } 
    \alternative{
      {d2. d8 f|}
      {d2. cis8 d|}
    }
  }

  accordiA = \chordmode{
    \partial 4 s4 |
    \repeat volta 2 {
      d2:m c2 | f2 g2 | bes2 c2 | f2 a2 | d2:m c2 | a2 bes2 | g2:m a2 |
    } 
    \alternative{
      {d1:m|}
      {d1:m|}
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    \new Voice <<
      {s8 bes' bes a g4 f8 g | a bes a g f f g a | bes4 bes8 d c bes a g | a4 e f g |}
      {d8 d d f e4 d8 e | f g f e d d e f | d4 d8 f e g f e | f4 cis d e |}
    >>
    a4. d8 c bes a g | a4 bes8 a g4 d8 e | f4 e8 f a g e8. f16 | d2. cis4 |
  }

  accordiB = \chordmode{
    g2:m c2 | f2 d2:m | g2:m c2 | a1 | d2:m c2 | f2 g2 | bes2 a2 | d1:m |
  }
% }}}

% {{{ PARTE C
  temaC = {
    \repeat volta 2
    {
      \new Voice <<
        {s4 d' c bes8 a | bes s8 bes4 a2 | s8 bes4 bes8 a4 s8 s8 |}
        {d,4 bes' a g8 f | d r8 d4 f2 | r8 d4 d8 f4 g8 f|}
      >>
      gis8 f e d cis g' f e |  
      \new Voice <<
        {s4 d' c bes8 a | bes s8 bes4 a4. s8 |}
        {d,4 bes' a g8 f | d r8 d4 f4. d8 |}
      >>
      d8 g a bes f g16 f e8 d | 
      \new Voice <<
        {f4 e d d8 d|}
        {b4 cis s4 s8 s8|}
      >>
    }
  }

  accordiC = \chordmode{
    \repeat volta 2{
      bes2 f2 | g2:m d2:m | g2:m d2:m | e2 a2 | bes2 f2 | g2:m d2:m | g2:m d2:m | g4 a4 d2:m |
    }
  }
% }}}

% {{{ PARTE Adue
  temaAdue = {
    a'4. d8 c bes a g | a4 bes8 a g4 d8 e | f8 g16 f e8 f g c, f g | a2 r8 e f g | 
    a4. d8 c bes a g | a cis f e d4 d8 e | f4 d8 f a g f e | d2~ d8 g f e |
    d2~ d8 bes a g | f e d c b bes a f' | d1 |
  }

  accordiAdue = \chordmode{
    d2:m c2 | f2 g2 | bes2 c2 | f2 a2 | d2:m c2 | a2 bes2 | g2:m a2 | d2:m g2:m | d2:m g2:m | bes2 g4:m a4 | d1:m |
  }
% }}}

% LYRICS {{{
testoCompleto=\markup { }
% }}}

% SCORE {{{
tema = \relative c {
  \mark \default
  \temaA \break \bar "||"
  \mark \default
  \temaB \break
  \mark \default
  \temaC \break 
  \mark \markup{ \box \bold{A2} }
  \temaAdue 
  \bar "|."
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
    \accordiB
    \accordiC
    \accordiAdue
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
