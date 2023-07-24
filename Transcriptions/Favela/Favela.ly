% {{{ PARAMETRI
  myTitle = "Favela"
  myFname = "Favela"
  myKey = \key c \major
  myTime = \time 2/4
  myTempo =  #(ly:make-moment 70 4)
% }}}

% INTESTAZIONE {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"
%}}}

% {{{ PARTE A
  temaA = {
    \partial 8 e8 |
    \repeat volta 2{
      a4. e8 | g4. e8 | a8. b16 a8 e | g4. e8 | 
      a8. b16 a8 e | g4. e8 | c2~ | c4. a8 | \break
      d4. c8 | e4. d8 | e4 r16 g r a | c8 a16 g r e8. |
      d8 c16 e r d r c | a8 g16 e r g8. | b16 g a8~ a4~ | a2 |
    }
  }

  accordiA = \chordmode{
    \partial 8 s8 |
      \repeat volta 2{
        a2 | g2 | a2 | g2 |
        a2 | g2 | a2:m7 | a2:7.13- |
        d2:m7 | g:13 | des2:m7.5- | c2:maj7 |
        f2:6 | a4:m7 e4:m7 | a2 | a2 |
      }
    }

% }}}

% {{{ PARTE B
  temaB = {
    \repeat volta 2{
      d8. f8. d8~ | d16 c8 c16 c8 a | d8. f8. d8~ | d16 c8 c16 c8 r |
      d8. f8. d8~ | d16 c8 c16 c8 a | aes'8. g8. f8~ | f4 r4 |
    }
  }

  accordiB = \chordmode{
      \repeat volta 2{
        d2:m7 | a2:m7 | d2:m7 | a2:m7 |
        d2:m7 | a2:m7 | f8.:7.9+ e8.:7.9+ d8:7.9+ | d2:7.9+ |
      }
    }

% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break
  \mark \default
  \temaB \break
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
    \accordiB
  }
}

temaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \tema }

scoreC = <<
  \chordsPart
  \temaPart
>>

scoreBb = <<
  \transpose c d { \chordsPart }
  \transpose c d { \temaPart}
>>
%}}}

% {{{ BOOKS
  \book{
    \bookOutputName \myFname
    \markup { \vspace #1 }
    \bookOutputSuffix "C"
    \header{ composer="C" }
    \score {
      \scoreC
      \layout {
        indent = #0
      }
    }
  }

  \book{
    \bookOutputName \myFname
    \markup { \vspace #1 }
    \bookOutputSuffix "Bb"
    \header{ composer="Bb" }
    \score {
      \scoreBb
      \layout {
        indent = #0
      }
    }
  }
% }}}
