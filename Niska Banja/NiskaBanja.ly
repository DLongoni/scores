% {{{ PARAMETRI
  myTitle = "Niska Banja"
  mySubTitle = "Serbian Rom"
  myKey = \key f \major
  myTime = \time #'(2 2 2 3) 9/8
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

toCoda = {
  % the align part
  \once \override Score.RehearsalMark.self-alignment-X = #RIGHT  
  \once \override Score.RehearsalMark.break-visibility = #begin-of-line-invisible
  \once \override Score.RehearsalMark.direction = #DOWN
  \once \override Score.RehearsalMark.font-size = #-1
  \mark \markup { { \lower #1 "D.S. al  " { \musicglyph #"scripts.coda"} } } 
}

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
    \partial 4.  \new Voice <<
      {\partial 4. c8 des d |}
      {\partial 4. a8 bes b | }
    >>
    \mark \markup { \musicglyph #"scripts.segno" }
    \repeat volta 2 {
      \new Voice <<
        {ees4 ees ees ees8 des c | des4 des des des8 c bes | c8 des f e f e des c bes | }
        {c4 c c c8 bes a | bes4 bes bes bes8 a ges | a bes des c des c bes a ges | }
      >>
    }
    \alternative{
      {
        \new Voice <<
          {c4 c c c8 des d |}
          {a4 a a a8 bes b |}
        >>
      } 
      {
        \new Voice <<
          {c2. r4. | }
          {a2. s4. | }
        >>
      }
    }
  }

  accordiA = \chordmode{
    \set chordChanges = ##t
    \partial 4. s4. |
    \repeat volta 2{
      f1*9/8 | bes1*9/8:m | c1*9/8 |
    }
    \alternative{
      {f1*9/8|}
      {  \once \set chordChanges = ##f f1*9/8|}
    }
  }
% }}}

% {{{ PARTE B
  temaB = {
    \repeat volta 2 {
      c4 d bes c8 bes a | bes4 bes a8 bes c4. | c4 d bes c8 bes a | bes4 bes a8 bes a4. |
    }
  }

  accordiB = \chordmode{
    \repeat volta 2{
      f1*9/8 | c2 c4 f4. | f1*9/8 | c2 c4 f4. |
    }
  }
% }}}

% {{{ PARTE C
  temaC = {
    \repeat volta 2 {
      \new Voice <<
        {c4 f f f4. | a4 bes g a4. | a4 bes g a f8 |}
        {f,4 a a a4. | c4 d bes c4. | c4 d bes c a8 |}
      >>
    }
    \alternative{
      {
        \new Voice <<
          { g'4 g f8 g f e d | }
          { bes4 bes a8 bes a g f| }
        >>
      } 
      {
        \new Voice <<
          {g'4 g4 f8 g f4. |}
          {bes,4 bes a8 bes a4. |}
        >>
      }
    }
  }

  accordiC = \chordmode{
    \set chordChanges = ##t
    \repeat volta 2{ f1*9/8 | f1*9/8 | f1*9/8 | }
    \alternative{
      {c2 c4 f4. |}
      {c2 c4 f4. |}
    }
  }
% }}}

% {{{ PARTE D
  temaD = {
    \repeat volta 2 {
      \new Voice <<
        { a'4 bes g a f8 | g4 g f8 g a4. | a4 bes g a f8 |}
        { c4 d bes c a8 | bes4 bes a8 bes c4. | c4 d bes c a8 |}
      >>
    }
    \alternative{
      {
        \new Voice <<
          {g'4 g f8 g f4. | }
          {bes,4 bes a8 bes a4. |}
        >>
      } 
      {
        \new Voice <<
          {g'4 g f8 g c,8 des d |}
          {bes4 bes a8 bes a8 bes b | }
        >>
      }
    }
    \toCoda 
  }

  accordiD = \chordmode{
    \repeat volta 2{
      \set chordChanges = ##t
      f1*9/8 | c2 c4 f4. | f1*9/8 |
    }
    \alternative{
      {c2 c4 f4.}
      {c2 c4 f4.}
    }
  }
% }}}

% {{{ CODA
  temaCoda = {
    \fakeBar
    \mark \markup { \musicglyph #"scripts.coda" }
    \new Voice <<
      { g4 g f f8 r r |}
      {bes4 bes a a8 r r |}
    >>
  }

  accordiCoda = \chordmode{
    \fakeBar
    \set chordChanges = ##t
    c2 c4 f4. |
  }
% }}}

% LYRICS {{{
intro=\markup {
  \vspace #2
  \fill-line {
    \column{
      \override #'(line-width . 85)
      \justify \italic{
        Niska Banja is a natural hot mineral spring health resort about ten kilometers east of the
        town ofNis in southeast Serbia. It is believed that the waters help people with
        cardiovascular diseases. The spring, which was used by the Romans, is slightly radioactive.
        After the Ottoman invasion, the spa continued to be used by men and women, who came to
        bathe on a regular basis. The song words, which symbolize the Dionysian joy of I ife, music,
        and dance, are meant to be humorous as well as provocative. Every generation adds its own
        words so the lyrics are quite extensive and often quite bawdy. The lyrics have become the
        lmofficial song ofNis.
      }
    }
  }
}
testoCompleto=\markup {
  \vspace #3
  \fill-line {
    \column{
      \override #'(line-width . 85)
      \fill-line{
        \column {
          \line {Niska Banja, topla voda}
          \line {za mangupe ziva zgoda,}
          \vspace #1
          \line {Em ka lavlam, em kamavla,}
          \line {and'o Niili ka mekav la.}
          \vspace #1
          \line {Mi Cigani meraklije,}
          \line {ne mozemo bez rakije.}
          \vspace #1
          \line {Bez rakije, sljivovice,}
          \line {i bez mlade CiganCice.}
        }
        \hspace #2
        \column \italic {
          \line{The public bath near Niil, hot water,}
          \line{for the naughty boys a real convenience. (SC)}
          \vspace #1
          \line{I will get her, I will love her,}
          \line{and inNis I will leave her. (SC)}
          \vspace #1
          \line{We Gypsies love a good time,}
          \line{we can't make it without plum brandy; (R)}
          \vspace #1
          \line{Without grape brandy, plum brandy,}
          \line{without a young Gypsy girl. (SC) }
        }
      }
    }
  }
}
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \bar "||" \break
  \mark \default
  \temaB \break
  \mark \default
  \temaC \bar "||" \break
  \mark \default
  \temaD \bar "||" \break
  \temaCoda \bar "|."
}

chordsPart ={
  \new ChordNames {
    \accordiA
    \accordiB
    \accordiC
    \accordiD
    \accordiCoda
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
