% {{{ PARAMETRI
  myTitle = "Petrunino Horo"
  mySubTitle = "Bulgarian Traditional"
  myKey = \key f \major
  myTime = \time #'(3 2 2 2 3) 12/8
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

% {{{ MAIN
tema = {
  \mark \default
  \repeat volta 2 {
    f8 e f g4 g8 f g a bes4 a8 | g a f a g~ g f g4 g4. |
    f8 e f g4 g8 f g a bes4 a8 | 
  }
  \alternative{
    {b8 c c g4 g8 f g4 g4. |}
    {b8 c c g4 g8 f g4 g f8}
  }\bar"||" \break

  \mark \default
  g8 a f b c a f bes4 a8 a f |  g8 a f b c a f bes4 a8 a f |
  g8 a f b c a f bes4 a8 a f | g4 c8 g f e f g4 g f8| \bar"||" \break

  \mark \default
  g8 a f a bes bes a g a c f, f | g8 a f a bes bes a g a c f, f |
  g8 a f a bes bes a g a c f, f | g4 c8 g f e f g4 g4. \bar"||" \break

  \key c \major

  \mark \default
  b8 c c c b c d c b aes g f | \acciaccatura{c'8} g4 f8 g f g aes b c b4. |
  f8 g aes b c c d c b aes g f | c' g4 b8 aes g f g4 g4. |\bar"||" \break

  \mark \default
    c8 g4 b8 aes g f g aes b c f | c b aes b aes g f g4 g4. | 
    c8 g4 b8 aes g f g aes b c f | c b aes b aes g f g4 g4. |
  \bar"|." 
}

accordi = \chordmode{
  \set chordChanges = ##t
  \repeat volta 2{
    f1*12/8 | f4. f2 c4 c4.| f1*12/8 |
  }
  \alternative{
    {f4. f2 c4 c4.|}
    {f4. f2 c4 c4.|}
  }

  f1*12/8 | f1*12/8 | f1*12/8 | c1*12/8 |
  f1*12/8 | f1*12/8 | f1*12/8 | c1*12/8 |
  f1*12/8:m | f1*12/8:m | f1*12/8:m | c1*12/8 |
  f1*12/8:m | f1*12/8:m | f1*12/8:m | c1*12/8 |
}
%}}}

% LYRICS {{{
testoCompleto=\markup { }
% }}}

% SCORE {{{
tema = \relative c {
  \tema
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordi
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
