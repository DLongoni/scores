% {{{ INIZIALIZZAZIONE
  \version "2.16.2"

  \header {
    title = "Ajde Jano"
    composer = "Serbian Traditional"
  }

  \paper{
    oddHeaderMarkup = \markup \null
    evenHeaderMarkup = \markup \null
    print-first-page-number = ##t
    oddFooterMarkup = \markup {
      \fill-line {
        \on-the-fly \print-page-number-check-first
        \fromproperty #'page:page-number-string
      }
    }
    evenFooterMarkup = \oddFooterMarkup
    #(set-global-staff-size 10)

    myStaffSize = #20
    fonts = #(make-pango-font-tree
    "FontAwesome"
    "FontAwesome"
    "FontAwesome"
    (/ myStaffSize 20) )
  }

  global = {
    \key f \major
    \numericTimeSignature
    \time #'(3 2 2) 7/8
    \set Score.markFormatter = #format-mark-box-alphabet
  }

  struttura = \markup {
    \column {
      \line {
        Struttura: \bold{A}(f), \bold{B}(b,f), \bold{B}(+g,c,fisa 2 voce),
        \bold{C}(t,f,b,g), \bold{B2}
      }
      \line {
        \bold{C}, \bold{C}(strofa1), \bold{B}(fisa 2 voce), \bold{C}(strofa2),
        \bold{B2}, \bold{D}, \bold{A}, \bold{E}x2, \bold{F}x6, \italic{coda}
      }
    }
  }
% }}}

% {{{ PARTE A

  temaA = {
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
  }

  pausaA = {
    \repeat volta 2 {R1*7/8*7|}
    \alternative {
      {R1*7/8|}
      {R1*7/8|}
    }
  }

  bassoA = {
    \repeat volta 2{
      d4. a2|d4. a2|g4. c2|d4. a2|
      d4. d8 c d e| f4. a,2|d4. c2|
    }
    \alternative{
      {d4. d4 r4|}
      {d4. d4 r4|}
    }
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
  }

% }}}

% {{{ PARTE B

  pausaB = { R1*14*7/8|}

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

  guitB = {
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

  accordionB = \chordmode{
    d4.:m d4.:m d8:m| d4.:m d4.:m d8:m| d4.:m c4.:7 c8:7| f4. f4 f4 |
    f4. f4. f8 | g4.:m g4.:m g8:m| c4.:7 c4.:7 c8:7 | r4. f4 r4 |
    f4. f4. f8 | g4.:m g4.:m g8:m| c4.:7 c4.:7 c8:7 | f4. c4:m c4:m|
    d4.:m d4.:m d8:m| d4.:m d4.:m d8:m|
  }

  bassoB = {
    d4. r4 a| r4. d4 r4| d4. r4 c4 | r4. f4 r4 |
    f4. r4 a4 | r4. f4 r4| c4. r4 e4 | r4. f4 r4 |
    f4. r4 c4 | r4. g4 r4| c4. r4 e4 | r4. c4 r4|
    d4. r4 f| r4. c4 a|
  }

  % trombaB = { % Elimino: non piace ne agli altri ne a me
  %   \repeat volta 2{
  %     a4.\mp c4 a | a8-. a8-. r8 r4 c4 | a8-. a8-. r8 r4 r8 bes8 | c8 bes a a bes c d|
  %     a4. c4 a | bes8-. bes8-. r8 bes8 a bes a | bes8-. bes8-. r8 r4 r8 bes | c8 bes a a bes c d|
  %     a4. c4 a | bes8-. bes8-. r8 bes8 a bes a | bes8-. bes8-. r8 r4 r8 bes |
  %     a8 c d~ d ees c bes| a4.~ \startTrillSpan a2~ | a4.~ a2\stopTrillSpan|
  %   }
  % }

  trombaB = {
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
    f4 e8 d e f g |
    f4 e8 e4 d |
    d4 c8 c2 |
    R1*7/8|
    \break
    f4 g8 a4~ a8 g~|
    g4 f8 f e d4|
    g4 f8 f e d e|
    f4.~ f8 g ees d|
    d4.~ d2|
    \break
    f4 g8 a4. g8 |
    g a f f e d4 |
    g4 f8 f e d c|
    f4 e8 f ees ees d |
    d4.~ d2~|
    d4.~ d2|
  }

  clarinoC= {
    R1*4*7/8|
    a4\mp bes8 c4~ c8 bes~ | bes4 a8 g4 f4 | bes a8 a g f g | bes4.~ bes4 c4 | a4.~ a2 |
    a8 bes c c4 c | bes8 \slashedGrace c bes a a g f e| bes'4 a8 a g f e| bes'4 g8 a g g f|
    f4.~ f2~ | f4.~ f2|
  }

  bassoC = {
    {
      d4 a8 r8 f'8 a,4 | d4 f8 r8 a,8 b4|c4 g8 r8 c8 g4| c4 c8 b4 bes|
      f4 a8 r8 c8 f4| g4 d8 r8 bes8 d4| c4 g8 r8 c8 b4| bes4 f8 r8 d'8 c4| d4 f8 r8 a8 d,4|
      f,4 a8 r8 c8 f4| g4 d8 r8 a8 d4| c4 g8 r8 c8 b4| bes4 f8 r8 d'8 c4|
      d4 f8 r8 a8 d,4| d4 f8 r8 a8 d,4|
    }
  }

  accordionC = \chordmode{
    \repeat volta 2{
      d8:m d8:m d8:m d4:m d4:m| d8:m d8:m d8:m d4:m d4:m|
      c8 c8 c8 c4 c4| c8 c8 c8 g4/b bes4:dim7|
      f8 f8 f8 f4 f4| g8:m g8:m g8:m g4:m g4:m|
      c8 c8 c8 c4 c4/b| bes8 bes8 bes8 bes4 c4:m| d8:m d8:m d8:m d4:m d4:m|
      f8 f8 f8 f4 f4| g8:m g8:m g8:m d4:m d4:m|
      c8 c8 c8 c4 c4/b| bes8 bes8 bes8 bes4 c4:m|
      d8:m d8:m d8:m d4:m d4:m| d8:m d8:m d8:m d4:m d4:m|
    }
  }

  guitC = {
    \repeat volta 2{
      d8 d16 e f8 a4 f16 e d8| d8 d16 e f8 a4 f16 e d8|
      c8 c16 d e8 g4 e16 d c8| c8 c8 c8 d4 e4|
      f8 f16 g a8 c4 a16 g f8| g8 g16 a bes8 f4 f16 e d8|
      c8 c16 d e8 g4 e16 d c8| bes8 bes16 c d8 f4 ees8 d8| d f e d4\prall d\prall|
      f8 f16 g a8 c4 a16 g f8| g8 g16 a bes8 f4 f16 e d8|
      c8 c16 d e8 g4 e16 d c8| bes8 bes16 c d8 f4 ees8 d8|
      d f e d4 d\prall|| d4.~\startTrillSpan d2\stopTrillSpan|
    }
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

  pausaD = {R1*8*7/8}

  accordionD={
    d8\p-. a-. d-. c-. a-. bes-. a-.| a8-. a-. d-. g,-. a-. f-. a-.|
    a-. a-. d-. a-. a-. a-. a-. | a-. a-. f'-. e-. a,-. c-. e-.|
    d8\p\< a d c a bes a| a8 a d g, a g a| a a d a a a a | d a f' e e c c\!|
  }

  guitD = {
    d'8\p r4 c8 r bes r| a r4 g8 r f r| g r4 a8 r bes r| f r4 e8 r c r|
    d'16\p\< d d d d d c c c c bes bes bes bes| a a a a a a g g g g f f f f|
    g g g g g g a a a a bes bes bes bes| f f f f f f e e e e c c c c\!|
  }

  bassoD={
    R1*4/8*7|
    d4.\p\< c4 bes | a4. g4 f | g8 g g a4 bes | f8 f f e4 c\!|
  }

  clarinoD={
    R1*4*7/8| \break
    a'4.\p\<~ a2~ | a4.~ a2|\noBreak bes4. c4  d | a8-. a-. a-. g4 e\! |
  }

  trombaD={
    R1*4*7/8|
    d'4.\p\<~ d2~ | d4.~ d2| g,4. a4 bes4| f8-. f-. f-. e4 c4\! |
  }

  accordiD= \chordmode{
    r4. r2| R1*3*7/8|
    d'4.:m d2:m |  d'4.:m d2:m |  d'4.:m d2:m | d'4.:m c2 |
  }

% }}}

% {{{ Parte E

  pausaE = {
    R1*2
    \repeat volta 2{R1*4}
  }

  temaE ={
    r1|r2 r4 r8. d16|
    \repeat volta 2{
      d g d c d e f g a8.\prall g16 a8\prall g16 f|
      g8 f16 e f8 e16 c d f d c d8 r16 c16|
      d g d c d e f g a8.\prall g16 a8\prall g16 f|
      g8 f16 e f8 e16 c d f d c d8 r8|
    }
  }

  bassoE = {
    d'8.-. d8.-. d8-. c-. c-. d-. r|
    d8.-. d8.-. d8-. c-. c-. d-. r|
    \repeat volta 2{
      d8. f8. a8 d,8. f8. a8|
      c,8. e8. g8 d8. f8. a8|
      d,4 e4 f8. a8. c8| bes,4 c4 d8. f8. a8|
    }
  }

  accorionE ={
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

  trombaE ={
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

  pausaF = { \repeat volta 2{R1*4}}

  temaF ={
    \repeat volta 2{
      a'8 e16 a16~ a16 e a e cis' a32 bes g16 a bes cis d e |
      e32 f g f e f d16 cis32 d e d cis d bes16 a d32 a g16 a16~ a4|
      a8 e16 a16~ a16 e a e cis' a32 bes g16 a bes cis d e |
      e32 f g f e f d16 cis32 d e d cis d bes16 a bes32 a g16 a32 bes a4|
    }
  }

  clarinoF ={
    \repeat volta 2{
      a'8 e16 a16~ a16 e a e cis'8 g16 a bes cis d e |
      e16 g8\prall d16 cis8 a a16 bes8 g16 a4\prall|
      a8 e16 a16~ a16 e a e cis'8 g16 a bes cis d e |
      e16 g8\prall d16 cis8 a a16 bes8 cis16 a4\prall|
    }
  }

  trombaF ={
    \repeat volta 2{
      cis8 a16 cis16~ cis16 a cis a e'8 bes16 cis d e f g |
      g16 bes8\prall f16 e8 bes bes16 d8 bes16 cis4\prall|
      cis8 a16 cis16~ cis16 a cis a e'8 bes16 cis d e f g |
      g16 bes8\prall f16 e8 bes bes16 d8 e16 cis4\prall|
    }
  }

  accordionF ={
    \repeat volta 2{
      a,8 e16 a16~ a16 e a e cis'8 g16 a bes cis d e |
      e16 g8\prall d16 cis8 a a16 bes8 g16 a4\prall|
      a8 e16 a16~ a16 e a e cis'8 g16 a bes cis d e |
      e16 g8\prall d16 cis8 a a16 bes8 cis16 a4\prall|
    }
  }

  bassoF = {
    \repeat volta 2{
      a,8. cis8. e8 a,8. cis8. e8|g,8. bes8. d8 a8. cis8. e8|
      a,8. cis8. e8 a,8. cis8. e8|g,8. bes8. d8 a8. cis8. e8|
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
  pausaCoda ={R1*2}

  temaCoda ={
    a1\p\<^"coda" | a16 cis8 e16~ e16 g8 gis16 a4 a4\f|
  }

  clarinoCoda ={
    cis1\p\<^"coda" | cis16 e8 g16~ g16 bes8 c16 cis4 cis4\f|
  }

  accordionCoda ={
    e1\p\<^"coda" | e16 g8 bes16~ bes16 d8 dis16 e4 e4\f|
  }

  bassoCoda ={
    a,8.\p\< cis8. e8 a,8. cis8. e8 |
    a,16 cis8 e16~ e16 g8 gis16 a4 a4\f-.|
  }
% }}}

% {{{ MAIN

  clarinet = \relative c'' {
    \global
    %\transposition bes
    \partial 8 r8 | % levare
    \mark \default
    \pausaA
    \break
    \mark \default
    \temaB
    \break
    \mark \default
    \clarinoC
    \break
    \mark \markup{ \box \bold{B2} }
    \temaB
    \break
    \mark \default
    \clarinoD
    \break
    \time 4/4
    \mark \default
    \temaE
    \break
    \mark \default
    \clarinoF
    \break
    \clarinoCoda
  }

  trumpetBb = \relative c'' {
    \global
    %\transposition bes
    \partial 8 r8 | % levare
    \temaA
    \trombaB
    \temaC
    \relative c''{\guitB}
    \trombaD
    \trombaE
    \trombaF
    \temaCoda
  }

  accordion = \relative c'' {
    \global
    \partial 8 c8 | % levare
    \temaA
    \accordionB
    \accordionC
    \trombaB
    \accordionD
    \accorionE
    \accordionF
    \accordionCoda
  }

  guitar = \relative c' {
    \global
    \partial 8 r8 | % levare
    \pausaA
    \guitB
    \guitC
    \pausaB
    \guitD
    \pausaE
    \temaF
    \temaCoda
  }
  contrabass = \relative c {
    \global
    \partial 8 r8 | % levare
    \pausaA
    \bassoB
    \bassoC
    \bassoB
    \bassoD
    \bassoE
    \bassoF
    \bassoCoda
  }

  chordsPart ={
    \new ChordNames {
      \accordiA
      \bar "||"
      \accordiB
      \bar "||"
      \accordiC
      \bar "||"
      \accordiB
      \bar "||"
      \accordiD
      \bar "||"
      \accordiE
      \accordiF
      \bar ":|."
      \pausaCoda
      \bar "|."
    }
  }

  accordionPart = \new Staff \with {
    instrumentName = "Fisa"
    shortInstrumentName = #"F"
    midiInstrument = "piano"
  } \accordion

  clarinetPart = \new Staff \with {
    instrumentName = "Clarinetto"
    shortInstrumentName = #"C"
    midiInstrument = "clarinet"
  } \clarinet

  trumpetPart =  \new Staff \with {
    instrumentName = "Tromba"
    shortInstrumentName = #"T"
    midiInstrument = "trumpet"
  } \trumpetBb

  guitarPart = \new Staff \with {
    instrumentName = "Chitarra"
    shortInstrumentName = #"G"
    midiInstrument = "guitar"
  } { \clef "treble_8" \guitar }

  contrabassPart = \new Staff \with {
    instrumentName = "Basso"
    shortInstrumentName = #"B"
    midiInstrument = "tuba"
  } { \clef bass \contrabass }

% }}}

% {{{ BOOKS
  \book{
    \bookOutputSuffix "Score"
    \struttura
    \score {
      <<
        \chordsPart
        \clarinetPart
        \trumpetPart
        \accordionPart
        \guitarPart
        \contrabassPart
      >>
      \layout {
      }
      \midi {
        \context {
          \Score
          tempoWholesPerMinute = #(ly:make-moment 120 4)
        }
      }
    }
  }

  \book{
    \bookOutputSuffix "ClTr"
    \struttura
    \score {
      <<
        \transpose c d { \chordsPart }
        \transpose c d { \clarinetPart}
        \transpose c d { \trumpetPart}
      >>
    }
  }

  \book{
    \bookOutputSuffix "Basso"
    \struttura
    \score {
      <<
        \chordsPart
        \clarinetPart
        \trumpetPart
        \contrabassPart
      >>
    }
  }

  \book{
    \bookOutputSuffix "GuitAcc"
    \struttura
    \score {
      <<
        \chordsPart
        \clarinetPart
        \accordionPart
        \guitarPart
      >>
    }
  }
