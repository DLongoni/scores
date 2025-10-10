% {{{ PARAMETRI
  myTitle = "Billy"
  myFname = "Billy"
  mySubTitle = "Luca Pedeferri"
  myKey = \key g \major
  myTime = \time 4/4 
  myTempo =  #(ly:make-moment 104 4)

  struttura = \markup {
    \column {
        \line { \bold{A} Bass, \bold{A} Gtr, \bold{A} Drums+Gtr+Fisa, \bold{A} tutti,
          \bold{Solo} Fisa, \bold{A} Bass, \bold{A} tutti }
        \line { \bold{B} Fisa, \bold{Bx2} tutti, \bold{Bridge} Gtr, \bold{Solo} Gtr+Tr, \bold{Bx2} tutti, \bold{A/2} Fisa, \bold{A/2} Tr}
      }
    }
% }}}

% INTESTAZIONE {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"

\header {
  arranger = \mySubTitle
}
%}}}

% {{{ PARTE A
  temaA = {
    fis,2. e4 | dis2. e4 | fis2. e4 | dis2. e4 | \break
    fis2. e4 | b'2. a8 gis | fis2. r4 | c1 | \break
    fis2. e4 | dis2. e8 g | fis2. e8 fis | dis2. e4 | \break
    fis2. e4 | b'2. a4 | fis1 | dis1 | \break 
  }

  temaAdue = {
    r4 b''4 cis2~ | cis4 dis4 cis2~ | cis4 b cis2~ | cis4 dis4 cis2~ |
    cis4 b4 cis2~ | cis4 dis4 fis,2 | r4 b8 cis dis2 | e1 |
    r4 b4 cis2~ | cis4 dis4 cis2~ | cis4 b cis2~ | cis4 dis4 cis2~ |
    cis4 bes4 ees2~ | ees4 dis4 fis,2 | r4 cis4 dis2 | g1 |
  }

  accordiA = \chordmode{
    b1:maj7 | e1:m7+ | b1:maj7 | e1:m7+ | b1:maj7 | a1:maj7 | gis1:m7 | a1:m6 |
    b1:maj7 | e1:m7+ | b1:maj7 | e1:m7+ | ees1:m7 | fis1:m7 | e1:maj7 | e1:m7+ |
  }

  ritmicaA = {
    <fis' b>4 <gis cis> <fis b> <dis gis> | <dis g> <fis b> <e g> <fis a> |
    <fis b>4 <gis cis> <fis b> <dis gis> | <dis g> <fis b> <e g> <fis a> |
    <fis b>4 <gis cis> <fis b> <dis gis> | <e a> <fis b> <fis gis> <e a> |
    <fis b>4 <gis cis> <fis b> <e ais> | <fis c'> <a d> <g c> <fis b> |
    <fis b>4 <gis cis> <fis b> <dis gis> | <dis g> <fis b> <e g> <fis a> |
    <fis b>4 <gis cis> <fis b> <dis gis> | <dis g> <fis b> <e g> <fis a> |
    <ges b>4 <aes des> <ges bes> <ees aes> | <e a> <fis b> <dis gis> <e a> |
    <fis b>4 <gis cis> <fis b> <dis gis> | <g b> <a cis> e8 b' fis'4 |
  }

  ritmicaAdue = {
    b''16 b r dis b r dis dis b8 r r b | b16 b r dis b r dis dis b8 r r b |
    b16 b r dis b r dis dis b8 r r b | b16 b r dis b r dis dis b8 r r b |
    b16 b r dis b r dis dis b8 r r b | a16 a r cis a r cis cis a8 r r a |
    b16 b r dis b r dis dis b8 r r b | c16 c r e c r e e c8 r8 r4 |
    b16 b r dis b r dis dis b8 r r b | b16 b r dis b r dis dis b8 r r b |
    b16 b r dis b r dis dis b8 r r b | b16 b r dis b r dis dis b8 r r b |
    bes16 bes r ees bes r ees ees bes8 r r bes | a16 a r dis a r dis dis a8 r r a |
    gis16 gis r dis' gis, r dis' dis gis,8 r r gis | g16 g r dis' g, r dis' dis g,8 r8 r4 |
  }

 ritmicaAtre = {
    fis'4. b8 dis4. b8 | g4. b8 dis4. b8 | fis4. b8 dis4. b8 | g4. b8 dis4. b8 |
    fis4. b8 dis4. b8 | a4. cis8 e4. cis8 | gis4. b8 dis4. b8 | a4. c8 fis2 |
    fis,4. b8 dis4. b8 | g4. b8 dis4. b8 | fis4. b8 dis4. b8 | g4. b8 dis4. b8 |
    ges4. bes8 ees4. bes8 | fis4. a8 dis4. a8 | e4. b'8 dis4. b8 | e,4. b'8 fis'2 |
  }


  bassoA = {
    r8 b8~ b b'\staccato fis\staccato b,4. | r8 b8~ b b'\staccato g\staccato b,4. | 
    r8 b8~ b b'\staccato fis\staccato b,4. | r8 b8~ b b'\staccato g\staccato b,4. |
    r8 b8~ b b'\staccato fis\staccato b,4. | r8 a8~ a b'\staccato fis\staccato a,4. | 
    r8 gis8~ gis b'\staccato fis\staccato gis,4. | a4 c'8\staccato fis,\staccato a,2 |
    r8 b8~ b b'\staccato fis\staccato b,4. | r8 b8~ b b'\staccato g\staccato b,4. | 
    r8 b8~ b b'\staccato fis\staccato b,4. | r8 b8~ b b'\staccato g\staccato b,4. |
    r8 bes8~ bes bes'\staccato f\staccato bes,4. | r8 fis8~ fis a'\staccato e\staccato fis,4. | 
    r8 e8~ e gis'\staccato e\staccato e,4. | \trip e4 b' fis'~ fis4 r |
  }

  silenzioA = {
    s1 | s1 | s1 | s1 | s1 | s1 | s1 | s1 | 
    s1 | s1 | s1 | s1 | s1 | s1 | s1 | s1 | 
  }
% }}}

% {{{ PARTE B
  temaB = {
    \partial 4 \trip r8 b' a |     
    \repeat volta 2 {
      a2.~ \trip a8 b a | a2.~ \trip a8 b a | a2~ \trip a8 g a \trip b a g | \tuplet 3/2 {a4 e8~} e2 e8 fis | \break
      g2. \trip a8 g fis | \tuplet 3/2 {g4 d8~} d2. | fis1~ | fis2.~ \trip fis8 b a |
    } 
  }

  temaBdue = {
    \partial 4 \trip r8 e' fis |     
    \repeat volta 2 {
      fis2.~ \trip fis8 e fis | fis2.~ \trip fis8 e fis | fis2~ \trip fis8 e fis \trip g a b | a2.~ a8 b | \break
      c2. \trip c8 b a | \tuplet 3/2 {bes4 f8~} f2. | a1~ | a2.~ \trip a8 e fis |
    } 
  }

  accordiB = \chordmode{
    \partial 4 s4 |
    \repeat volta 2{
      e1:m7 | b1:7.9-/dis | g1:maj7/d | a1:7/cis | 
      c1:maj7 | ees1:maj7 | e1:m7 | e1:m7 |
    }
  }

  bassoB = {
    \partial 4 s4 |
    \repeat volta 2{ 
      \trip e,4 b' fis'~ fis4 b, | \trip dis,4 b' fis'~ fis4 b, | 
      \trip d,4 b' fis'~ fis4 b, | \trip cis,4 a' e'~ e2 | 
      \trip c,4 g' d'~ d4 c | \trip ees,4 bes' f'~ f4. b,8 |
      \trip e,4 b' fis'~ fis4 d8 b | \trip e,4 b' fis'~ fis4. d16 b |
    }
  }

  silenzioB = {
    \partial 4 s4 |
    \repeat volta 2{
      s1 | s1 | s1 | s1 |
      s1 | s1 | s1 | s1 |
    }
  }
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \tempo 4 = 104
  \temaA \bar "||" \break
  \mark \default 
  \temaB
  \bar "|."
}

temaTre = \relative c {
  \global
  \temaAdue
  \temaBdue
}

ritmica = \relative c {
  \global
  \ritmicaA
  \silenzioB
}

ritmicaDue = \relative c {
  \global
  \ritmicaAdue
  \silenzioB
}

ritmicaTre = \relative c {
  \global
  \ritmicaAtre
  \silenzioB
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
    \accordiB
  }
}

bassoPart = \new Staff {
  \clef "bass"
  \global
  \relative c {
    \bassoA
    \bassoB
  }
}

temaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \tema }

scoreContent = << 
  \chordsPart
  \temaPart
  \temaTre
  \ritmica
  \ritmicaDue
  \ritmicaTre
  \bassoPart
>>

scoreContentCompact = << 
  \chordsPart
  \temaPart
  \bassoPart
>>
%}}}

% {{{ BOOKS
  \book{
    \struttura
    \bookOutputName \myFname
    \bookOutputSuffix "C"
    \score {
      \scoreContent
      \layout {}
    }
  }

  \book{
    \struttura
    \bookOutputName \myFname
    \bookOutputSuffix "Compact"
    \score {
      \scoreContentCompact
      \layout {}
    }
  }

  \book{
    \struttura
    \bookOutputName \myFname
    \bookOutputSuffix "Bb"
    \score { \transpose c d {\scoreContent} }
  }
% }}}
