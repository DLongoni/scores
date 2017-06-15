% {{{ PARAMETRI
  myTitle = "Djunguritsa"
  mySubTitle = "Bulgarian, Pirin"
  myKey = \key c \major
  myTime = \time #'(2 2 2 3) 9/8
  myTempo =  #(ly:make-moment 120 4)
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
%}}}

% {{{ PARTE A
  temaA = {
    \repeat volta 2 {
      d,16 e e e e8 e' d c b a g | a16 a a g a8 b c d b4 b8 | cis16 d d cis d8 e d c b a g | a16 a a g a8 b g16 a g fis e4.|
    } 
  }

  accordiA = \chordmode{
    \repeat volta 2{
      e4:m c4 d4 g4. | a4:m a4:m d4:/fis g4. | c2 d4 g4. | a2:m b4:m e4.:m |
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    \repeat volta 2 {
      g16 d a' a a8 fis g16 d fis d g8 fis d | g16 d a' a a8 fis g fis d4. |
      g8 a16 a a8 a d8 c b a g | a16 a a g a8 b g16 a g fis 
      \once \override Score.RehearsalMark.direction = #DOWN
      \once \override Score.RehearsalMark.self-alignment-X = #RIGHT  
      \mark \markup { { \lower #1 \italic "D.C."} }  e4. |
    } 
  }

  accordiB = \chordmode{
    \repeat volta 2{
      a2:m d4 g4. | a2:m a4 d4. | b2:m c4 g4. | a2:m b4:m e4.:m |
    }
  }
% }}}

% {{{ PARTE C
  temaC = {
    \repeat volta 2 {
      cis16 d d cis d8 r8 cis16 d d cis d8 e4 | cis16 d d cis d8 e8 d8 c8 b a g |
    } 
  }

  accordiC = \chordmode{
    \repeat volta 2{
      e1*9/8 | e1*9/8 | 
    }
  }
% }}}

% {{{ PARTE D
  temaD = {
    \repeat volta 2 {
      bes'8 bes16 a g8 d' | bes16 d a bes g8 d' | bes bes16 a g8 d' | bes16 d a bes16 g4 |
    } 
  }

  accordiD = \chordmode{
    \repeat volta 2{
      g2:m | g2:m | g2:m | d4 g4:m |
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
  \mark \default
  \temaC
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordiA
    \accordiB
    \accordiC
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
