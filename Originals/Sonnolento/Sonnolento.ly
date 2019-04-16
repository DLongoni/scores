% {{{ PARAMETRI
  myTitle = "Sonnolento"
  myKey = \key c \major
  myTime = \time 2/4 
  myTempo =  #(ly:make-moment 60 4)
% }}}

% INTESTAZIONE {{{
\version "2.18.2"

\header {
  title = \myTitle
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
%}}}

% {{{ PARTE A
  temaA = {
    \repeat volta 2{
      g4 c bes g8 f | g4 f8 ees | f ees c bes |
      g'4 c | bes g8 f | a4 a8 f | g2 |
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

  accordiA = \chordmode{
    \repeat volta 2{
      c4:maj7 aes:maj7 | bes2:7 | g4:m7 des:6.9 | f2:7 |
      c4:maj7 aes:maj7 | bes2:7 | a2:m7 | g2:7 |
    }
  }

  bassoA = {
    \repeat volta 2{
      c4 aes | bes2 | g4 des' | f,2 |
      c'4 aes | bes2 | a2 | g2 |
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    \time 6/8
    \key c \minor
    \repeat volta 2{
      c,8 ees g c b c | d c bes aes g bes | 
      f4. g4 f16 g | f ees  c4~ c4. |
      c8 ees g c b c | a4 a8 g b c | 
      ees16 f d4~ d4. | 
    }
    \alternative{
      { r4. f,8 fis g | }
      { r2. | }
    }
}

  accordiB = \chordmode{
    \repeat volta 2 {
      c2.:m | bes2. | f4.:m g4.:7 | c2.:m | \break
      c2.:m | f2. | g2.:7 |
    }
    \alternative
    {
      { bes2.: | }
      { g2.:7 | }
    }
  }
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break
  \mark \default
  \temaB \break
}

basso = \relative c {
  \bassoA \break
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
    \accordiB
  }
}

temaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \tema }

bassoPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "bass" \basso }

ritmicaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" 
      \new Voice <<  
        \relative c'' {\ritmicaAuno }
        \relative c' {\ritmicaAdue }
      >>
}

scoreContent = << 
  \chordsPart
  \temaPart
  \ritmicaPart
  \bassoPart
>>
%}}}

% {{{ BOOKS
  \book{
    \bookOutputSuffix "C"
    \score {
      \scoreContent
      \layout {}
      \midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 90 4) } }
    }
  }
% }}}
