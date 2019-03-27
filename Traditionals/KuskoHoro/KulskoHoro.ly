% {{{ PARAMETRI
  myTitle = "Kulsko Horo"
  mySubTitle = "Bulgarian - Sever"
  myKey = \key c \major
  myTime = \time 2/4
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

% {{{ TEMA UNO
  temaUno = {
    % A
    \mark \default
    \repeat volta 2 {a8 a \acciaccatura{d8} c c | d16 c b g a8\prall a16 e | a8 a \acciaccatura{d8} e e | d16 c b g a8 r8|  }
    \break
    \repeat volta 2{ d16 c b a e'8 e | d16 c b g a8 a16 e | d'16 c b a e'8 e | d16 c b g a8 r8 | }
    \break

    % B
    \mark \default
    \repeat volta 2{
      b16 c d8 d16 g, d' g, | ees' d c ees d8\prall d16 g, | b c d g, ees' c ees g |
    }
    \alternative{
      {fis16 ees d c d8\prall d16 g, |}
      {fis'16 ees d c d4\prall|}
    }
    \bar"||"
    \break
    \repeat volta 2{ d16 c b g a8\prall a16 e' | d c b g a8 a | d16 c b g a8\prall a16 e' | d c b g a8 r8 | }
    \break

    % C
    \mark \default
    \repeat volta 2{
      g16 a b8\prall b16 d b8\prall | b16 d c8\prall c16 d b8\prall | fis16 g a8\prall a16 g fis g | a d, a' b g8\prall g16 d |
      \break
      g16 a b8\prall b16 d b8\prall | b16 d c8\prall c16 d b8\prall | b16 g a8\prall a16 g fis g | a d, a' b g4 |
    }
  }
% }}}

% {{{ TEMA DUE
  temaDue = {
    % A
    \repeat volta 2 {a'4 a | g a | a a | g a |}
    \repeat volta 2{f4 e | d c | f e | d c |}

    % B
    \repeat volta 2{
      g'4 g | g g | g8 fis f e |
    }
    \alternative{
      {d8 fis g4}
      {d8 fis g4}
    }
    \repeat volta 2{g8 g a a | g g a a | g fis f e | d  g a r8 |}

    % C
    \repeat volta 2{ g4 f | e d | c d | d g | g f | e d | c d | d g | }
  }
% }}}

% {{{ ACCORDI
  accordi = \chordmode{
    % A
    \repeat volta 2 {a2:m | g4 a4:m | a2:m | g4 a4:m |}
    \repeat volta 2{d4:m a4:m | g4 a4:m | d4:m a4:m | g4 a4:m |}

    % B
    \repeat volta 2{
      g2 | c4:m g4 | g4 c4:m | 
    }
    \alternative{
      {d4 g4|}
      {d4 g4|}
    }
    \repeat volta 2{g4 a4:m | g4 a4:m | g4 f4 | g4 a4:m|}

    % C
    \repeat volta 2{g2 | g8 d8 d8 g8 | d2 | d4 g4 | g2 | g8 d8 d8 g8 | g8 d8 d4 | d4 g4 |}
  }
% }}}

% LYRICS {{{
testoCompleto=\markup {
}
% }}}

% SCORE {{{
temaUnoPart = \relative c' {
  \temaUno
}

temaDuePart = \relative c' {
  \temaDue
}

chordsPart ={
  \new ChordNames {
    \set chordChanges = ##t
    \accordi
  }
}

temaUnoPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \temaUnoPart }

temaDue = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \temaDuePart }

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
