\version "2.16.2"

\header {
  title = "Ajde Jano"
  subtitle = "cantato"
  composer = "Serbian Traditional"
}

global = {
  \key f \major
  \time #'(3 2 2) 7/8
}

testoCompleto=\markup {
  \vspace #2
  \fill-line {
    \hspace #1
    \column {
      \line { 'Ajde Jano kolo da igramo! }
      \line { 'Ajde Jano, 'ajde dušo, kolo da igramo,}
      \line { 'Ajde Jano, 'ajde dušo, kolo da igramo! }
      \vspace #0.1
      \line { 'Ajde Jano konja da prodamo! }
      \line { 'Ajde Jano, 'ajde dušo, konja da prodamo, }
      \line { 'Ajde Jano, 'ajde dušo, konja da prodamo! }
      \vspace #0.1
      \line { Da prodamo samo da igramo! }
      \line { Da prodamo, Jano dušo, samo da igramo,}
      \line { Da prodamo, Jano dušo, samo da igramo!}
      \vspace #0.1
      \line { 'Ajde Jano kuću da prodamo! }
      \line { 'Ajde Jano, 'ajde dušo, kuću da prodamo, }
      \line { 'Ajde Jano, 'ajde dušo, kuću da prodamo! }
    }
    \hspace #2
    \column \italic {
      \line { C'mon Jana, let's dance the kolo! }
      \line { C'mon Jana, c'mon honey, let's dance the kolo,}
      \line { C'mon Jana, c'mon honey, let's dance the kolo! }
      \vspace #0.1
      \line { C'mon Jana, let's sell the horse! }
      \line { C'mon Jana, c'mon honey, let's sell the horse, }
      \line { C'mon Jana, c'mon honey, let's sell the horse! }
      \vspace #0.1
      \line { For to sell it, just to dance! }
      \line { For to sell it, Jana honey, just to dance,}
      \line { For to sell it, Jana honey, just to dance!}
      \vspace #0.1
      \line { C'mon Jana, let's sell the house!}
      \line { C'mon Jana, c'mon honey, let's sell the house,}
      \line { C'mon Jana, c'mon honey, let's sell the house!}
    }
    \hspace #1
  }
}

testoUno = \lyricmode{ Aj -- de Ja -- no, ko -- lo Da i -- gra -- mo! 
  Aj -- de Ja -- no, aj -- de du -- šo, ko -- lo da i -- gra -- mo,
  Aj -- de Ja -- no, aj -- de du -- šo, ko -- lo da i -- gra -- mo!
}

testoDue = \lyricmode{ Aj -- de Ja -- no, ku -- ću da pro -- da -- mo! 
  Aj -- de Ja -- no, aj -- de du -- šo, ku -- ću da pro -- da -- mo,
  Aj -- de Ja -- no, aj -- de du -- šo, ku -- ću da pro -- da -- mo!
}

voceUno =\relative c'' {
  \global{
    f4 e8 d( e) f4| f4 e8 e4 d| d8( e d) c2~| c4. r2|\break
    f4 g8 a4 a | g4 f8 e4 d| g4 f8 e4 d| f4.( f8 g ees d)| d4.~ d2| \break
    f4 g8 a4 a | g4 f8 e4 d| g4 f8 e4 d| f4.( f8 g ees d)| d4.~ d2| R1*7/8 |
  }
  \addlyrics{\testoUno}
  \addlyrics{\testoDue}
}

voceDue =\relative c'' {
  \global{
    R1*4*7/8|
    a4 bes8 c4 c | bes4 a8 g4 f| bes4 a8 g4 f| a4.( a8 bes g f)| f4.~ f2|
    a4 bes8 c4 c | bes4 a8 g4 f| bes4 a8 g4 f| a4.( a8 bes g f)| f4.~ f2| R1*7/8 |
}}

voceTre =\relative c'' {
  \global
  {
    R1*4*7/8
    c4 c8 c4 c | c4 c8 c4 c| c4 a8 c4 b| bes4.( bes4 c)| d4.~ d2|
    c4 c8 c4 c | c4 c8 c4 c| c4 a8 c4 b| bes4.( bes4 c)| d4.~ d2| R1*7/8 |
}}

\score {
  <<
    \new Staff \with {
      instrumentName = ""
      midiInstrument = "piano"
    } \voceUno

    \new Staff \with {
      instrumentName = ""
      midiInstrument = "piano"
    } \voceDue

    \new Staff \with {
      instrumentName = ""
      midiInstrument = "piano"
    } \voceTre
  >>
  \layout { }
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 120 4)
    }
  }
}
\testoCompleto