% {{{ PARAMETRI
  myTitle = "Anywhere Else"
  myFname = "AnywhereElse"
  mySubTitle = "Serbian"
  myKey = \key g \major
  myTime = \time 4/4 
  myTempo =  #(ly:make-moment 140 4)
% }}}

% INTESTAZIONE {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"
%}}}

% {{{ PARTE A
  temaA = {
    \repeat volta 3 {
      g4. d'8~ d4 r8 b | \trip fis4 g d' \trip f, c' d | 
      gis,4. d'8~ d4 r8 b | \trip a4 c d \trip g, c d |
      fis,4. d'8~ d4 r8 c | \trip aes4 des ees \trip f8~ f des r8 bes16 aes |
    } 
    \alternative{
      { g2 r8 ees'8~ ees4 | d8 bes r aes r fis8~ fis4 | }
      { g2 r8 ees'8~ ees4~ | ees4 r4 c8 bes r aes8 | g1 | }
      { g2 r8 ees'8~ ees4~ | ees4 r4 c8 bes r aes8 | g1 | }
    }
  }

  accordiA = \chordmode{
    \repeat volta 3 {
      g1 | b2:m ees2:maj7 | e1:7 | a2:m f2 | 
      d1:7 | des2 bes2:m |
    }
    \alternative{
      { ees1 | e2:7.11+ aes2:7 | }
      { ees1 | e2:m7+ aes2:maj7 | ees1 | }
      { ees1 | e2:m7+ aes2:7 | g1 | }
    }
  }
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break
  \bar "|."
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
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
  }

  \book{
    \bookOutputName \myFname
    \bookOutputSuffix "Bb"
    \score { \transpose c d {\scoreContent} }
  }
% }}}
