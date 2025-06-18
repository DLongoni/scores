% {{{ PARAMETRI
  myTitle = "Daissa"
  myFname = "Daissa"
  myKey = \key f \major
  myTime = \time #'(3 2) 5/8 
  myTempo =  #(ly:make-moment 70 4)
% }}}

% INTESTAZIONE {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"
%}}}

%  {{{ PARTE Intro
  temaIntro = {
    \key f \minor
    \repeat volta 2 {
      f,4 c'8 b c | aes g f g4 | f c'8 b c | d ees d c c | 
      f,4 c'8 b c | aes g f g aes | 
    }
    \alternative {
      { f4 r8 r4 | r8 d'16 ees d8 c c | }
      { f,4 r8 r4 | }
    }
  } 

  accordiIntro = \chordmode{
    \repeat volta 2{
      f1*5/8:m | c1*5/8:7 | f1*5/8:m | c1*5/8:7 |
      f1*5/8:m | c1*5/8:7 | 
    }
    \alternative {
      { f1*5/8:m | f4.:m c4:7 | }
      { f1*5/8:m | }
    }
  }

  silenzioIntro = 
    \repeat volta 2{
      s1*5/8 | s1*5/8 | s1*5/8 | s1*5/8 |
      s1*5/8 | s1*5/8 |
    }
    \alternative {
      { s1*5/8 | s1*5/8 | }
      { s1*5/8 | }
    }
%  }}}

% {{{ PARTE A
  temaA = {
    \key f \major
    \repeat volta 2{
      d4 a'8 gis a | f e d e4 | d4 a'8 gis a | b c b a a |
      d,4 a'8 gis a | f e d e4 | 
    }
    \alternative {
      { d4 r8 r4 | r8 b'16 c b8 a a | }
      { d,4 r8 r4 | r4. r4 | }
    }
  }

  accordiA = \chordmode{
      \repeat volta 2{
        d1*5/8:m | a1*5/8:7 | d1*5/8:m | a1*5/8:7 |
        d1*5/8:m | a1*5/8:7 | 
      }
      \alternative {
        { d1*5/8:m | d4.:m a4:7 | }
        { d1*5/8:m | d1*5/8:m | }
      }
    }

    temaAdue = 
    {
      \repeat volta 2{
        a4.~ a4~ | a4 gis8 f4 | b4.~ b4~ | b4.~ b4 |
        c8 d4~ d4~ | d4 f8 e4 |
      }
      \alternative {
        { cis1*5/8~ | cis1*5/8 | }
        { d'1*5/8~ | d1*5/8 | }
      }
    }

    silenzioA = 
    \repeat volta 2{
      s1*5/8 | s1*5/8 | s1*5/8 | s1*5/8 |
      s1*5/8 | s1*5/8 |
    }
    \alternative {
      { s1*5/8 | s1*5/8 | }
      { s1*5/8 | s1*5/8 | }
    }
% }}}

% {{{ PARTE B
  temaB = {
    \repeat volta 2{
      c'8 c c b bes | a bes a cis4 | r8 c c b bes | a bes a cis4 |
      c8 c c b bes | a bes a cis4 | r8 c c b bes | a bes a cis e |
    }
  }

  temaBdue = {
    \repeat volta 2{
      c'8 c c b bes | a bes a cis8 | r8 c c b bes | a bes a cis4 |
      c'8 c c b bes | a bes a cis8 | r8 c c b bes | a bes a cis e |
    }
  }

  accordiB = \chordmode{
    \repeat volta 2{
      c1*5/8 | a1*5/8 | c1*5/8 | a1*5/8 |
      c1*5/8 | a1*5/8 | c1*5/8 | a1*5/8 |
    }
  }

  silenzioB = {
    \repeat volta 2{
      s1*5/8 | s1*5/8 | s1*5/8 | s1*5/8 |
      s1*5/8 | s1*5/8 | s1*5/8 | s1*5/8 |
    }
  }
% }}}

% {{{ PARTE C
  temaC = {
    \repeat volta 2 {
      f4. e8 g | f4. g8 f | e f g a g | f a a g a |
      f4. e8 g | f4. g8 f | e f g a g | f4. r4 |
      a4. g8 bes | a4. bes8 a | g a bes des bes | a bes a g bes |
      a4. g8 bes | a4. bes8 a | g a bes des bes | a4. r4 |
    } 
  }

  temaCdue = {
    \repeat volta 2 {
      d,4. cis8 e | d4. e8 d | cis d e f e | d f f e f |
      d4. cis8 e | d4. e8 d | cis d e f e | d4. r4 |
      f4. e8 g | f4. g8 f | e f g a g | f a a g a |
      f4. e8 g | f4. g8 f | e f g a g | f4. r4 |
    } 
  }

  accordiC = \chordmode{
    \repeat volta 2{
      g1*5/8:m | d1*5/8:m | a1*5/8:7 | d1*5/8:m |
      g1*5/8:m | d1*5/8:m | a1*5/8:7 | d1*5/8:m |
      g1*5/8:m | d1*5/8:m | a1*5/8:7 | d1*5/8:m |
      g1*5/8:m | d1*5/8:m | a1*5/8:7 | d1*5/8:m |
    }
  }

  silenzioC = {
    \repeat volta 2{
      s1*5/8 | s1*5/8 | s1*5/8 | s1*5/8 |
      s1*5/8 | s1*5/8 | s1*5/8 | s1*5/8 |
      s1*5/8 | s1*5/8 | s1*5/8 | s1*5/8 |
      s1*5/8 | s1*5/8 | s1*5/8 | s1*5/8 |
    }
  }
% }}}

% {{{ PARTE D
  temaD = {
    \repeat volta 2 {
      bes8 a g bes g | a g f e f | g f e d cis | e4. r8 f |
      e1*5/8 | f1*5/8 | g1*5/8 | g1*5/8 | \break
      c4 bes8 a g | c4 bes8 a g | cis1*5/8~ | cis8 bes a g f |
      e f g e c | f4 f8 a f | e f16 e d8 cis bes | a g bes a4 |
    } 
  }

  accordiD = \chordmode{
    \repeat volta 2{
      c1*5/8 | f1*5/8 | a1*5/8:7 | a1*5/8:7 |
      c1*5/8 | f1*5/8 | a1*5/8:7 | a1*5/8:7 |
      c1*5/8 | f1*5/8 | a1*5/8:7 | a1*5/8:7 |
      c1*5/8 | f1*5/8 | a1*5/8:7 | a1*5/8:7 |
    }
  }

  silenzioD = {
    \repeat volta 2{
      s1*5/8 | s1*5/8 | s1*5/8 | s1*5/8 |
      s1*5/8 | s1*5/8 | s1*5/8 | s1*5/8 |
      s1*5/8 | s1*5/8 | s1*5/8 | s1*5/8 |
      s1*5/8 | s1*5/8 | s1*5/8 | s1*5/8 |
    }
  }
% }}}

% SCORE {{{
tema = \relative c' {
  \mark "Intro"
  \temaIntro \break
  \mark \default
  \temaA \break
  \mark \default
  \temaB \break 
  \mark \default
  \temaC \break 
  \mark \default
  \temaD \break 
}

temaseconda = \relative c' {
  \silenzioIntro
  \temaAdue
  \silenzioB
  \temaCdue
  \silenzioD
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiIntro
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

temasecondaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \temaseconda }

scoreC = <<
  \chordsPart
  \temaPart
  \temasecondaPart
>>

scoreBb = <<
  \transpose c d { \chordsPart }
  \transpose c d { \temaPart}
  \transpose c d { \temasecondaPart}
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

  \book{
    \bookOutputName \myFname
    \bookOutputSuffix "Eb"
    \header{ composer="Eb" }
    \score { \transpose ees c { \scoreC } }
  }
% }}}
