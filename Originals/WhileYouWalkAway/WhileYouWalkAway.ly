% {{{ PARAMETRI
  myTitle = "While You Walk Away"
  myFname = "WhileYouWalkAway"
  mySubTitle = ""
  myKey = \key d \minor
  myTime = \time #'(3 2) 5/8
  myTempo =  #(ly:make-moment 190 4)
  struttura = \markup {
    \column {
      \line {\bold{Intro} Gtr+Fisa, \bold{A}x3(1-2-1) Tr, \bold{B}, \bold{C}}
      \line{\bold{D}, \bold{Solo} Guit, \bold{A}x4}
    }
  }
% }}}

% INTESTAZIONE {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"
%}}}

% {{{ PARTE Intro
  silenzioIntro = {
    \repeat volta 2 {r1*5/8 | r1*5/8 |}
    r1*5/8 | r1*5/8 | r1*5/8 |
  }

  temaIntro = {
    \repeat volta 2 { d,8 d d f d | a a a c e | }
    a,4 a8 c e | a,4 a8 c e | a,4 c8 d e |
  }

  accordiIntro = \chordmode{
    \repeat volta 2 {d1*5/8:m | a1*5/8:m |}
    a1*5/8:m | a1*5/8:m | a1*5/8:m |
  }
% }}}

% {{{ PARTE A
  temaA = {
    \repeat volta 2 {
      a4 f'8 e c'| a4.~ a8 c | g4 f8 bes a | f4.~ f4 |\break
      a,4 f'8 a g | 
    } 
    \alternative{
      {e4.~ e4 | d8 d d f f | d4.~ d4 |}
      {e4.~ e8 f16 g | c4 b8 c b16 g | a4.~ a4 |}
    }
  }

  accordiA = \chordmode{
    \repeat volta 2 {
      f4.~ f4 | a4.:m/e~ a4:m/e | ees4.~ ees4 | bes4.:/d~ bes4:/d |
      f4.~ f4 |
    } 
    \alternative{
      {c4. c4 | g4. d4:m | d4.:m d4:m |}
      {c4. c4 | g4. g4 | a4.:m a4:m }
    }
  }

  silenzioA= {
    \repeat volta 2 {
      r1*5/8 | r1*5/8 |
      r1*5/8 | r1*5/8 |
      r1*5/8 | 
    }
    \alternative{
      {r1*5/8 | r1*5/8 | r1*5/8 |}
      {r1*5/8 | r1*5/8 | r1*5/8 |}
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    \repeat volta 4 {
      r8 d, \tuplet 3/2 {a'8 a a} \tuplet 3/2 {g8~ g f} \tuplet 3/2 {g f e} |
      \tuplet 3/2 {f8~ f e~} \tuplet 3/2 {e~ e d} \tuplet 3/2 {e d c} \tuplet 3/2 {a~ a d~} |
      d2 r2 | 
    } 
    \alternative {
      \volta 1,2,3 { r1 | }
      \volta 4 { r8 d \tuplet 3/2 {a'8 a a} \tuplet 3/2 {g8~ g f} \tuplet 3/2 {g f e} | }
    }
  }

  accordiB = \chordmode{
    \repeat volta 2 {
      d2:m a2:m | d2:m c2 |
      d2:m a2:m | 
    }
    \alternative {
      \volta 1,2,3 { d2:m c2 | }
      \volta 4 { d2:m c2 | }
    }
  }

  silenzioB = \chordmode{
    \repeat volta 4 { s1 | s1 | s1 | }
    \alternative { \volta 1,2,3 { s1 | } \volta 4 { s1 | } }
  }
% }}}

% {{{ PARTE C
  temaC = {
    \repeat volta 2 {
      b16 c a f r16 d e8~ e2 | r4 b'16 c a f~ f d e f b c a8~ | a2 r2 |
    }
    \repeat volta 2 {
      b16 c a f r16 d e8~ e2 | r4 b'16 c a f~ f d e f b c a8~ | a2 r2 |
    }
  }

  temaCdue = {
    \repeat volta 2 {
      \tuplet 3/2 {f8~ f e~} \tuplet 3/2 {e~ e d} \tuplet 3/2 {e d c} \tuplet 3/2 {a~ a d~} |
      d2 r2 | 
      r8 d \tuplet 3/2 {a'8 a a} \tuplet 3/2 {g8~ g f} \tuplet 3/2 {g f e} |
    }
    \repeat volta 2 {
      e16 f d c r a b8~ b2 | r4 e16 f d c~ c a b c d f e8~ | e2 r2 |
    }
  }

  accordiC = \chordmode{
    \repeat volta 2 {
      d2:m a2:m | d2:m a2:m | d2:m a2:m |
    }
    \repeat volta 2 {
      d2:m a2:m | d2:m a2:m | d2:m a2:m |
    }
  }
% }}}

% {{{ PARTE D
  temaD = {
    \repeat volta 2 {
      b'16 c a f r d e4~ | e4. r4 | b'16 c a f~ f d e f b c | a4.~ a4 |
    }
  }

  accordiD = \chordmode{
    \repeat volta 2 {
      d4.:m d4:m | a4.:m a4:m | d4.:m d4:m | a4.:m a4:m |
    }
  }
% }}}

% {{{ PARTE Solo Guit
  temaSoloGuit = {
    \repeat volta 2 { r1*5/8 | r1*5/8 | }
    b16 c a f r d e4~ | e4. r4 | r1*5/8 | r1*5/8 |
    b'16 c a f r d e4~ | e4. r4 | 
    r1*5/8 | r1*5/8 | r1*5/8^\markup{\italic{"To" \box \bold {"A"}} } | 
  }

  accordiSoloGuit = \chordmode{
    \repeat volta 2 { d4.:m d4:m | a4.:m a4:m | }
    d4.:m d4:m | a4.:m a4:m | d4.:m d4:m | a4.:m a4:m |
    d4.:m d4:m | a4.:m a4:m | 
    a1*5/8:m | a1*5/8:m | a1*5/8:m |
  }
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \markup{ \box \bold{"Intro - Solo Fisa"} }
  \temaIntro \break
  \bar "||"
  \mark \default
  \temaA \break
  \mark \default
  \time 4/4
  \temaB \break
  \mark \default
  \temaC \break 
  \mark \default
  \time 5/8
  \temaD \break
  \mark \markup{ \box \bold{"Solo Guit"} }
  \temaSoloGuit \break
  \bar "|."
}

temaDue = \relative c' {
  \silenzioIntro 
  \silenzioA
  \silenzioB
  \temaCdue
}

temaBb = \relative c {
  \mark \markup{ \box \bold{"Intro - Solo Fisa"} }
  \relative c'{\temaIntro} \break
  \bar "||"
  \mark \default
  \temaA \break
  \mark \default
  \time 4/4
  \temaB \break
  \mark \default
  \relative c'{\temaC} \break 
  \mark \default
  \time 5/8
  \temaD \break 
  \mark \markup{ \box \bold{"Solo Guit"} }
  \temaSoloGuit \break
  \bar "|."
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiIntro
    \accordiA
    \time 4/4
    \accordiB
    \accordiC
    \time 5/8
    \accordiD
    \accordiSoloGuit
  }
}

temaPart = \new Staff \with {
  instrumentName = ""
} { \clef "treble_8" \global \tema }

temaDuePart = \new Staff \with {
  instrumentName = ""
} { \clef "treble_8" \global \temaDue }

temaPartBb = \new Staff \with {
  instrumentName = ""
} { \clef "treble_8" \global \temaBb }

scoreContent = << 
  \chordsPart
  \temaPart
  \temaDuePart
>>

scoreContentBb = << 
  \transpose c d {\chordsPart}
  \transpose c d {\temaPartBb}
>>

%}}}

% {{{ BOOKS
  \book{
    \struttura
    \bookOutputName \myFname
    \markup { \vspace #1 }
    \bookOutputSuffix "C"
    \header{ composer="C" }
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
    \score { \scoreContentBb} 
  }
% }}}
