% {{{ PARAMETRI
  myTitle = "Ajde Jano"
  mySubTitle = "Serbian Traditional"
  myKey = \key f \major
  myTime = \time #'(3 2 2) 7/8
  myTempo =  #(ly:make-moment 190 4)
% }}}

% INTESTAZIONE {{{
\version "2.18.2"

\header {
  title = \myTitle
  composer = \mySubTitle
}

\paper{
  print-first-page-number = ##t
  oddHeaderMarkup = \markup \null
  evenHeaderMarkup = \markup \null
  #(set-global-staff-size 1)
  myStaffSize = #19
  fonts = #(make-pango-font-tree
  "FontAwesome"
  "FontAwesome"
  "FontAwesome"
  (/ myStaffSize 20))
}

global = {
  \myKey
  \numericTimeSignature
  \myTime
  \set Score.markFormatter = #format-mark-box-alphabet
}

\layout { indent = #0 }

struttura = \markup {
  \column {
    \line {
      \bold{A}, \bold{B}x2, \bold{C}, \bold{B}, \bold{Cx2}, \bold{B},
      \bold{C}, \bold{B}, \bold{D}, \bold{A}, \bold{E}, \bold{F}, \italic{Coda}
    }
  }
}

daCapo = {
  % the align part
  \once \override Score.RehearsalMark.self-alignment-X = #RIGHT  
  \mark \markup { {"D.C."} } 
}
fakeBar = {  
  \bar"||"
  \cadenzaOn
  \once \omit Score.TimeSignature
  \time 1/16
  s16 \bar ""
  \cadenzaOff
}
fakeBarDue = {  
  \bar"||"
  \cadenzaOn
  \once \omit Score.TimeSignature
  \time 1/16
  s16 \bar ""
  \cadenzaOff
  \once \omit Score.TimeSignature
  \time #'(2 2 3) 7/8
}
%}}}

% {{{ PARTE A
  temaA = {
    \partial 8 c8 | % levare
    \repeat volta 2 {
      d4 c8 d[ e] f[ g]|
      a4\prall g8 a4\prall g8[ f]|
      f[ g e16 g] f8[ e] d16[ e c8]|
      d8[ e c] d[ e] f[ g]
      d[ e c8] d[ e] f[ g]|
      f4\prall g8 a4\prall g8[ f]|
      f[ g e16 g] f8[ e] d16[ e c8]|
    }
    \alternative {
      {d4\prall g8 d4 r8 c8 |}
      {d4\prall g8 d4 r4 |}
    }
    \once \override Score.RehearsalMark.self-alignment-X = #RIGHT  
    \once \override Score.RehearsalMark.font-size = #-1
    \mark \markup { \italic "2nd time go to E"} 
    \fakeBarDue
  }

  accordiA = \chordmode{
    \set chordChanges = ##t
    \partial 8 s8 | % levare
    \repeat volta 2{
      d4.:m d2:m |
      \once \set chordChanges = ##f
      d4.:m d2:m | g4.:m c2 | d4.:m d2:m |
      \once \set chordChanges = ##f
      d4.:m d2:m | f4. f2 |  bes4. c2 |
    }
    \alternative{
      {d4.:m d2:m |}
      {
        \once \set chordChanges = ##f
        d4.:m d2:m |
      }
    }
    \fakeBarDue
  }

% }}}

% {{{ PARTE B

  temaB = {
    f8 e d \slashedGrace e d e f g|
    f4\prall e8 f e f e|
    f4\prall e8 d e f g|
    f4.~\prall f2|
    f8 g a \slashedGrace bes a g g f|
    g4\prall f8 e4 d|
    g4\prall f8 f e d e|
    f4.~\prall f2|
    \break
    f8 g a \slashedGrace d a g g f|
    g4\prall f8 e4 d|
    g4\prall f8 f e d e |
    f4 e8 f ees ees d|
    \slashedGrace ees \startTrillSpan  d4.~ d2~ | d4.~ d2 \stopTrillSpan|
  }

  temaBdue = {
    a8 g f \slashedGrace g f g a bes|
    a4\prall g8 a g a g|
    a4\prall g8 f g a bes|
    a4.~\prall a2|
    a8 bes c \slashedGrace d c bes bes a|
    bes4\prall a8 g4 f|
    bes4\prall a8 a g f g|
    a4.~\prall a2|
    a8 bes c \slashedGrace f c bes bes a|
    bes4\prall a8 g4 f|
    bes4\prall a8 a g f g |
    a4 g8 a g g f|
    \slashedGrace g \startTrillSpan  f4.~ f2~ | f4.~ f2\stopTrillSpan |
  }

  accordiB = \chordmode{
    d4.:m d2:m| d4.:m d2:m| d4.:m c2:7 | f4. f2 |
    f4. f2 | g4.:m g2:m| c4.:7 c2:7 | f4. f2 |
    f4. f2 | g4.:m g2:m| c4.:7 c2:7 | f4. c2:m |
    d4.:m d2:m| d4.:m d2:m|
  }

  temaBtre = {
    \repeat volta 2{
      r4. r8 c8 bes4 | f8 g bes a2 | r4. r8 c8 bes4 | f4 e8 d e f g |
      f4. r2 | bes8 c d d c bes a | g4. r2 | a4 g8 g f e f |
      f4. r2 | r4 bes8 bes a a g| e4. r2 | 
      a8 bes c d c c bes| a4.~ \startTrillSpan a2~ | a4.~ a2\stopTrillSpan|
    }
  }

% }}}

% {{{ PARTE C

  pausaC={R1*15/8*7}

  temaC = {
    f'4 e8 d e f g |
    f4 e8 e4 d |
    d4 c8 c2 |
    R1*7/8|
    \break
    f4 g8 a4 a4| g4 f8 f e d4| g4 f8 f e d e| f4.~ f8 g ees d| d4.~ d2|
    \break
    f4 g8 a4 a4| g8 a f f e d8~ d8 | g4 f8 f e d c| f4 e8 f ees ees d |
    d4.~ d2~|
    d4.~ d2|
  }

  temaCdue = {
    s1*4*7/8|
    a4 bes8 c4 c | bes4 a8 g8~ g f4 | bes a8 a g f g | bes4.~ bes8~ bes c8~ c | a4.~ a2 |
    a4 bes8 c4 c | bes8 \slashedGrace c bes a a g f e| bes'4 a8 a g f e| bes'4 g8 a g g f|
    f4.~ f2~ | f4.~ f2|
  }

  accordiC = \chordmode{
    \set chordChanges = ##t
    d4.:m d2:m |
    \once \set chordChanges = ##f
    d4.:m d2:m | c4. c2 |
    \once \set chordChanges = ##f
    c4 c8 g4/b bes:dim7 |
    f4. f2 | g4.:m g2:m|
    \once \set chordChanges = ##f
    c4. c4 c4/b |bes4. bes4 c4:m |d4.:m d2:m|
    f4. f2| g4.:m d2:m|
    c4. c4 c4/b|bes4. bes4 c4:m | d4.:m d2:m| d4.:m d2:m|
  }

% }}}

% {{{ Parte D - break
  temaD = {
    d'8-. a-. d-. c-. a-. bes-. a-.| a8-. a-. d-. g,-. a-. f-. a-.|
    a-. a-. d-. a-. a-. a-. a-. | a-. a-. f'-. e-. a,-. c-. e-.|
    d8\p\< a d c a bes a| a8 a d g, a g a| a a d a a a a | d a f' e e c c\!|
    \daCapo
    \fakeBar
  }

  temaDdue = {
    d8 r4 c8 r bes r| a r4 g8 r f r| g r4 a8 r bes r| f r4 e8 r c r|
    d'16 d d d d d c c c c bes bes bes bes| a a a a a a g g g g f f f f| \noBreak
    g g g g g g a a a a bes bes bes bes |\noBreak f f f f f f e e e e c c c c|
    \fakeBar
  }

  temaDtre={
    R1*4*7/8| \break
    a'4.~ a2~ |\noBreak a4.~ a2| bes4. c4  d | a8-. a-. a-. g4 e |
    \fakeBar
  }

  temaDqua={
    R1*4*7/8|
    d'4.~ d2~ | d4.~ d2| g,4. a4 bes4| f8-. f-. f-. e4 c4 |
    \fakeBar
  }

  accordiD= \chordmode{
    r4. r2| R1*3*7/8|
    d'4.:m d2:m |  d'4.:m d2:m |  d'4.:m d2:m | d'4.:m c2 |
    \fakeBar
  }

% }}}

% {{{ Parte E
  temaE ={
    \chordmode{
      d8.:m d8.:m d8:m c c d:m r|
      d8.:m d8.:m d8:m c c d:m r|
    }
    \repeat volta 2{
      f16 bes f e f g a c d8.\prall c16 d8\prall c16 bes|
      c8 bes16 a bes8 a16 g f bes f e f8 r16 e16|
      f16 bes f e f g a c d8.\prall c16 d8\prall c16 bes|
      c8 bes16 a bes8 a16 g f bes f e f8 r8|
    }
  }

  temaEdue ={
    s1|s2 s4 s8. d16|
    \repeat volta 2{
      d g d c d e f g a8.\prall g16 a8\prall g16 f|
      g8 f16 e f8 e16 c d f d c d8 r16 c16|
      d g d c d e f g a8.\prall g16 a8\prall g16 f|
      g8 f16 e f8 e16 c d f d c d8 r8|
    }
  }

  temaEtre ={
    r1| r1|
    \repeat volta 2{
      f16 a~ a8~ a8 c a4. d8| c16 e~ e8~ e c a2|
      f16 a~ a8 c8 e f4. e8| d16 bes~ bes8 e c d2|
    }
  }

  accordiE = \chordmode{
    d2:m c4 d4:m|\once \set chordChanges = ##f
    d2:m c4 d4:m|
    \set chordChanges = ##f
    \repeat volta 2{
      d1:m |c2 d2:m|
      d4:m c4 f2|bes4 c4 d2:m|
    }
  }
% }}}

% {{{ Parte F
  temaF ={
    \repeat volta 2{
      a'8 e16 a16~ a16 e a e cis' a32 bes g16 a bes cis d e |
      e32 f g f e f d16 cis32 d e d cis d bes16 a d32 a g16 a16~ a4|
      a8 e16 a16~ a16 e a e cis' a32 bes g16 a bes cis d e |
      e32 f g f e f d16 cis32 d e d cis d bes16 a bes32 a g16 a32 bes a4|
    }
  }

  temaFdue ={
    \repeat volta 2{
      a8 e16 a16~ a16 e a e cis' a g16 a bes cis d e |
      e16 g8\prall d16 cis8 a a16 bes8 g16 a4\prall|
      a8 e16 a16~ a16 e a e cis' a g16 a bes cis d e |
      e16 g8\prall d16 cis8 a a16 bes8 cis16 a4\prall|
    }
  }

  temaFtre ={
    \repeat volta 2{
      cis8 a16 cis16~ cis16 a cis a e' cis bes16 cis d e f g |
      g16 bes8\prall f16 e8 bes bes16 d8 bes16 cis4\prall|
      cis8 a16 cis16~ cis16 a cis a e' cis bes16 cis d e f g |
      g16 bes8\prall f16 e8 bes bes16 d8 e16 cis4\prall|
    }
  }

  accordiF = \chordmode{
    \repeat volta 2{
      a1|g2:m a2|
      a1|g2:m a2|
    }
  }
% }}}

% {{{ Coda
  temaCoda ={
    a1\p\<| a16 cis8 e16~ e16 g8 gis16 a4 a4\f|
  }

  temaCodadue ={
    cis,1\p\< | cis16 e8 g16~ g16 bes8 c16 cis4 cis4\f|
  }

  temaCodatre ={
    e,1\p\< | e16 g8 bes16~ bes16 d8 dis16 e4 e4\f|
  }
% }}}

% {{{ MAIN

  tema = \relative c'' {
    \global
    \mark \default
    \temaA
    \break
    \mark \default
    \new Voice <<
      \temaB
      \temaBdue
    >>
    \break
    \mark \default
    \new Voice <<
      \temaC
      \temaCdue
    >>
    \break
    \mark \default
    <<
      \new Voice <<
        \temaD
      >>
      \new Staff {\global \temaDdue}
      \new Staff 
      { \global
      \new Voice <<
        \temaDtre
        \temaDqua
      >>
    }
  >>
  \break
  \mark \default
  \time 4/4
  \new Voice <<
    \temaE
    \temaEdue
  >>
  \mark \default
  \new Voice <<
    \temaF
    \new Staff {\key f \major 
    \new Voice <<
      \temaFdue
      \temaFtre
    >>
  }
>>
\break
\mark \markup {"Coda"}
\new Voice <<
  \temaCoda
  \temaCodadue
  \temaCodatre
>>
\bar "|."
  }

  chordsPart ={
    \new ChordNames {
      \accordiA
      \bar "||"
      \accordiB
      \bar "||"
      \accordiC
      \bar "||"
      \accordiD
      \bar "||"
      \accordiE
      \accordiF
    }
  }

  TemaPart = \new Staff \with {
    \override StaffGrouper.staffgroup-staff-spacing.basic-distance = #10
    \override VerticalAxisGroup.default-staff-staff-spacing =
    #'((basic-distance . 0)
    (padding . 0))
    midiInstrument = "clarinet"
  } \tema

  scoreContent = << 
    \chordsPart
    \TemaPart
  >>
% }}}

% {{{ BOOKS
  \book{
    \struttura
    \bookOutputSuffix "C"
    \score {
      \scoreContent
      \layout {}
      \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 190 4) } }
    }
  }

  \book{
    \struttura
    \bookOutputSuffix "Bb"
    \score { \transpose c d {\scoreContent} }
  }

  \book{
    \struttura
    \bookOutputSuffix "Eb"
    \score { \transpose ees c { \scoreContent } }
  }
% }}}
