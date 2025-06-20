% {{{ PARAMETRI
  myTitle = "The Beauty I Don't See"
  myFname = "TheBeauty"
  myKey = \key c \major
  myTime = \time 3/4 
  myTempo =  #(ly:make-moment 60 4)

  struttura = \markup {
    \column {
        \line {\bold{Intro}, \bold{A} Fisa, \bold{A} Tr, \bold{B} Fisa, 
               \bold{B} Gtr, \bold{A} Tr}
        \line{\bold{Solo} Gtr, \bold{B}, \bold{Solo} Tr, 
          \bold{B}, \bold{B2}, \bold{A}, \bold{Coda}}
      }
    }
% }}}

% DEFINIZIONI {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"
toCoda = {
  % the align part
  \once \override Score.RehearsalMark.self-alignment-X = #RIGHT  
  \once \override Score.RehearsalMark.break-visibility = #begin-of-line-invisible
  \mark \markup { { \lower #1 "al  " { \musicglyph #"scripts.coda"} } } 
}
%}}}

% PARTE A {{{
temaA = {
  \repeat volta 2{
    a8^\markup{ \italic {swing feel} } b c d e a | g e b a b a | e'4 d4. c8 | d4 c e | \break
    a,8 b c d e a | g e c a c a | e' f8~ f8 c8~ c8 g | a2. | \break
    e'4.\< a | fis d | c\! e\> | d b\! | \break
    a8 c \tuplet 3/2 {b c d} e4 | d8 f \tuplet 3/2 {e f g} a4 | e2.~ | e 2.| \toCoda \break
    a,8 b c d e a | \time 2/4 g e g e | \time 3/4 a,4 r2 | r2. |
  }
}

temaAseconda = {
  \repeat volta 2{
    r4 e8 a~ a c | b2. | b4 a2 | r2. |
    r4 e8 a~ a c~ | c4 g a | g8 a~ a e~ e g | e2. |
    a,4. cis4. | b fis | g a | b2. |
    r2. | r2. | r2. | r2. |
    r8 e~ e g~ g e | \time 2/4 c4 b | \time 3/4 c4 r2 | r2. |
  }
}

silenzioA = {
    s2. | s2. | s2. | s2. |
    s2. | s2. | s2. | s2. |
    s2. | s2. | s2. | s2. |
    s2. | s2. | s2. | s2. |
    s2. | s2 |  s2. | s2. |
}

bassoA = {
  \repeat volta 2{
    a2. | g2. | f2. | bes2. |
    a2. | c2. | bes4. e,4. | f2 r4 |
    a2. | b2. | c2. | d2.~ | 
    d2. | d4 a b | c2 r8 c | b e r g, r gis | 
    a2~ a8 g | \time 2/4 f4 e |  \time 3/4 a4 r2 | r2. |
  }
}

accordiA = \chordmode{
  \set chordChanges = ##t
  \repeat volta 2{
    a2.:m | g2.:13 f2.:maj7 | bes2.:7.11+ |
    a2.:m | c2.:7 | bes2.:maj7 | f2.:maj7 |
    a2.:7 | b2.:m7 | c2.:maj7 | g2.:6 |
    d2.:m7 | d2:m7 d4:m7/a | c2.:maj7 | c2.:maj7/b |
    a2.:m |
    \time 2/4
    f4 e4:7.9- |
    \time 3/4
    a2.:m | a2.:m |
  }
}
% }}}

% PARTE B {{{
temaB = {
  \repeat volta 2{
    \time 3/4 a8 a4 c8~ c4 | a8 a4 g8~ g4 | r4 d'8 e d e | \time 2/4 c8 c a4 |
    \time 3/4 a8 a4 c8~ c4 | a8 a4 g8~ g4 | e8 e4 g8~ g4 | e8 e d2 |
  }
}

temaBseconda = {
  \repeat volta 2{
    \time 3/4 c8 c4 e8~ e4 | c8 c4 b8~ b4 | r4 b8 c b c | \time 2/4 e e c4 |
    \time 3/4 c8 c4 e8~ e4 | c8 c4 b8~ b4 | g8 g4 b8~ b4 | g8 g a2 |
  }
}

armB = {
  \repeat volta 2{
    \new Voice <<
      { \time 3/4 e2.~ | e2. | e2.~ | \time 2/4 e4 f |
      \time 3/4 g2.~ | g2. | e2.~ | e2. | }
      { \time 3/4 c2.~ | c2. | c2.~ | \time 2/4 c4~ c |
      \time 3/4 c2.~ | c2. | b2.~ | b2. | }
      { \time 3/4 g2.~ | g2. | a2.~ | \time 2/4 a4~ a |
      \time 3/4 g2.~ | g2. | e2.~ | e2. | }
  >>
  }
}

silenzioB = {
  \repeat volta 2{
    \time 3/4 s2. | s2. | s2. | \time 2/4 s2 |
    \time 3/4 s2. | s2. | s2. | s2. |
  }
}

accordiB = \chordmode{
  \set chordChanges = ##t
  \repeat volta 2{
    \time 3/4
    a2.:m7 | a2.:m7 |
    f2.:maj7 |
    \time 2/4 f2:maj7 |
    \time 3/4
    a2.:m7 | a2.:m7 |
    g2.:6 | g2.:6 |
  }
}
% }}}

% PARTE Bdue {{{
temaBdue = {
  \repeat volta 2{
    \time 3/4 a8 a4 c8~ c4 | a8 a4 g8~ g4 | r4 d'8 e d e | \time 2/4 c8 c a4 |
    \time 3/4 a8 a4 c8~ c4 | a8 a8 g2 | e8 e4 g8~ g4 | e8 e d2 |
  }
}

temaBsecondaDue = {
  \repeat volta 2{
    \time 3/4 c8 c4 e8~ e4 | c8 c4 b8~ b4 | r4 b8 c b c | \time 2/4 e e c4 |
    \time 3/4 c8 c4 e8~ e4 | c8 c8 b2 | g8 g4 b8~ b4 | g8 g a2 |
  }
}
 
bassoBdue = { 
  \time 3/4 a,4 r8 c8~ c4 | a r8 c8~ c4 | d r8 c8~ c4 | \time 2/4 d g, |
  \time 3/4 a4. r4 a8 | r4 a2 | g4. r4 g8 | r4 g2 |
}

accordiBdue = \chordmode{
  \set chordChanges = ##t
  \repeat volta 2{
    \time 3/4 a2.:m7 | a2.:m7 | d2.:7 | \time 2/4 d2:7 |
    \time 3/4
    a2.:m7 | a2.:m7 |
    g2.:6 | g2.:6 |
  }
}
% }}}

% CODA {{{
temaCoda = {
  \time 4/4 a'8 b c d e a g f | \time 3/4 e4. a | g d | c ees | d bes | \break
  c8 d ees f g c | \time 2/4 bes g bes g | c2 |
}

temaCodaseconda = {
  \time 4/4 c8 d e f g c, b g | \time 3/4 a4. c | b g | aes c | g aes | \break
  c8 d ees f g c | \time 2/4 bes g bes g | c,2 |
}

accordiCoda = \chordmode{
  \set chordChanges = ##t
  \time 4/4 a2.:m7  g4:13 | \time 3/4 f2.:maj7 | f2.:maj7 | aes2.:maj7 | aes2.:maj7 | 
  c2.:m7 | \time 2/4 aes4 g4:7 | c2:m7 |
}
% }}}

% SCORE {{{
tema = \relative c' {
  \global 
  \mark \default
  \tempo 4 = 160
  \temaA
  \break
  \mark \default
  \temaB
  \break
  \mark \markup{ \box \bold{B2} }
  \relative c'{\temaBdue}
  \break
  \mark \markup { \musicglyph #"scripts.coda"}
  \temaCoda
  \bar"|."
}

temaseconda = \relative c' {
  \global 
  \temaAseconda
  \temaBseconda
  \relative c'{\temaBsecondaDue}
  \temaCodaseconda
}

bass = \relative c' {
  \bassoA
  \silenzioB
  \bassoBdue
}

arm = \relative c' {
  \silenzioA
  \armB
  \silenzioB
}

chordsPart ={
  \new ChordNames {
    \accordiA
    \accordiB
    \accordiBdue
    \accordiCoda
  }
}

temaPart = \new Staff \with {
  instrumentName = ""
  shortInstrumentName = "T"
} { \clef "treble_8" \tema }

temasecondaPart = \new Staff \with {
  \override VerticalAxisGroup.remove-empty = ##f 
  instrumentName = ""
  shortInstrumentName = "T2"
} { \clef "treble_8" \temaseconda }

armPart = \new Staff \with {
  instrumentName = ""
  shortInstrumentName = "P"
} { \clef "treble_8" \arm }

bassPart = \new Staff \with {
  instrumentName = ""
  shortInstrumentName = "B"
} { \clef "bass" \bass }

scoreC = <<
      \chordsPart
      \temaPart
      \temasecondaPart
      \armPart
      \bassPart      
    >>

scoreBb = <<
  \transpose c d { \chordsPart }
  \transpose c d, { \temaPart}
  \transpose c d, { \temasecondaPart}
>>

\book{
  \bookOutputName \myFname
  \struttura
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
% }}}
