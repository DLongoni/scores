% {{{ PARAMETRI
  myTitle = "Vranjanka (Sano duso)"
  mySubTitle = "Serbian - Vranje"
  myKey = \key c \major
  myTime = \time #'(3 2 2) 7/8
  myTempo =  #(ly:make-moment 90 4)
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
    \repeat volta 2 {
      c8 b aes b4\prall \tuplet 3/2 4 {aes8 g f} | g4 f8 g aes b c | c b aes b4 \tuplet 3/2 {aes8 g f} | 
    }
    \alternative {
      {g4 c,8 g'4 g8 aes |}
      {g4 \acciaccatura{b8} c8 g4 r4 |}
    }
    \bar "||"
    \break

    % B
    \mark \default
    \repeat volta 2{
      \acciaccatura{b8} c4 c8 c4 c | b4 aes8 g aes b c | \acciaccatura{c} d4 c8 b4 \tuplet 3/2 {aes8 g f } | 
    }
    \alternative{
      {g4. g4 r4|}
      {g4. g4 r4|}
    }
    \bar"||"
    \break

    % C
    \mark \default
    a4 a8 a4 a | a4 g8 \acciaccatura{b8} c4 c | g a8 g4 f | e4 d8 c2 |
    \repeat volta 2{ e4 f8 g4 f8 e | d4 d8 a'4 a | }
    \alternative{
      {g4 a8 g4 f4 | e d8 c g c d |}
      {g4 a8 g4 f4 | e4 d8 c4 r4 |}
    }
  }
% }}}

% {{{ TEMA DUE
  temaDue = {
    % A
    \repeat volta 2 {
      aes8 g f g4\prall \tuplet 3/2 4 {f8 e c} |e4 c8 e f g aes | aes8 g f g4 \tuplet 3/2 {f8 e c} | 
    }
    \alternative {
      {e4 c8 e4 e8 f|}
      {e4 g8 e4 r4|}
    }

    % B
    \repeat volta 2{
      aes4 aes8 aes4 aes | g f8 e f g aes | b4 a8 g4 \tuplet 3/2 {f8 e c} | 
    }
    \alternative{
      {e4. e4 r4|}
      {e4. e4 r4|}
    }

    % C
    f4 f8 f4 f4 | f e8 a4 a | e f8 e4 d | c b8 c2 |
    \repeat volta 2{c4 d8 e4 d8 c | b4 b8 f'4 f | }
    \alternative{
      {e4 f8 e4 d4 | c b8 c g c b |}
      {e4 f8 e4 d | c b8 c4 r4 |}
    }
  }
% }}}

% {{{ TEMA TRE
  temaTre = {
    % A
    \repeat volta 2 {
      f4. g2 | c,4. c4 e | f4. g4 g | 
    }
    \alternative {
      {c,4. c4 e |}
      {c4. c4 r4 |}
    }

    % B
    \repeat volta 2{
      f4 f8 f4 f | f4 f8 f4 f| g4 g8 g4 b4 |
    }
    \alternative{
      { c4. c4 aes8 g |}
      {c4. c4 e,|}
    }

    % C
    f4 f8 f4 f4 | c4 c8 c4 c | g'4 g8 g4 a8 b | c4. c4 c |
    \repeat volta 2{c4. c4 c | g4. a4 a |}
    \alternative{
      {b4 g8 b4 g4 | c4 g8 c4 g4 |}
      {g4 g8 g4 a8 b | c4. c4 r4 |}
    }
  }
% }}}

% {{{ ACCORDI
  accordi = \chordmode{
    % A
    \repeat volta 2 {
      f4.:m g2 | c1*7/8 | f4.:m g2 | 
    }
    \alternative {
      {c1*7/8 |}
      {\once \set chordChanges = ##f c1*7/8 |}
    }

    % B
    \repeat volta 2{
      f1*7/8:m | f1*7/8:m | g1*7/8 |
    }
    \alternative{
      {c1*7/8 |}
      {c1*7/8 |}
    }

    % C
    f1*7/8 | f4. c2 | g1*7/8 | c1*7/8 |
    \repeat volta 2{c1*7/8 | c4. f2 |}
    \alternative{
      {g1*7/8:7 | c1*7/8 |}
      {g1*7/8:7 | c1*7/8 |}
    }
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

temaTrePart = \relative c {
  \temaTre
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

temaDuePart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \temaDuePart }

temaTrePart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "bass" \global \temaTrePart }

scoreContent = << 
  \chordsPart
  \temaUnoPart
  \temaDuePart
  \temaTrePart
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
