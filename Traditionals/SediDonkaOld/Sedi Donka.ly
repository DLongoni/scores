% INITIALIZATION {{{
  myTitle = "Sedi Donka"
  myFname = "SediDonka"
  mySubTitle = "Bulgarian Traditional"
  myKey = \key f \major
  myTime = \time #'(3 2 2) 7/8

%   struttura = \markup {
%     \column {
%       \line {
%         Struttura: \bold{A}(g,b) \bold{B1x}(g,b) \bold{B2x}(g\italic{8va},b)
%         \bold{A1x}(g,f,b) \bold{A2x}(g\italic{2voce},f,b) \bold{B}(g,f,b) \bold{C1}(t)
%       }
%       \line {
%         \bold{A2}(t) \bold{B2}(t,\italic{piano}) \bold{C2}(t) \bold{D} (g,f,c,t) \bold{Coda}
%       }
%       \line {
%         Clarino: entra a \bold{C1}, \bold{A2} 1voce, \bold{B2} 1voce, metà \bold{C2} 2voce, \bold{D2} 2voce, \bold{Coda}
%       }
%       \line {
%         Tromba: entra a \bold{C1}, \bold{A2} 2voce, \bold{B2} no, metà \bold{C2} 1voce, \bold{D2} 1voce, \bold{Coda}
%       }
%       \line {
%         Fisa: entra la 2a \bold{A1} 1voce, \bold{B1} 1voce, \bold{C1}, \bold{A2} acc, \bold{B2} 1voce, \bold{C2} 2voce, \bold{D2} acc \bold{Coda}
%       }
%       \line {
%         Chitarra: intro scritta, \bold{A2} acc \bold{B2} acc metà \bold{C2} 1voce, \bold{D2} acc \bold{Coda}
%       }
%     }
% }
% }}}

% DEFINIZIONI {{{
\version "2.18.2"
\include "/home/davide/scores/Template/Common.ly"
toCoda = {
  % the align part
  \once \override Score.RehearsalMark.self-alignment-X = #RIGHT  
  \once \override Score.RehearsalMark.break-visibility = #begin-of-line-invisible
  \mark \markup { { \lower #1 "al  " { \musicglyph #"scripts.coda"} } } 
}
%}}}

% PARTE A {{{
temaA={
  \repeat volta 2 {
    \time #'(3 2 2) 7/8
    a8 c, f a16 bes a8 g f| g c, e g16 a g8 f e |
    \time #'(2 2 3 2 2) 11/8
    d e c a c d e f4 f|\break
    \time #'(3 2 2) 7/8
    a8 c, f a16 bes a8 g f| g c, e g16 a g8 f e |
    \time #'(2 2 3 2 2) 11/8
    d e c a c d e d4 d|\break
  }
}

accordiA=\chordmode{
  \repeat volta 2 {
    \set chordChanges = ##t
    \time #'(3 2 2) 7/8
    f4. f2| c4. c2|
    \time #'(2 2 3 2 2) 11/8
    c2 c4. f2:|
    \time #'(3 2 2) 7/8
    f4. f2| c4. c2|
    \time #'(2 2 3 2 2) 11/8
    c2 c4. g2|
  }
}

accordiAfusion=\chordmode{
  \repeat volta 2 {
    \set chordChanges = ##t
    \time #'(3 2 2) 7/8
    f4.:6 fis2:dim7| c4./g a2:m7|
    \time #'(2 2 3 2 2) 11/8
    c2/g ges4.:7.11+ f2:maj7|
    \time #'(3 2 2) 7/8
    f4.:6 fis2:dim7| c4./g a2:m7|
    \time #'(2 2 3 2 2) 11/8
    a2:m7 aes4.:7.11+ g2:6
  }
}

bassoAfusion={
  \repeat volta 2 {
    \time #'(3 2 2) 7/8
    f,4. fis2| g4. a2|
    \time #'(2 2 3 2 2) 11/8
    g2 ges4. f4 f|\break
    \time #'(3 2 2) 7/8
    f4. fis2| g4. a2|
    \time #'(2 2 3 2 2) 11/8
    a2 aes4. g4 g|\break
  }
}

bassoA={
  \repeat volta 2 {
    \time #'(3 2 2) 7/8
    f4 a8 f4 c| c4 e8 c4 g'4|
    \time #'(2 2 3 2 2) 11/8
    c4 e c g8 f4 f|
    \time #'(3 2 2) 7/8
    f4 a8 f4 c| c4 e8 c4 g'4|
    \time #'(2 2 3 2 2) 11/8
    c4 e c e,8 g4 g|
  }
}

temaAdue={
  \repeat volta 2 {
    \time #'(3 2 2) 7/8
    c8 e, a c16 d c8 bes a| bes e, g bes16 c bes8 a g |
    \time #'(2 2 3 2 2) 11/8
    f g e c e f g a4 a|
    \time #'(3 2 2) 7/8
    c8 e, a c16 d c8 bes a| bes e, g bes16 c bes8 a g |
    \time #'(2 2 3 2 2) 11/8
    f g e c e f a g4 g|
  }
}
% }}}

% {{{ PARTE B
temaB={
  \repeat volta 2 {
    \time #'(3 2 2) 7/8
    d,8 e c e16 f e8 d c| e f c g'16 a g8 f e |
    \time #'(2 2 3 2 2) 11/8
    d e c a c d e f4 f|\break
    \time #'(3 2 2) 7/8
    d8 e c e16 f e8 d c| e f c g'16 a g8 f e |
    \time #'(2 2 3 2 2) 11/8
    d e c a c d e d4 d|\break
  }
}

temaBdue={
  \repeat volta 2 {
    \time #'(3 2 2) 7/8
    f8 g e g16 a g8 f e| g a e c'16 d c8 a g |
    \time #'(2 2 3 2 2) 11/8
    e g e c e f g a4 a|\break
    \time #'(3 2 2) 7/8
    f8 g e g16 a g8 f e| g a e c'16 d c8 a g |
    \time #'(2 2 3 2 2) 11/8
    f g e c e f g g4 g|\break
  }
}

accordiB=\chordmode{
  \set chordChanges = ##t
  \repeat volta 2 {
    \time #'(3 2 2) 7/8
    c4. c2| c4. c2|
    \time #'(2 2 3 2 2) 11/8
    c2 c4. f4 f|
    \time #'(3 2 2) 7/8
    c4. c2| c4. c2|
    \time #'(2 2 3 2 2) 11/8
    c2 c4. g4 g4|
  }
}

accordiBfusion=\chordmode{
  \set chordChanges = ##t
  \repeat volta 2 {
    \time #'(3 2 2) 7/8
    c4.:6 b2:7.5-| bes4. a2:m7|
    \time #'(2 2 3 2 2) 11/8
    c2/g ges4.:7.11+ f2:maj7|
    \time #'(3 2 2) 7/8
    c4.:6 b2:7.5-| bes4. a2:m7|
    \time #'(2 2 3 2 2) 11/8
    a2:m7 aes4.:7.11+ g2:6
  }
}

bassoBfusion={
  \repeat volta 2 {
    \time #'(3 2 2) 7/8
    c4. b2| bes4. a2|
    \time #'(2 2 3 2 2) 11/8
    g2 ges4. f4 f|\break
    \time #'(3 2 2) 7/8
    c'4. b2| bes4. a2|
    \time #'(2 2 3 2 2) 11/8
    a2 aes4. g4 g|\break
  }
}

bassoB={
  \repeat volta 2 {
    \time #'(3 2 2) 7/8
    c4. c2| c4. c2|
    \time #'(2 2 3 2 2) 11/8
    c2 g4. f4 a|
    \time #'(3 2 2) 7/8
    c4. c2| c4. c2|
    \time #'(2 2 3 2 2) 11/8
    c2 a4. g4 b|
  }
}

trombaBintro={
  \repeat volta 2 {
    R1*2*7/8|
    \time #'(2 2 3 2 2) 11/8
    R1*11/8|
    \time #'(3 2 2) 7/8
    R1*2*7/8|
    \time #'(2 2 3 2 2) 11/8
    r2 r4. g'4\f g\f\break
  }
}

clarinoBintro={
  \repeat volta 2 {
    R1*2*7/8|
    \time #'(2 2 3 2 2) 11/8
    R1*11/8|
    \time #'(3 2 2) 7/8
    R1*2*7/8|
    \time #'(2 2 3 2 2) 11/8
    r2 r4. d4\f d\f\break
  }
}

fisaBintro={
  \repeat volta 2 {
    \time #'(3 2 2) 7/8
    c4. b2| bes4. a2|
    \time #'(2 2 3 2 2) 11/8
    g2 ges4. f4 f|
    \time #'(3 2 2) 7/8
    c'4. b2| bes4. a2|
    \time #'(2 2 3 2 2) 11/8
    a2 aes4. g4\f g\f|
  }
}

% }}}

% PARTE C {{{
temaC={
  \time #'(3 2 2) 7/8
  fis' 8 ees c d16 ees d c d4 | fis 8 ees c d16 ees ees d d4 |
  \time #'(2 2 3 2 2) 11/8
  d8 ees fis g a bes g a16 bes a g a4|\break
  \time #'(3 2 2) 7/8
  fis 8 ees c d16 ees d c d4 | fis 8 ees c d16 ees ees d d4 |
  \time #'(2 2 3 2 2) 11/8
  g8 fis ees d c ees c d4 d|\break
}

temaCdue={
  \time #'(3 2 2) 7/8
  a8 fis ees fis g fis4| fis8 a ees fis g fis4|
  \time #'(2 2 3 2 2) 11/8
  fis8 g a bes c d bes c16 d c bes a4|
  \time #'(3 2 2) 7/8
  a8 fis ees fis g fis4| fis8 a ees fis g fis4|
  \time #'(2 2 3 2 2) 11/8
  bes8 a g fis ees g ees fis4 fis|
}

accordiC=\chordmode{
  \set chordChanges = ##t
  \time #'(3 2 2) 7/8
  d4. d2| d4. d2|
  \time #'(2 2 3 2 2) 11/8
  d2 ees4. d2|
  \time #'(3 2 2) 7/8
  d4. d2| d4. d2|
  \time #'(2 2 3 2 2) 11/8
  d2 ees4. d2|
}

bassoC={
  \time #'(3 2 2) 7/8
  d4. a4 d4|d4. fis4 d4|
  \time #'(2 2 3 2 2) 11/8
  d2 ees4. d4 fis|\break
  \time #'(3 2 2) 7/8
  d4. a4 d4|d4. fis4 d4|
  \time #'(2 2 3 2 2) 11/8
  d4 d ees g8 d4 d|\break
}

bassoCcinque={
  \time #'(3 2 2) 7/8
  d4.-.  r4 d4-. | r4. d4-. r4|
  \time #'(2 2 3 2 2) 11/8
  r8 d8-. r4 r4 d8-. r4 r4|\break
  \time #'(3 2 2) 7/8
  d4.-.  r4 d4-. | r4. d4-. r4|
  \time #'(2 2 3 2 2) 11/8
  r8 d8-. r4 r4 ees8 d4 d|\break
}

accordionCcinque=\chordmode{
  \time #'(3 2 2) 7/8
  d4. r4 d4 | r4. d4 r4|
  \time #'(2 2 3 2 2) 11/8
  r8 d4. r4 d4. r4|
  \time #'(3 2 2) 7/8
  d4. r4 d4 | r4. d4 r4|
  \time #'(2 2 3 2 2) 11/8
  r8 d4. ees4 ees8 d4 d|
}

trombaC={
  \time #'(3 2 2) 7/8
  fis4.-. fis4-. fis4-.| fis4.-. fis4-. fis4-. |
  \time #'(2 2 3 2 2) 11/8
  fis2 g4. fis4-. fis4-.|
  \time #'(3 2 2) 7/8
  fis4.-. fis4-. fis4-.| fis4.-. fis4-. fis4-. |
  \time #'(2 2 3 2 2) 11/8
  fis4 fis4 g bes8 fis4-. fis-.
}

trombaCcinqueLungo={
  \time #'(3 2 2) 7/8
  a4.~\p\< a2~ | a4.~ a2~ |
  \time #'(2 2 3 2 2) 11/8
  a8~ a8-.\f r4 bes8-.\f r4 r2|
  \time #'(3 2 2) 7/8
  a4.~\p\< a2~ | a4.~ a2~ |
  \time #'(2 2 3 2 2) 11/8
  a8~ a8-.\f r4 bes8 r bes a4 r4|
}

trombaCcinque={
  \time #'(3 2 2) 7/8
  a8-. r4 r4 a4-. | r4. a8-. r8 r4|
  \time #'(2 2 3 2 2) 11/8
  r8 a8-. r4 r4 a8-. r4 r4|
  \time #'(3 2 2) 7/8
  a8-. r4 r4 a4-. | r4. a8-. r8 r4|
  \time #'(2 2 3 2 2) 11/8
  r8 a8-. r4 r4 bes8 a4 r4 |
}

clarinoC={
  \time #'(3 2 2) 7/8
  d4.-. d4-. d4-.| d4.-. d4-. d4-. |
  \time #'(2 2 3 2 2) 11/8
  d2 ees4. d4-. d4-.|
  \time #'(3 2 2) 7/8
  d4.-. d4-. d4-.| d4.-. d4-. d4-. |
  \time #'(2 2 3 2 2) 11/8
  d4 d4 ees g8 d4-. d-.|
}

clarinoCcinqueLungo={
  \time #'(3 2 2) 7/8
  d4.~\p\< d2~ | d4.~ d2~ |
  \time #'(2 2 3 2 2) 11/8
  d8~ d8-.\f r4 ees8-.\f r4 r2|
  \time #'(3 2 2) 7/8
  d4.~\p\< d2~ | d4.~ d2~ |
  \time #'(2 2 3 2 2) 11/8
  d8~ d8-.\f r4 ees8 r ees d4 r4|
}

clarinoCcinque={
  \time #'(3 2 2) 7/8
  d8-. r4 r4 d4-. | r4. d8-. r8 r4|
  \time #'(2 2 3 2 2) 11/8
  r8 d8-. r4 r4 d8-. r4 r4|
  \time #'(3 2 2) 7/8
  d8-. r4 r4 d4-. | r4. d8-. r8 r4|
  \time #'(2 2 3 2 2) 11/8
  r8 d8-. r4 r4 ees8 d4 r4|
}
% }}}

% PARTE D {{{

temaD={
  \repeat volta 2 {
    \time #'(3 2 2) 7/8
    c,8 d c c bes a g| bes c bes a g fis g|
    \time #'(2 2 3 2 2) 11/8
    a bes \tuplet 3/2 {a16 bes a} g8 a a g fis g a4|\break
    \time #'(3 2 2) 7/8
    c8 d c c bes a g| bes c bes a g fis g|
    \time #'(2 2 3 2 2) 11/8
    a8 a g fis g fis ees  d4 d|\break
  }
}

temaDdue={
  \repeat volta 2 {
    \time #'(3 2 2) 7/8
    ees'8 f ees ees d c bes| d ees d d c bes a|
    \time #'(2 2 3 2 2) 11/8
    c d \tuplet 3/2 {c16 d c} bes8 c c bes a bes c4|
    \time #'(3 2 2) 7/8
    ees8 f ees ees d c bes| d ees d d c bes a|
    \time #'(2 2 3 2 2) 11/8
    c c bes a bes a g fis4 fis|
  }
}

accordiD=\chordmode{
  \set chordChanges = ##t
  \repeat volta 2 {
    \time #'(3 2 2) 7/8
    c4.:m c2:m| g4.:m g2:m|
    \time #'(2 2 3 2 2) 11/8
    d2 c4.:m d2|
    \time #'(3 2 2) 7/8
    c4.:m c2:m| g4.:m g2:m|
    \time #'(2 2 3 2 2) 11/8
    d2 c4.:m d2|
  }
}

bassoD={
  \repeat volta 2 {
    \time #'(3 2 2) 7/8
    c4.~ c4 a | g4.~ g4 b |
    \time #'(2 2 3 2 2) 11/8
    d4 d c4. d2 |\break
    \time #'(3 2 2) 7/8
    c4.~ c4 a | g4.~ g4 b |
    \time #'(2 2 3 2 2) 11/8
    d4 d c4. d2 |\break
  }
}
% }}}

% CODA {{{

temaCoda={
  \time #'(3 2 2) 7/8
  R1*2*7/8|
  \time #'(2 2 3 2 2) 11/8
  R1*11/8|\break
  \time #'(3 2 2) 7/8
  a8 c, f a16 bes a8 g f| g c, e g16 a g8 f e |
  f\mf\< bes, d f16 g f8 e d| e a, cis e16 f e8 d cis\f|\break
  d a d f16 g f8 e d| des aes des f16 g f8 ees des|
  \time #'(2 2 3 2 2) 11/8
  c e c a c d e d4 r|
}

temaCodaDue={
  \time #'(3 2 2) 7/8
  c8 e, a c16 d c8 bes a| bes e, g bes16 c bes8 a g |
  \time #'(2 2 3 2 2) 11/8
  f g e c e f g a4 a|\break
  \time #'(3 2 2) 7/8
  c8 e, a c16 d c8 bes a| bes e, g bes16 c bes8 a g |
  a\mf\< d, e a16 bes a8 g f| g cis, e g16 a g8 f e\f|\break
  d a d f16 g f8 e d| des aes des f16 g f8 ees des|
  \time #'(2 2 3 2 2) 11/8
  e g e c e f a g4 r|
}

accordiCoda=\chordmode{
  \set chordChanges = ##t
  \time #'(3 2 2) 7/8
  f4. f2| c4. c2|
  \time #'(2 2 3 2 2) 11/8
  c2 c4. f2:|
  \time #'(3 2 2) 7/8
  f4.~ f2 | c4.~ c2 |
  bes4.~ bes2 | a4.~ a2|
  d4.:m d2:m | des4. des2 |
  \time #'(2 2 3 2 2) 11/8
  c2 aes4.:7.13+ g4 s4 |
}

bassoCoda={
  \time #'(3 2 2) 7/8
  f4 a8 f4 c| c4 e8 c4 g'4|
  \time #'(2 2 3 2 2) 11/8
  c4 e c g8 f4 f|\break
  \time #'(3 2 2) 7/8
  f4.~ f2 | c4.~ c2 |
  bes4. f'4 d8 bes | a4. e'4 cis8 a|
  d4 f8 d4 a4| des4 f8 des4 aes4|
  \time #'(2 2 3 2 2) 11/8
  c4 g4 aes8 c aes g4-. r4|
}

trombaCoda={
  \time #'(3 2 2) 7/8
  R1*7/8|R1*7/8|
  \time #'(2 2 3 2 2) 11/8
  R1*11/8|
  \time #'(3 2 2) 7/8
  R1*7/8|R1*7/8|
  r4 f8\p\< a4 f8 bes | e,4.~ e8 f16 g a8 g16 e\f|
  f4. a4 g8 e | f4.~ f8 des16 ees f8 ees16 des |
  \time #'(2 2 3 2 2) 11/8
  c8 e c a c d e d4 r|
}

guitCoda={
  \time #'(3 2 2) 7/8
  a8 c, f a16 bes a8 g f| g c, e g16 a g8 f e |
  \time #'(2 2 3 2 2) 11/8
  d e c a c d e f4 f|
  \time #'(3 2 2) 7/8
  R1*2*7/8|
  R1*2*7/8|
  R1*2*7/8|
  \time #'(2 2 3 2 2) 11/8
  R1*11/8|
}

pausaCoda={
  \time #'(3 2 2) 7/8
  R1*2*7/8|
  \time #'(2 2 3 2 2) 11/8
  R1*11/8|
  \time #'(3 2 2) 7/8
  R1*2*7/8|
  R1*2*7/8|
  R1*2*7/8|
  \time #'(2 2 3 2 2) 11/8
  R1*11/8|
}
% }}}

% MAIN {{{

pausa = {
  \time #'(3 2 2) 7/8
  R1*2*7/8|
  \time #'(2 2 3 2 2) 11/8
  R1*11/8|
  \time #'(3 2 2) 7/8
  R1*2*7/8|
  \time #'(2 2 3 2 2) 11/8
  R1*11/8|\break
}

clarinet = \relative c'' {
  %\transposition bes
  \global
  \mark \markup{ \box \bold{A1} }
  \pausa
  \mark \markup{ \box \bold{B1} }
  \clarinoBintro
  \mark \markup{ \box \bold{C1} }
  \clarinoCcinqueLungo
  \clarinoCcinque
  \temaCdue
  \mark \markup{ \box \bold{A2} }
  \temaA
  \mark \markup{ \box \bold{B2} }
  \relative c'''{\temaB}
  \mark \markup{ \box \bold{C2} }
  \pausa
  \relative c''{\temaCdue}
  \mark \markup{ \box \bold{D} }
  \relative c'''{\temaD}
  \mark \markup{Coda}
  \relative c''{\temaCoda}
}

trumpetBb = \relative c'' {
  %\transposition bes
  \global
  \pausa
  \trombaBintro
  \trombaCcinqueLungo
  \trombaCcinque
  \relative c'{\temaC}
  \relative c'{\temaAdue}
  \temaBdue
  \pausa
  \relative c'{\temaC}
  \relative c' {\temaDdue}
  \trombaCoda
}

accordion = \relative c'' {
  \global
  \temaAdue
  \temaBdue
  \accordionCcinque
  \temaC
  \temaCdue
  \relative c''{\temaAdue}
  \relative c'' {\temaB}
  \temaCdue
  \temaC
  \relative c {\temaDdue}
  \temaCodaDue
}

guitar = \relative c'' {
  \global
  \temaA
  \temaB
  \temaC
  \break
  \temaCdue
  \pausa
  \accordiA
  \accordiB
  \temaC
  \pausa
  \accordiD
  \guitCoda
}

contrabass = \relative c {
  \global
  \bassoAfusion
  \bassoBfusion
  \bassoCcinque
  \bassoCcinque
  \bassoC
  \bassoA
  \bassoB
  \bassoC
  \bassoC
  \bassoD
  \bassoCoda
}

chordsPart ={
  \new ChordNames {
  \mark \markup{ \box \bold{A1} }
    \accordiAfusion
  \mark \markup{ \box \bold{B1} }
    \accordiBfusion
  \mark \markup{ \box \bold{C1} }
    \accordiC
    \accordiC
    \accordiC
  \mark \markup{ \box \bold{A2} }
    \accordiA
  \mark \markup{ \box \bold{B2} }
    \accordiB
  \mark \markup{ \box \bold{C2} }
    \accordiC
    \accordiC
  \mark \markup{ \box \bold{D} }
    \accordiD
  \mark \markup{Coda}
    \accordiCoda
  }
}

accordionPart = \new Staff \with { } \accordion

clarinetPart = \new Staff \with { } \clarinet

trumpetPart =  \new Staff \with { } \trumpetBb

guitarPart = \new Staff \with { } { \clef "treble_8" \guitar }

contrabassPart = \new Staff \with { } { \clef bass \contrabass }
%}}}

% {{{ BOOKS
\book{
  \bookOutputSuffix "Score"
  \score {
    <<
      \chordsPart
      \clarinetPart
      \trumpetPart
      \accordionPart
      \guitarPart
      \contrabassPart
    >>
    \layout {
    }
  }
}

% \book{
%   \bookOutputSuffix "ClTr"
%   \struttura
%   \score {
%     <<
%       \transpose c d { \chordsPart }
%       \transpose c d { \clarinetPart}
%       \transpose c d { \trumpetPart}
%     >>
%   }
% }

% \book{
%   \bookOutputSuffix "Basso"
%   \struttura
%   \score {
%     <<
%       \chordsPart
%       \accordionPart
%       \contrabassPart
%     >>
%   }
% }

% \book{
%   \bookOutputSuffix "GuitAcc"
%   \struttura
%   \score {
%     <<
%       \chordsPart
%       \clarinetPart
%       \accordionPart
%       \guitarPart
%     >>
%   }
% }

% }}}
