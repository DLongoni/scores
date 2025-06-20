% {{{ PARAMETRI
  myTitle = "At the Wrong Time"
  myFname = "AtTheWrongTime"
  myKey = \key bes \major
  myTime = \time 9/8 
  myTempo =  #(ly:make-moment 60 4)

  struttura = \markup {
    \column {
      \line {\bold{Ax2} Tr, \bold{B} libera Dr+Bass, \bold{Bx2} Gtr+Fisa, \bold{B} stacchi, }
      \line{\bold{C} Fisa, \bold{C} Tr, \bold{D} Tr, \bold{E} solo Fisa+Bass, \bold{E} solo Tr, 
        \bold{E} stacchi Fm, \bold{Break} sample,}
      \line{\bold{E} in Fm solo Tr, \bold{B} solo Tr, \bold{B} stacchi, \bold{C} Fisa, \bold{A} Gtr, \bold{Coda}}
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

  bassoA = {
    \partial 4. s4. |
    bes4. d4. bes4. | aes4.~ aes8 c4~ c4. | bes4. d4. bes4. | g4.~ g8 bes4~ bes4. | 
    bes4. des4. bes4. | ges4.~ ges8 bes4~ bes4. | f4. a4. d4. | f4 c8 r4 g8 a4. |
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
      g2. bes4. | c4. d2. |
      g,2. d'4. | 
      \time 6/8
      c4. f,4. |
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

  riffBbembeya = \relative c''{
     \new Voice <<
       {bes1*9/8 | g8 c4 r2. | bes8 d4~ d4. r4. | r8 d c bes a r | } 
       {g1*9/8 | e8 a4 r2. | g8 bes4~ bes4. r4. | r8 bes a g f r | } 
       {e1*9/8 | d8 g4 r2. | e8 a4~ a4. r4. | r8 f e d c r | } 
     >>
  }

  silenzioB = {
    \repeat volta 2{
      s1*9/8 | s1*9/8 | s1*9/8 | 
      \time 6/8
      s2. |
    }
  }

  bassoBstacchi = {
    \time 9/8
    g4 g8 r4. c4 c8 | r4. d4 d8 r4. |
    g,4 g8 r4. c4 c8 | 
  }
  
  accordiBstacchi = \chordmode{
    \time 9/8
    g2.:m7 c4. | c4.: d2.:m7 |
    g2.:m7 c4. | 
  }

  silenzioBstacchi = { s1*9/8 | s1*9/8 | s1*9/8 | }
% }}}

% {{{ PARTE C e D
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
    c2. e4. | d2. r4. | r1*9/8 |
  }

  bassoC = {
    \partial 4. s4. |
    \time 9/8
    \repeat volta 2{
      bes4. d4. bes4. | aes4.~ aes8 c4~ c4. | bes4. d4. bes4. | g4.~ g8 bes4~ bes4. | 
      f4. a4. c4. | d c d | ees4.~ ees4 ees8 g4 ees8 | bes'4 g8 f4 ees8 d4 a8 |
    }
    bes4. bes2. | aes1*9/8 | bes4. bes2. | g1*9/8 | f1*9/8| g4 g8 r4 bes8 r4 d8 | g,1*9/8 |
  }

  silenzioC = {
    \partial 4. s4. |
    \time 9/8
    \repeat volta 2{
      s1*9/8 | s1*9/8 | s1*9/8 | s1*9/8 | 
      s1*9/8 | s1*9/8 | s1*9/8 | s1*9/8 |
    }
    s1*9/8 | s1*9/8 | s1*9/8 | s1*9/8 | 
    s1*9/8 | s1*9/8 | s1*9/8 | 
  }

  accordiC = \chordmode{
    \partial 4. s4. |
    \time 9/8
    \repeat volta 2{
      bes1*9/8 | aes1*9/8 | bes1*9/8 | g1*9/8:m7 |
      f1*9/8 | d1*9/8:m | ees1*9/8 | ees1*9/8 |
    }
    bes1*9/8 | aes1*9/8 | bes1*9/8 | g1*9/8:m7 |
    f1*9/8 | g1*9/8:m | g1*9/8:m |
  }
% }}}

% {{{ PARTE E
  temaE = {
    \repeat volta 2{
      g,8 d bes' g4 f16 g16 f8 d bes~ |
      bes8 g bes c d e f4 d8 |
      g8 d bes' g4 f16 g16 f8 d bes~ |
      bes8 g bes c d e f4 d8 |
    }
  }

  temaEdue = {
    \repeat volta 2{
      bes8 g d' bes4 a16 bes16 a8 f e~ |
      e8 f g a c bes a4 f8 |
      bes8 g d' bes4 a16 bes16 a8 f e~ |
      e8 f g a c bes a4 f8 |
    }
  }

  bassoE = {
    \repeat volta 2{
      g4 g8 r4 bes8 r4 d8 | g,4.~ g4. r4. | 
      g4 g8 r4 d'8 r4 g,8 | bes4 g8~ g4 c8 d4. |
    }
  }

  bassoEdue = {
    \repeat volta 2{
      g4 g8 r8 a4 bes4. | d2. bes8 d8 r8 |
      g,4 g8 r8 a4 bes4. | d2. bes8 a8 r8 |
    }
  }

  silenzioE = {
    \repeat volta 2{
      s1*9/8 | s1*9/8 | s1*9/8 | s1*9/8 | 
    }
  }

  accordiE = \chordmode{
    \repeat volta 2{
      g1*9/8:m | g1*9/8:m | g1*9/8:m | g1*9/8:m |
    }
  }

  bassoEstacchi = {
    g,4 g8 r4. c4 c8 | r4. d4 d8 r4. |
    g,4 g8 r4. c4 f,8~ | f1*9/8 | 
  }
  
  accordiEstacchi = \chordmode{
    g2.:m7 c4. | c4.: d2.:m7 |
    g2.:m7 c4 f8:m | f1*9/8:m | 
  }

  silenzioEstacchi = { s1*9/8 | s1*9/8 | s1*9/8 | s1*9/8 | }
% }}}

% {{{ PARTE F
  temaF = {
    \key f \minor
    \repeat volta 2{
      f8 c aes' f4 ees16 f16 ees8 c aes~ |
      aes8 f aes bes c d ees4 c8 |
      f8 c aes' f4 ees16 f16 ees8 c aes~ |
      aes8 f aes bes c d ees4 c8 |
    }
  }

  temaFdue = {
    \key f \minor
    \repeat volta 2{
      aes8 f c' aes4 g16 aes16 g8 ees d~ |
      d8 ees f g bes aes g4 ees8 |
      aes8 f c' aes4 g16 aes16 g8 ees d |
      e8 f g a c bes a4 f8 |
    }
  }

  bassoF = {
    \key f \minor
    \repeat volta 2{
      f'4 f8 r4 aes8 r4 c8 | f,4.~ f4. r4. | 
      f4 f8 r4 c'8 r4 f,8 | aes4 f8~ f4 bes8 c4. |
    }
  }

  bassoFdue = {
    \key f \minor
    \repeat volta 2{
      f4 f8 r8 g4 aes4. | c2. aes8 c8 r8 |
      f,4 f8 r8 g4 aes4. | c2. aes8 g8 r8 |
    }
  }

  silenzioF = {
    \key f \minor
    \repeat volta 2{
      s1*9/8 | s1*9/8 | s1*9/8 | s1*9/8 | 
    }
  }

  accordiF = \chordmode{
    \key f \minor
    \repeat volta 2{
      f1*9/8:m | f1*9/8:m | f1*9/8:m | f1*9/8:m |
    }
  }
% }}}

% {{{ PARTE Coda
  temaCoda = {
    \key bes \major
    cis2. dis4. | eis2.~ eis4. |
    cis2.^\markup{ \italic{"rall."} } dis4. | eis2.~ eis4. |
  }

  silenzioCoda = {
    \key bes \major
      s1*9/8 | s1*9/8 |
      s1*9/8 | s1*9/8 |
  }

  bassoCoda = {
    \key bes \major
    a2. fis4. | f1*9/8 |
    a2. b4. | cis1*9/8 |
  }

  accordiCoda = \chordmode{
    \key bes \major
      a1*6/8 b4.:/fis | cis1*9/8:/f |
      a1*6/8 b4. | cis1*9/8 |
    }
% }}}

% SCORE {{{
  tema = \relative c' {
    \mark \default
    \tempo 4. = 116
    \temaA \break
    \mark \default
    \temaB \break
    \mark \markup{ \box \bold{"Stacchi B"} }
    \silenzioBstacchi \bar "||" \break
    \mark \default
    \temaC \bar "||" \break
    \mark \default
    \temaE \break
    \mark \markup{ \box \bold{"Stacchi E"} }
    \silenzioEstacchi \bar "||" \break
    \mark \default
    \tempo \markup{ \hspace #2.0 } 4. = 136
    \temaF \break
    \mark \markup { \musicglyph #"scripts.coda"}
    \temaCoda
    \bar "|."
  }

  temaEue = \relative c' {
    \silenzioA
    \temaBdue \silenzioBstacchi
    \silenzioC
    \temaEdue
    \silenzioEstacchi
    \temaFdue
    \silenzioCoda
  }

  chordsPart ={
    \new ChordNames {
      \set chordChanges = ##t
      \accordiA
      \accordiB
      \accordiBstacchi
      \accordiC
      \accordiE
      \accordiEstacchi
      \accordiF
      \accordiCoda
    }
  }

  ritmicaPart = \new Staff {
    \global
    \silenzioA
    \ritmicaB
    \silenzioBstacchi
    \silenzioC
    \silenzioE
    \silenzioEstacchi
    \silenzioF
    \silenzioCoda
  }

  bembeyaPart = \new Staff {
    \global
    \silenzioA
    \riffBbembeya
    \silenzioBstacchi
  }

  bassoPart = \new Staff \relative c{
    \clef "bass"
    \global
    \bassoA
    \bassoB
    \bassoBstacchi
    \bassoC
    \bassoE
    \bassoEstacchi
    \bassoFdue
    \bassoCoda
  }

  temaPart = \new Staff \with {
    instrumentName = ""
    midiInstrument = "piano"
  } { \clef "treble_8" \global \tema }

  temaPartDue = \new Staff \with {
    instrumentName = ""
    midiInstrument = "piano"
  } { \clef "treble_8" \global \temaEue }

  scoreContent = << 
    \chordsPart
    \temaPart
    \temaPartDue
    \ritmicaPart
    \bembeyaPart
    \bassoPart
  >>

  bassoPartShort = \new Staff \relative c{
    \clef "bass"
    \global
    \silenzioA
    \silenzioB
    \bassoBstacchi
    \silenzioC
    \silenzioE
    \relative c'{ \bassoEstacchi }
    \silenzioF
  }

  scoreContentShort = <<
    \chordsPart
    \temaPart
    \bassoPartShort
  >>

  scoreBb = <<
    \transpose c d { \chordsPart }
    \transpose c d, { \temaPart}
    \transpose c d { \bassoPartShort}
  >>
%}}}

% {{{ BOOKS
  \book{
    \bookOutputName \myFname
    \header{ composer="Parte completa" }
    \struttura
    \markup { \vspace #1 }
    \bookOutputSuffix "Complete"
    \score {
      \scoreContent
      \layout { indent = #0 }
    }
  }

  \book{
    \bookOutputName \myFname
    \header{ composer="Parte breve" }
    \struttura
    \markup { \vspace #1 }
    \bookOutputSuffix "Short"
    \score {
      \scoreContentShort
      \layout { indent = #0 }
    }
  }

  \book{
    \bookOutputName \myFname
    \struttura
    \markup { \vspace #1 }
    \header{ composer="Bb" }
    \bookOutputSuffix "Bb"
    \score { \scoreBb} 
  }
% }}}
