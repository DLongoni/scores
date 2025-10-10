% {{{ PARAMETRI
  myTitle = "Waking Dreaming"
  myFname = "WakingDreaming"
  myKey = \key c \major
  myTime = \time 2/4 
  myTempo =  #(ly:make-moment 60 4)

  struttura = \markup {
    \column {
        \line{ \bold{A} Bass, \bold{A} Bass+Gtr, \bold{A} Bass+Gtr+Fisa, \bold{A} Tema Gtr 8vb}
        \line{ \bold{A} Bass+Gtr+Fisa, \bold{A} Gtr 8va, \bold{A}x2 Tr}
        \line{ \bold{B} Fisa, \bold{B} Solo Fisa, \bold{B} Solo Tr, \bold{B} Tr+II voce Fisa, \bold{Ending B3}, \bold{A} solo Guit, \bold{A}x2 Tr, \bold{A} Gtr}
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
      g'4 c | bes g8 f | a4 a8 f | g2^\markup{\italic \lower #1 "al "\musicglyph #"scripts.coda"}
 |
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
         { e4 d~ | d2 | a'4 g~ | g2 |
          e4 d4~ | d2 | a'2 | g | }
         { a,4 g~ | g2 | d'4 c~ | c2 |
         a4 g~ | g2 | e'2 | d | }
         { c,4~ c~ | c2 | f4~ f~ | f2 |
          c4~ c~ | c2 | f2~ | f2 | }
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
    \repeat volta 2 {
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
    }
    \alternative{
      { ees16 f d4~ d4. |  r4. f,8 fis g | }
      { ees'16 f d4~ d4. | r2. | }
      {\time 2/4 
        ees16 f d8~ d4 | 
       \new Voice
           << {ees16 f ees8 d16 e d8 |} 	
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
      ees,8 g d' ees d ees | f4 ees8 d ees e |
    }
    \alternative{
      { f2. | r2. | }
      { f2. | r2. | }
      {\time 2/4  f2 | aes,8 c g a | }
    }
}

  accordiB = \chordmode{
    \repeat volta 3 {
      c2.:m | bes2. | f4.:m g4.:7 | c2.:m | \break
      c2.:m | f2. |
    }
    \alternative
    {
      { g2.:7 | bes2.: | }
      { g2.:7 | bes2.: | }
      {\time 2/4 g2:7 | aes4:7 g:7 | }
    }
  }

  bassoB = {
    \key c \minor
    \repeat volta 3 {
      c4. aes | bes g | f4 aes8 g4. | c4. ees4 bes8 |
      c4. g | f a | 
    }
    \alternative
    {
      { g4. b | bes8 r4  f8 fis g | }
      { g4. b | bes4. r4. | }
      {\time 2/4 g8 b g f | aes c g4 | }
    }
  }

  silenzioB = {
    \time 6/8
    \repeat volta 3{
      s2. | s2. | s2. | s2. | 
      s2. | s2. |
    }
    \alternative{
      { s2. |  s2. | }
      { s2. |  s2. | }
      {\time 2/4 s2 | s2 | }
    }
  }
% }}}

% {{{ PARTE Coda
  temaCoda = {
    \time 2/4
    g8 d bes' g | a f c' a | bes g d' bes | c2~\< | c4\staccato r4\! |
  }

  temaCodaDue = {
    \trip g8 bes d \trip g f g | \trip a g f \trip ees d f | 
    ees4 f | e2~\< | e4\staccato r4\! |
  }

  temaCodaTre = {
    \key c \minor
    g8 bes g bes | f a f a | ees g d g | c,2~\< | c4\staccato r4\! |
  }

  accordoniCoda = {
    \repeat volta 2 {
       \new Voice <<
         { r4 bes | a2 | bes4 bes4 | r4 b4~ | b4\staccato r4 | }
         { r4 f | f2 | g4 f | r8 g~ g4~ | g4\staccato r4 | }
         { r4 d | d2 | ees4 d | e2~\< | e4\staccato r4\! | }
       >>
    }
  }

  accordiCoda = \chordmode{
    g2:m | f2 | ees4 bes4 | c2 | c2 |
  }

  bassoCoda = {
    r8 g~ g ges | f a c d | ees d bes d | c2~\< | c4\staccato r4\! |
  }
% }}}

% SCORE {{{
tema = \relative c' {
  \tempo 4 = 64
  \mark \default
  \temaA \break
  \tempo \markup{ \hspace #-8.0 } 4 = 68
  \mark \default
  \temaB \break
  \bar "||"
  \mark \markup { \musicglyph #"scripts.coda"}
  \temaCoda \break
  \bar "|."
}

temaDue = \relative c' {
  \accordoniA
  \temaBdue 
  \temaCodaDue
}

temaTre = \relative c' {
  \key c \minor
  \silenzioA
  \silenzioB
  \temaCodaTre
}

voicing = \relative c' {
  \silenzioA
  \silenzioB
  \accordoniCoda
}

basso = \relative c {
  \bassoA \break
  \bassoB
  \bassoCoda
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
    \accordiB
    \accordiCoda
  }
}

temaPart = \new Staff \with {
  instrumentName = ""
} { \clef "treble_8" \global \tema }

temaDuePart = \new Staff \with {
  instrumentName = ""
} { \clef "treble_8" \global \temaDue }

temaTrePart = \new Staff \with {
  instrumentName = ""
} { \clef "treble_8" \global \temaTre }

voicingPart = \new Staff \with {
  instrumentName = ""
} { \clef "treble_8" \global \voicing }

bassoPart = \new Staff \with {
  instrumentName = ""
} { \clef "bass" \basso }

ritmicaPart = \new Staff \with {
  instrumentName = ""
} { \clef "treble_8" 
      \new Voice <<  
        \relative c'' {\ritmicaAuno }
        \relative c' {\ritmicaAdue }
      >>
      \key c \minor
      \silenzioB
      \accordoniCoda
}

scoreContent = << 
  \chordsPart
  \temaPart
  \temaDuePart
  \temaTrePart
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
