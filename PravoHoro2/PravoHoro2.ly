% {{{ PARAMETRI
  myTitle = "Pravo Horo"
  mySubTitle = ""
  myKey = \key g \major
  myTime = \time 6/8
  myTempo =  #(ly:make-moment 100 4)
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
  (/ myStaffSize 20))
}

global = {
  \myKey
  \numericTimeSignature
  \myTime
  \set Score.markFormatter = #format-mark-box-alphabet
}
\layout { indent = #0 }
fakeBar = {  
  \cadenzaOn
  \once \omit Score.TimeSignature
  \time 1/16
  s16 \bar ""
  \cadenzaOff
  \once \omit Score.TimeSignature
  \time #'(2 2 2 3) 9/8
}
%}}}

% {{{ PARTE A
  temaA = {
    \repeat volta 2 {
      \new Voice <<
        {b8 r c b r c | d4 c8 b4. |}
        {g8 r a g r a | b4 a8 g4. |}
      >>
    }
    \alternative{
      { \new Voice <<
        {d'8 e r e4 d8 | c d d~ d c b |}
        {b8 c r c4 b8 | a b b~ b a g |}
      >> }
      { \new Voice <<
        {b8 c r c4 b8 | b a c b4 r8 |}
        {g8 a r a4 g8 | g fis a g4 r8 |}
      >> }
    }
  }

  accordiA = \chordmode{
    \repeat volta 2{
      g1*6/8 | g1*6/8 |
    }
    \alternative{
      {c1*6/8|g1*6/8| }
      {d1*6/8|g1*6/8|}
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    \repeat volta 2 {
      \new Voice <<
        {d'8 e r e4 d8 | c d d~ d c b | b c r c4 b8 | b c d e fis d |
        d e r e4 d8 | c8 d d~ d c b | b c r c4 b8 | b8 a c b4 r8|}
        {b8 c r c4 b8 | a b b~ b a g | g a r a4 g8 | g a b c d b |
        b c r c4 b8 | a b b~ b a g | g a r a4 g8 | g fis a g4 r8 |}
      >>
    } 
  }

  accordiB = \chordmode{
    \repeat volta 2{
      c1*6/8 | g1*6/8 | d1*6/8 | g1*6/8 |
      c1*6/8 | g1*6/8 | d1*6/8 | g1*6/8 |
    }
  }
% }}}

% {{{ PARTE B2
  temaBdue = {
    \repeat volta 2 {
      \new Voice <<
        {d'8 e r e4 d8 | c d d~ d c b | b c r c4 b8 | b c d e fis d |}
        {b8 c r c4 b8 | a b b~ b a g | g a r a4 g8 | g a b c d b |}
      >>
    } 
    \alternative{
      { \new Voice 
      <<
        {d e r e4 d8 | c8 d d~ d c b | b c r c4 b8 | b8 a c b4 r8|}
        {b c r c4 b8 | a b b~ b a g | g a r a4 g8 | g fis a g4 r8 |} 
      >> 
    }
    { \new Voice 
    <<
      {e'8 g, d' e4 d8 | d8 g, c d4 c8 | c g b c4 b8 | b8 a c b4 r8 |}
      {c8 e, b' c4 b8 | b8 e, a b4 a8 | a8 e g a4 g8 | g fis a g4 r8 |}
    >> 
  }
}
}

accordiBdue = \chordmode{
  \repeat volta 2{ c1*6/8 | g1*6/8 | d1*6/8 | g1*6/8 | } 
  \alternative{
    { c1*6/8 | g1*6/8 | d1*6/8 | g1*6/8 | }
    { c1*6/8 | g1*6/8 | d1*6/8 | g1*6/8 | }
  }
}
% }}}

% {{{ PARTE C
  temaC = {
    \repeat volta 2 {
      { \new Voice <<
        {e'8 g, d' e4 d8 | d8 g, c d4 c8 | c g b c4 b8 |}
        {c8 e, b' c4 b8 | b8 e, a b4 a8 | a8 e g a4 g8 |} >> 
      }
    }
    \alternative
    {
      { 
        \new Voice <<
          {b8 c d e fis d |}
          {g,8 a b c d b |} 
        >> 
      }
      {
        \new Voice <<
          {b8 a c b4 r8|}
          {g fis a g4 r8 |} 
        >> 
      }
    }
  }

  accordiC = \chordmode{
    \repeat volta 2{
      c1*6/8 | g1*6/8 | d1*6/8 |
    }
    \alternative
    {
      { g1*6/8 | }
      { g1*6/8 | }
    }
  }
% }}}

% {{{ PARTE D
  temaD = {
    \key d \major
    \repeat volta 2 {
      {
        a8 g fis e f g | a4 g8 cis4 g8 | d'8 e, cis'8~ cis bes g |
      }
    }
    \alternative
    {
      {a4. g8 fis e | }
      { a4 e8 a4 r8 | }
    }
  }

  accordiD = \chordmode{
    \repeat volta 2{
      a1*6/8 | a1*6/8 | g1*6/8:m | 
    }
    \alternative
    {
      {a1*6/8|}
      {a1*6/8|}
    }
  }
% }}}

% {{{ PARTE E
  temaE = {
    \repeat volta 2 {
      {
        d8 e, cis'~ cis a bes | cis d e cis4 e,8 | d'8 e, cis'~ cis bes g |
      }
    }
    \alternative
    {
      {a4. g8 a bes |}
      {a4 e8 a4 r8 |}
    }
  }

  accordiE = \chordmode{
    \repeat volta 2{
      g1*6/8:m | a1*6/8 | g1*6/8:m |
    }
    \alternative
    {
      {a1*6/8|}
      {a1*6/8|}
    }
  }
% }}}

% {{{ PARTE F (6)
  temaF = {
    \key a \major
    \repeat volta 2 {
      {
        cis4 a8 d4 a8 |cis4 a8 e' a, a | cis4 a8 d4 a8 |cis4 e8 b4 a8 |
        \mark \markup{ "4x" }
      }
    }
  }

  accordiF = \chordmode{
    \repeat volta 2{
      a4. d4. | a1*6/8 | a4. d4. | a4. e4. |
    }
  }
% }}}

% {{{ PARTE G
  temaG = {
    \repeat volta 2 {
      { e'8 a, a a d e, | cis'4 e,8 a b cis | d cis e cis d b | }
    }
    \alternative{
      {cis4 a8 e' a, a |}
      {cis4 a8 b4 a8 |}
    }
  }

  accordiG = \chordmode{
    \repeat volta 2{
      a1*6/8 | a1*6/8 | a1*6/8 | 
    }
    \alternative
    {
      {a1*6/8 |}
      {a4. e4. |}
    }
  }
% }}}

% {{{ PARTE H
  temaH = {
    \repeat volta 2 {
      {
        cis8 a a d a a | cis a a e' a, a | cis a a d a a  | cis a a  b4 a8 |
        \mark \markup{ "4x" }
      }
    }
    \key g \major
    g2. | g2. | \acciaccatura{cis8} d2. | d2. | \bar "||"
  }

  accordiH = \chordmode{
    \repeat volta 2{
      a4. d4. | a1*6/8 | a4. d4. | a4. e4. |
    }
    g1*6/8 | g1*6/8 | g1*6/8 | g1*6/8 |  
  }
% }}}

% {{{ PARTE I
  temaI = {
    \bar ".|:"
    \repeat volta 2 {
      {
        b4\prall d8 c4\prall d8 | b4\prall d8 c4\prall d8 | b4\prall d8 c4\prall d8 | b4 d8 a4 g8 |
        %\mark \markup{ "4x" }
      }
    }
  }

  accordiI = \chordmode{
    \repeat volta 2{
      g4. c4. | g4. c4. | g4. c4. | g4. d4. |
    }
  }
% }}}

% {{{ PARTE J
  temaJ = {
    \repeat volta 2 {
      {
        g8 a b c4 g8 | b4 g8 d' g, g | g a b c4 g8 | b8 b d a4 g8 |
        \mark \markup{ "4x" }
      }
    }
    \key d \major
    a2. | a2. | \acciaccatura{d8} e2. | e2. | \bar "||"
  }

  accordiJ = \chordmode{
    \repeat volta 2{
      g4. c4. | g1*6/8 | g4. c4. | g4. d4. |
    }
    a1*6/8 | a1*6/8 | a1*6/8 | a1*6/8 |  
  }
% }}}

% {{{ PARTE K
  temaK = {
    \bar".|:"
    \repeat volta 2 {
      a,8 g fis e fis g | a4 e8 cis'4 e,8 | d'8 e, cis'8~ cis8 b g | 
    }
    \alternative{
      {a4 a8 g fis e |}
      {a4 e8 a4 r8 |}
    }
  }

  accordiK = \chordmode{
    \repeat volta 2{ a1*6/8 | a1*6/8 | g1*6/8:m | }
    \alternative
    {
      {a1*6/8 |}
      {a1*6/8 |}
    }
  }
% }}}

% {{{ PARTE L
  temaL = {
    \repeat volta 2 {
      {d8 e, cis' cis a bes | cis d e cis4 e,8 |d'8 e, cis'~ cis a g | }
    }
    \alternative{
      {a4 a8 g8 a bes |}
      {a4 e8 a4 r8 |}
    }
    \bar"|."
  }

  accordiL = \chordmode{
    \repeat volta 2{ a1*6/8 | a1*6/8 | g1*6/8:m | }
    \alternative
    {
      {a1*6/8 |}
      {a1*6/8 |}
    }
  }
% }}}

% LYRICS {{{
testoCompleto=\markup { }
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break
  \mark \default
  \temaB \break
  \mark \markup{ \box \bold{"B2"} }
  \temaBdue \break
  \mark \default
  \temaC \break 
  \mark \default
  \temaD \break
  \mark \default
  \temaE \break
  \mark \default
  \temaF \break
  \mark \default
  \temaG \break
  \mark \default
  \temaH \break
  \mark \default
  \temaI \break
  \mark \default
  \temaJ \break
  \mark \default
  \temaK \break
  \mark \default
  \temaL 
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
    \accordiB
    \accordiBdue
    \accordiC
    \accordiD
    \accordiE
    \accordiF
    \accordiG
    \accordiH
    \accordiI
    \accordiJ
    \accordiK
    \accordiL
  }
}

temaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \tema }

scoreContent = << 
  \chordsPart
  \temaPart
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

  % \book{
  %   \bookOutputSuffix "Bb"
  %   \score { \transpose c d {\scoreContent} }
  %   \testoCompleto
  % }
  %
  % \book{
  %   \bookOutputSuffix "Eb"
  %   \score { \transpose ees c { \scoreContent } }
  %   \testoCompleto
  % }
% }}}
