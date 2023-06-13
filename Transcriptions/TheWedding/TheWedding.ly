% {{{ PARAMETRI
  myTitle = "The Wedding"
  myFname = "TheWedding"
  mySubTitle = "Abdullah Ibrahim"
  myKey = \key f \major
  myTime = \time 4/4 
  myTempo =  #(ly:make-moment 190 4)
% }}}

% INTESTAZIONE {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"
%}}}

% {{{ PARTE A
  temaA = {
    \partial 4 c,4 |
    \repeat volta 2 {
      bes'2.~ bes8 a | g2 c2 | f,1~ | f2 r4 f4 | \break
      e'2. d4 | c bes a g8 f | g1~ | g2 r4 c,4 | \break
      bes'2.~ bes8 a | g2 c2 | f,1~ | f2 r4 d4 | \break
      a' bes g f | f2 e | f1~ | f2 r2 |
    }
  }

  temaAdue = {
    \partial 4 s4 |
    \repeat volta 2 {
      r4 f,2. | c'4 d e2 | d2. \trip bes8 a g | a2 e'8 d a4~ |
      a4 f2 c4 | bes4 c d d | f2 c | e c |
      r4 f2. | c'4 d e2 | d2. \trip bes8 a g | a4 bes c f |
      d2 bes2 | a4 c2 bes4~ | bes1 | a2 r2 |
    }
  }

  accordiA = \chordmode{
    \partial 4 s4 |
    \repeat volta 2 {
      bes1:/f | c1:/e | bes1:/d | f1:/c |
      bes1:maj7 | g4:m f:/a g:m/bes b:dim | c1:7sus4 | c1:7/e |
      bes1:/f | c1:/e | bes1:/d | f1:/c |
      bes2.:6 g4:m7 | f2:/c c2:7 | f1:7sus4 | f1 | 
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    \repeat volta 2 {
      f1 | e8 g f e d4 c | c'1~ | c2 r4 f, | \break
      c'2. bes4 | a2 g4. f8 | g1~ | g2 r2 |\break
      f1 | e2 g | f2. c8 d | ees2. f4 | \break
      c'2. bes4 | a2 g4. f8 | g1~ | g2 r4 c,4 |\break
      bes'2.~ bes8 a | g2 c2 | f1~ | f2 r4 d,4 | \break
      a' bes g f | f2 e | f1~ | f2 r2 |
    }
  }

  temaBdue = {
    \repeat volta 2 {
      r2 d2 | c4 bes8 a g4 f | f8 a g f e4 c | d2 r4 c |
      bes1\startTrillSpan | b | c4 d f2 | g2\stopTrillSpan r |
      r2 a | cis bes | a4 c8 cis d4 a' | g g8 f g f d4 |
      c2. d4 | d2 e | c4 g f2 | e2 r2 | 
      r4 f2. | c'4 d e2 | d2. \trip bes8 a g | a4 bes c f |
      d2 bes2 | a4 c2 bes4~ | bes1 | a2 r2 |
    }
  }


  accordiB = \chordmode{
    \repeat volta 2 {
      d1:m | c2 g2:m/bes | f1:/a | f2.:7 f4:/a |
      bes1:maj7 | b:dim | c:7sus4 | c2.:7/e cis4:dim7 |
      d1:m | a:7/cis | f2.:/c f4:7 | f2.:7 f4:/a | 
      bes1:maj7 | b1:dim | c1:7sus4 | c:7/e |
      bes1:/f | c1:/e | bes1:/d | f1:/c |
      bes2.:6 g4:m7 | f2:/c c2:7 | f1:7sus4 | f1 | 
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

temadue = \relative c' {
  \temaAdue
  \temaBdue
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

temaduePart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \temadue }

scoreContent = << 
  \chordsPart
  \temaPart
  \temaduePart
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
