% DEFINIZIONI {{{
\version "2.18.2"

\header {
  title = "Jovano Jovanke"
  composer = "Macedonian"
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
  \key f \major
  \numericTimeSignature
  \time #'(3 2 2) 7/8
  \set Score.markFormatter = #format-mark-box-alphabet
}
%}}}


tema = {
  \mark \default
  \repeat volta 2 {
    e8 f d e4 d8 cis |
    cis d bes cis4 bes8 a |
  }
  \alternative{
    { a8 bes g a bes cis d | e f d e4 r4 | } 
    { a,8 bes g a bes cis g | a4.~ a2~ | a4.~ a2 |}
  }\bar"||" \break

  \mark \default
  cis4 e8 d cis bes4 | a4.~ a2 | 
  \new Voice <<
    {cis4 e8 d cis bes4 | cis4.~ cis2 | }
    {e4 g8 f e d4 | e4.~ e2 |}
  >>

  \break
  \repeat volta 2{
    \new Voice <<
      {a4 a8 a4 a| a8 g a bes4 bes8 a| 
      g4 g8 g4 g | g8 f g a2 |
      f4 f8 f4 g8 a | bes4 a8 g4 f |
      e4 e8 f e f g | e4 g8 f e d cis |
      cis4.~ cis2~ | cis4.~ cis2 |
    }
    {
      f4 f8 f4 f | f8 e f g4 g8 f |
      e4 e8 e4 d | e8 d e f2 |
      d4 d8 d4 e8 f | g4 f8 e4 d |
      cis4 cis8 d8 cis d e | cis4 e8 d cis bes a|
      a4.~ a2~ | a4.~ a2 |
    }
  >>
}
}

accordi = \chordmode{
  \set chordChanges = ##t
  \repeat volta 2{
    a1*7/8 |a1*7/8 |
  }
  \alternative{
    {a1*7/8 |a1*7/8 |}
    {a1*7/8 |a1*7/8 |a1*7/8 |}
  }

  a4. a4 g4:m | a1*7/8 |
  a4. a4 g4:m | a1*7/8 |

  \repeat volta 2{
  d1*7/8:m | d4.:m d4:m g4:m | 
  c1*7/8 | c4. d2:m | 
  d1*7/8:m | g1*7/8:m |
  a1*7/8 | a4. a4 g4:m | 
  a1*7/8 | a1*7/8 |
  }
}


% LYRICS {{{
testoCompleto=\markup {
  \vspace #2
  \fill-line {
    \hspace #1
    \column {
      \line {Jovno,Jovanke }
      \line {Kraj vardaro sedis,mori }
      \line {belo platno belis }
      \line {belo platno belis duso }
      \line {srce moje Jovano }
      \vspace #1
      \line {Jovano,Jovanke }
      \line {Jas te tebe cekam,mori }
      \line {doma da mi dojdes }
      \line {a ti ne doadas duso }
      \line {srce moje Jovano }
      \vspace #1
      \line {Jovano,Jovanke }
      \line {tvojata majka,mori }
      \line {tebe nete pusta }
      \line {kraj mene da dojdes duso }
      \line {srce moje Jovano }
    }
    \hspace #2
    \column \italic {
      \line {Jovano, Jovanke,}
      \line {you sit by the Vardar,}
      \line {bleaching your white linen,}
      \line {bleaching your white linen, my dear,}
      \line {looking at the hills. }
      \vspace #1
      \line {Jovano, Jovanke,}
      \line {I'm waiting for you}
      \line {to come to my home,}
      \line {and you don't come, my dear,}
      \line {my heart, Jovano. }
      \vspace #1
      \line {Jovano, Jovanke,}
      \line {your mother}
      \line {doesn't let you}
      \line {come to me, my dear,}
      \line {my heart, Jovano.}
    }
    \hspace #1
  }
}
% }}}

% SCORE {{{
tema = \relative c' {
  \global 
  \tema
}

chordsPart ={
  \new ChordNames {
    \accordi
  }
}

temaPart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \tema }

\book{
  \bookOutputSuffix "Score"
  \score {
    <<
      \chordsPart
      \temaPart
    >>
    \layout {
      indent = #0
    }
    \midi {
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 100 4)
      }
    }
  }
  \testoCompleto
}

\book{
  \bookOutputSuffix "Bb"
  \score {
    <<
      \transpose c d { \chordsPart }
      \transpose c d { \temaPart}
    >>
    \layout {
      indent = #0
    }
  }
  \testoCompleto
}
% }}}
