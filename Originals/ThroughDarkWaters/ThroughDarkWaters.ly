% {{{ PARAMETRI
  myTitle = "Through Dark Waters"
  myFname = "ThroughDarkWaters"
  myKey = \key f \major
  myTime = \time #'(2 2 3) 7/8
  myTempo =  #(ly:make-moment 60 4)

  struttura = \markup {
    \column {
      \line {\bold{Intro} free, \bold{Intro} loop, \bold{A}x2 Fisa, \bold{Bridge} tutti, \bold{A}x2 Tr, \bold{Solo} Tr, 
      \bold{B}, \bold{Bridge} Gtr,  \bold{A}x2, \bold{Solo} Gtr}
      }
    }
% }}}

% INTESTAZIONE {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"
%}}}

% {{{ PARTE A
  temaA = {
      a4 c8 r8 d16 e d f r e | d16 e d8 c r bes16 a c bes r a |
      f16 g f8 e r f16 e g f r c | d2~ d4. | r2 r4. | \break
      a'4 c8 r8 d16 e d f r e | d16 e d8 c r bes16 a c bes r a |
      f16 g f8 e r c'16 a d bes r e | f2~ f4. | r2 r4. |
  }

  temaAdue = {
      d4 f8 r8 g16 a bes c r a | g16 a g8 f r f16 e g f r e |
      e16 f e8 d r a'16 g e c r bes | a2~ a4. | r2 r4. |
      d4 f8 r8 f16 g a bes r bes | a16 bes a8 g r f16 e g f r e |
      e16 f e8 d r a'16 g bes f r g | d2~ d4. | r2 r4. |
  }

  ritmicaA = {
      d8 d f d c e16 c~ c8 | d8 d f d c e16 c~ c8 | d8 d f d c e16 c~ c8 |
      d8 d f d c e16 c~ c8 | d8 d f d c e16 c~ c8 |
      d8 d f d c e16 c~ c8 | d8 d f d c e16 c~ c8 | d8 d f d c e16 c~ c8 |
      d8 d f d c e16 c~ c8 | d8 d f d c e16 c~ c8 |
  }

  accordiA = \chordmode{
      d2:m c4.| d2:m c4.| d2:m c4.|
      d2:m c4.| d2:m c4.|
      d2:m bes4.| d2:m bes4.| d2:m bes4.|
      d2:m bes4.| d2:m bes4.|
  }
% }}}

% {{{ PARTE A
  temaB = {
    \repeat volta 4 {
      c,2~ c4.~ c2 g8 a bes | 
    }
    \alternative{
      { f'4 des ges,8 aes4 | }
      { f'4 des4 f8 g4 | }
    }      
    \break
    aes2~ aes4.~ | aes2 f8 g aes | des4 bes4 des,8 f4 |
    aes2~ aes4.~ | aes2 f8 g aes | des4 bes4 des,8 f4 | \break
    aes2~ aes4.~ | aes2 f8 g aes | des4 bes4 des,8 e4 |
    aes2~ aes4.~ | aes2 ees8 f ges | f4 des4 bes4. | \break

    c2~ c4.~ | c2 g8 a bes | f'4 des ges,8 aes4 | 
    c2~ c4.~ | c2 g8 a bes | f'4 des ges,8 aes4 | 

    c2~ c8 a8 bes | c2~ c8 a8 bes | 
    c2~ c8 a8 bes | c2 a8 c4 | d2\fermata r4 r8 |
  }

  temaBdue = {
    \repeat volta 4 {
      s1*7/8 | s1*7/8 | 
    }
    \alternative{
      { s1*7/8 | }
      { s1*7/8 | }
    }
    f4 aes,8 c f4.~ | f2 r4. | des2~ des4. |
    f4 aes,8 c f4.~ | f2 r4. | des2~ des4. |
    f4 aes,8 c f4.~ | f2 r4. | des2~ des4. |
    c4 f,8 aes c4.~ | c2~ c4. | bes2~ bes4. |
    g2~ g4. | r1*7/8 | r1*7/8 | r1*7/8 | r1*7/8 | r1*7/8 |
    s1*7/8 | s1*7/8 |
    s1*7/8 | s1*7/8 | s1*7/8 |
  }


  ritmicaB = {
    \repeat volta 4 {
      s1*7/8 | s1*7/8 | 
    }
    \alternative{
      { s1*7/8 | }
      { s1*7/8 | }
    }
    r4 <f aes>4~ <f aes>4.~ | <f aes>2~ <f aes>4. | r2 r4. |
    r4 <f aes>4~ <f aes>4.~ | <f aes>2~ <f aes>4. | r2 r4. |
    r4 <f aes>4~ <f aes>4.~ | <f aes>2~ <f aes>4. | r2 r4. |
    r4 <f aes>4~ <f aes>4.~ | <f aes>2~ <f aes>4. | r2 r4. |

    r4 <e g>4~ <e g>4.~ | <e g>2~ <e g>4. | r2 r4. |
    r4 <e g>4~ <e g>4.~ | <e g>2~ <e g>4. | r2 r4. |

    <e g>4 <e g>4~ <e g>4. | <e g>4 <e g>4~ <e g>4. | 
    <e g>4 <e g>4~ <e g>4. | <e g>4 <e g>4~ <e g>4. | 
    <d f>4\staccato r4 r4. |
  }

  accordiB = \chordmode{
    \repeat volta 4 {
      c1*7/8 | c1*7/8 | 
    }
    \alternative{
      { bes1*7/8:m7 | }
      { bes1*7/8:m7 | }
    }
    f1*7/8:m | f1*7/8:m | bes1*7/8:m7 | 
    f1*7/8:m | f1*7/8:m | bes1*7/8:m7 | 
    f1*7/8:m | f1*7/8:m | g1*7/8:dim7 |
    f1*7/8:m/aes | f1*7/8:m/aes |  bes1*7/8:m7 |

    c1*7/8 | c1*7/8 | bes1*7/8:m7 | 
    c1*7/8 | c1*7/8 | bes1*7/8:m7 | 

    c1*7/8 | c1*7/8 | 
    c1*7/8 | c1*7/8 | d1*7/8:m |
  }
% }}}

% SCORE {{{
tema = \relative c' {
  \mark \default
  \temaA \bar "||" \break
  \mark \default
  \temaB \break
  \bar "|."
}

temaDue = \relative c' {
  \temaAdue 
  \temaBdue
}

ritmica = \relative c' {
  \ritmicaA 
  \ritmicaB
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

temaDuePart = \new Staff \with {
  instrumentName = ""
  midiInstrument = "piano"
} { \clef "treble_8" \global \temaDue }

scoreContent = << 
  \chordsPart
  \temaPart
  \temaDuePart
  \ritmica
>>

temiContent = << 
  \chordsPart
  \temaPart
  \temaDuePart
>>
%}}}

% {{{ BOOKS
  \book{
    \bookOutputName \myFname
    \struttura
    \header{ composer="C" }
    \bookOutputSuffix "C"
    \score {
      \scoreContent
      \layout {}
    }
  }

  \book{
    \bookOutputName \myFname
    \struttura
    \header{ composer="Bb" }
    \bookOutputSuffix "Bb"
    \score { \transpose c d {\scoreContent} }
  }
% }}}
