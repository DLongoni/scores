% {{{ PARAMETRI
  myTitle = "Waking Dreaming"
  myFname = "WakingDreaming"
  myKey = \key c \major
  myTime = \time 2/4 
  myTempo =  #(ly:make-moment 60 4)

  struttura = \markup {
    \column {
        \line {\bold{A} Bass, \bold{A} Bass+Tr, \bold{A} Bass+Tr+Chords, \bold{A} solo II voci, \bold{A} II voci+Tr, \bold{A} Gtr}
        \line{ \bold{B} Fisa, \bold{solo} Fisa, \bold{B} Tr+II voce Fisa, \bold{Ending B3}}
        \line{\bold{A}x1 Tr, \bold{A} solo Gtr}
      }
    }
% }}}

% INTESTAZIONE {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"
%}}}

% {{{ PARTE A
  temaA = {
    \repeat volta 2{
      g4 c bes g8 f | g4 f8 ees | f ees c bes |
      g'4 c | bes g8 f | a4 a8 f | g2 |
    }
  }

  ritmicaAuno = {
    \repeat volta 2{
      g16 a g8 ees16 f ees8 | d16 ees d8~ d4 |
      c16 d c8 c16 des c8 | a16 bes a8~ a4 |
      g'16 a g8 ees16 f ees8 | d16 ees d8~ d4 |
      c16 d c8~ c4 | b16 c b8~ b4 |
    }
  }

  ritmicaAdue = {
    \repeat volta 2{
      d16 e d8 c16 d c8 | bes16 c bes8~ bes 4|
      a16 bes a8 aes16 bes aes8 | f16 g f8~ f4 |
      d'16 e d8 c16 d c8 | bes16 c bes8~ bes 4|
      a16 bes a8~ a4 | f16 g f8~ f4 |
    }
  }

  accordoniA = {
    \repeat volta 2 {
       \new Voice <<
         { d2~ | d2 | g~ | g |
          d2~ | d2 | g~ | g | }
         { g,2~ | g2 | c~ | c |
         g2~ | g2 | d'~ | d | }
         { c,2~ | c2 | f2~ | f2 |
          c2~ | c2 | f2~ | f2 | }
       >>
    }
  }

  accordiA = \chordmode{
    \repeat volta 2{
      c4:maj7 aes:maj7 | bes2:7 | g4:m7 des:6.9 | f2:7 |
      c4:maj7 aes:maj7 | bes2:7 | a2:m7 | g2:7 |
    }
  }

  bassoA = {
    \repeat volta 3 {
      c4 aes | bes2 | g4 des' | f,2 |
      c'4 aes | bes2 | a2 | g2 |
    }
  }

  silenzioA = {
      s2 | s2 | s2 | s2 | 
      s2 | s2 | s2 | s2 | 
  }
% }}}

% {{{ PARTE B
  temaB = {
    \time 6/8
    \key c \minor
    \repeat volta 3 {
      c,8 ees g c b c | d c bes aes g bes | 
      f4. g4 f16 g | f ees  c4~ c4. |
      c8 ees g c b c | a4 a8 g b c | 
      ees16 f d4~ d4. | 
    }
    \alternative{
      { r4. f,8 fis g | }
      { r2. | }
      {\time 2/4 
       \new Voice
           << {ees'16 f ees8 d16 e d8 |} 	
              {aes'16 bes aes8 g16 a g8 |}
           >>
        }
    }
}

  temaBdue = {
    \time 6/8
    \key c \minor
    \repeat volta 3 {
      ees8 g d' ees d ees | f ees d c bes d | aes4. bes4. | c2. |
      ees,8 g d' ees d ees | f4 ees8 d ees e | f2. |
    }
    \alternative{
      { r2. | }
      { r2. | }
      {\time 2/4 aes,8 c g a | }
    }
}

  accordiB = \chordmode{
    \repeat volta 3 {
      c2.:m | bes2. | f4.:m g4.:7 | c2.:m | \break
      c2.:m | f2. | g2.:7 |
    }
    \alternative
    {
      { bes2.: | }
      { bes2.: | }
      {\time 2/4aes4:7 g:7 | }
    }
  }

  silenzioB = {
    \time 6/8
    \repeat volta 2{
      s2. | s2. | s2. | s2. | 
      s2. | s2. | s2. | 
    }
    \alternative{
      { s2. | }
      { s2. | }
      { s2. | }
    }
  }
% }}}

% {{{ PARTE C
  temaC = {
    \time 2/4
    \key c \major
    \mark \markup {
      \hspace #44
      "Going from B to A play this on the last bar of B"
    }
      r2 |  g4 c |
  }

  ritmicaCuno = {
    \time 2/4
      ees16 f ees8 d16 e d8 | c16 d c8~ c4 |
  }

  ritmicaCdue = {
    \time 2/4
      aes16 bes aes8 g16 a g8 | e16 fis e8 ees4 |
  }

  accordiC = \chordmode{
    \time 2/4
      aes4:7 g:7 | c4:maj7 aes:maj7 | 
  }

  bassoC = {
    \time 2/4
    aes8 c g a | c4 aes4 |
  }

  silenzioC = {
    \time 2/4
      s2 | s2 |
  }
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break
  \mark \default
  \temaB \break
  \bar "|."
}

temaDue = \relative c' {
  \accordoniA
  \temaBdue 
}


basso = \relative c {
  \bassoA \break
  \silenzioB
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

temaDuePart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \temaDue }

bassoPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "bass" \basso }

ritmicaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" 
      \new Voice <<  
        \relative c'' {\ritmicaAuno }
        \relative c' {\ritmicaAdue }
      >>
        \silenzioB
}

scoreContent = << 
  \chordsPart
  \temaPart
  \temaDuePart
  \ritmicaPart
  \bassoPart
>>
%}}}

% {{{ BOOKS
  \book{
    \bookOutputName \myFname
    \struttura
    \markup { \vspace #1 }
    \header{ composer="C" }
    \bookOutputSuffix "C"
    \score {
      \scoreContent
      \layout {}
      \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 90 4) } }
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
