% {{{ PARAMETRI
  myTitle = "Rumba De La Lasi"
  myKey = \key aes \major
  myTime = \time 4/4 
  myTempo =  #(ly:make-moment 190 4)
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
    \partial 4. c8 des e |
    f4 r8 g16 f ees4 r8 f16 ees | des4 r8 ees16 des c8 c des e | 
    f2 r2 | r2 r4 r8 aes,8 |\break
    \repeat volta 2 {
      f4 r8 aes8 f4 r8 aes | c4 r8 aes8 c4 r8 f  | 
      ees4 r8 bes8 g4 r8 aes |
    } 
    \alternative{
      { f4 r8 aes8 f4 r8 aes |}
      { f4 r8 aes8 f4 aes16 g aes bes |}
    }
  }

  accordiA = \chordmode{
    \partial 4. s4.
    s1| s1 | f1:m | f1:m |
    \repeat volta 2{
      f1:m | f1:m | ees1 |
    }
    \alternative{
      { f1:m |}
      { f1:m |}
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    \repeat volta 2 {
      c2. b8 c | des4 c bes g8 aes | bes2. c8 bes |
    } 
    \alternative{
      { c bes r2 aes16 g aes bes |}
      { c8 bes r2 r8 aes'8 |}
    }
    aes8 g g f f4 ees8 g | g8 f f ees ees4 r4 |
    aes8 g g f f4 ees8 g | g8 f f ees ees4 ees16 d ees e |
  }

  accordiB = \chordmode{
    \repeat volta 2{
      f1:m | f4:m ees4/g aes4 f4/a:7 | bes1:m | 
    }
    \alternative{
      { bes1:m |}
      { bes1:m |}
    }
    f1:m | ees1 | f1:m | ees1 |
  }
% }}}

% {{{ PARTE C
  temaC = {
    f4 r2 des8 ees | f4 r2 ees16 d ees e |
    f4 r2 des8 ees | f4 r4 r2 |  \break
    \repeat volta 2 {
      c4 f16 e f8  aes16 g aes8 c4 | r8 c b c des16 des c des bes g e des |
      c4 e16 ees e8 g16 fis g8 bes4 | r8 bes a bes des bes16 c a f des8 |
    } 
  }

  accordiC = \chordmode{
    f1:m | f1:m | f1:m | f1:m |
    \repeat volta 2{
      f1:m | f1:m | c1:7 | c1:7 |
    }
  }
% }}}

% {{{ PARTE D
  temaD = {
    \repeat volta 2 {
       c4 b16 c des c bes4 a16 bes c bes |
      aes4 g16 aes bes aes g4 aes16 g aes bes |
    } 
  }

  accordiD = \chordmode{
    \repeat volta 2{
      f2:m ees2 | des2 c2 |
    }
  }
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \break
  \mark \default
  \temaB \break
  \mark \default
  \temaC \break 
  \mark \default
  \temaD 
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
    \accordiB
    \accordiC
    \accordiD
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
  }

  \book{
    \bookOutputSuffix "Bb"
    \score { \transpose c d {\scoreContent} }
  }
% }}}
