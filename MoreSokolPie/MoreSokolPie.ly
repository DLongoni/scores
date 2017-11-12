% {{{ PARAMETRI
  myTitle = "More Sokol Pie"
  mySubTitle = "Macedonian"
  myKey = \key g \major
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
  #(set-global-staff-size 10)
  myStaffSize = #20
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
%}}}

% TEMA UNO {{{
temaUno = {
  % A
  \mark \default
  \repeat volta 2 { fis8 g g g fis g a | g fis ees d4 a'8 g| fis4 ees8 g fis ees d|}
  \alternative{
    {d r4 a'8 g fis ees |}
    {d4. d2}
  }\bar"||" \break

  % B
  \mark \default
  \repeat volta 2{
    c8 d4 d d | \tuplet 4/3 {bes'8 a g fis} g2~ | g4.~ g8 a16 g fis8 g| 
    a g fis ees4 fis | \tuplet 4/3 {g8 fis ees d} d2~ | d4.~ d2 |
  }

  % C
  \mark \default
  \repeat volta 2{
    a'4. bes8 a g fis | g4. g8 a16 g fis8 g | a g fis ees4 fis |
    \tuplet 4/3 {g8 fis ees d} d2~ | d4. d2 |
  }

  % D
  \mark \default
  \repeat volta 2{
    c'4. c4 bes8 a | bes4. bes4 a8 g |
  }
  \alternative{
    {fis4 a8 g fis g a | bes4 g8 a4 bes|}
    {fis4 a8 g fis ees d| d4.~ d2 |}
  }\bar"|."
}
% }}}

% {{{ TEMA DUE
  temaDue = {
    % A
    \mark \default
    \repeat volta 2 {
      a'8 bes bes bes a bes c | bes a g fis4 a8 bes | a4 g8 bes a fis fis | 
    }
    \alternative{
      {fis8 r4 r2 |}
      {d'4. d2}
    }\break

    % B
    \mark \default
    \repeat volta 2{
      c8 d4 d d |\tuplet 4/3 {d8 c bes a} bes2~ | bes4.~ bes8 c16 bes a8 bes| 
      c8 bes a g4 a4 | \tuplet 4/3 {bes8 a g fis} fis2~ | fis4.~ fis2 |
    }\break

    % C
    \mark \default
    \repeat volta 2{
      c'4. d8 c bes a | bes4. bes8 c16 bes a8 bes | c bes a g4 a |
      \tuplet 4/3 {bes8 a g fis} fis2~ | fis4. fis2 |
    } \break

    % D
    \repeat volta 2{
      a'4. a4 g8 fis | g4. g4 fis8 ees |
    }
    \alternative{
      {d4 fis8 ees d ees fis | g4 ees8 fis4 g|}
      {d4 fis8 ees d c d| d4.~ d2 |}
    }\bar"|."
  }
% }}}

% {{{ ACCORDI
accordi = \chordmode{
  \set chordChanges = ##t
  \repeat volta 2{
    g1*7/8:m | d1*7/8 | c1*7/8 |
  }
  \alternative{
    {d1*7/8|}
    {d1*7/8|}
  }

  \repeat volta 2{
    d1*7/8 | d4. g2:m | ees1*7/8 | c1*7/8:m | c1*7/8:m | d1*7/8 | 
  }

  \repeat volta 2{
    d1*7/8 | g1*7/8:m | c1*7/8:m | c4.:m d2 | d1*7/8 | 
  }

  \repeat volta 2{
    c1*7/8 | g1*7/8:m | 
  }
  \alternative{
    {d1*7/8| g1*7/8:m|}
    {d1*7/8| d1*7/8 |}
  }
}
% }}}

% LYRICS {{{
testoCompleto=\markup {
  \vspace #2
  \fill-line {
    \column {
      \line { More sokol pie voda na Vardaro /2x}
      \hspace #1
      \line { \bold Refrain: Jane, Jane le belo gârlo /2x}
      \hspace #1
      \line { More oj sokole, ti junaško pile /2x}
      \hspace #1
      \line { More ne vide li, junak da pomine? /2x}
      \hspace #1
      \line { Junak da pomine s'devet ljuti rani /2x}
      \hspace #1
      \line { S'devet ljuti rani; site kuršumliji /2x}
      \hspace #1
      \line { A deseta rana so nož probodena /2x}
    }
  }
}
% }}}

% SCORE {{{
temaUnoPart = \relative c' {
  \global 
  \temaUno
}

temaDuePart = \relative c' {
  \global 
  \temaDue
}

chordsPart ={
  \new ChordNames {
    \global 
    \accordi
  }
}

temaUnoPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \temaUnoPart }

temaDue = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \temaDuePart }

scoreContent = << 
      \chordsPart
      \temaUnoPart
      \temaDuePart
>>
%}}}

% {{{ BOOKS
  \book{
    \bookOutputSuffix "C"
    \score {
      \scoreContent
      \layout {}
      \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 190 4) } }
    }
    \testoCompleto
  }

  \book{
    \bookOutputSuffix "Bb"
    \score { \transpose c d {\scoreContent} }
    \testoCompleto
  }

  \book{
    \bookOutputSuffix "Eb"
    \score { \transpose ees c { \scoreContent } }
    \testoCompleto
  }
% }}}
