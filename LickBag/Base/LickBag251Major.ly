% {{{ PARAMETRI
  \version "2.18.2"
  myTitle = "Lick Bag - Major 251"
  myTempo =  #(ly:make-moment 190 4)
  \include "./LickBagHeader.ly"
% }}}

% {{{ LICK B
  lickB = \LickScore
    \time 4/4
    \key a \major
    {
      \partial 4. d''8 e f |
      fis c cis e d b gis e | d b gis f e es d ees16 d | cis4 r4 r2 |
    }
    \chordmode{
      \partial 4. s4. |
      e1:7 | e1:7 | a1 | 
    }
    #"Bireli"
    #"After You Have Gone"
% }}}

% {{{ LICK C
  lickC = \LickScore
    \time 4/4
    \key g \major
    {
      r2 r8 c8 ees fis | bes c ees fis \ottava #1 a c ees fis | b2 r2 |
    }
    \chordmode{
      d1:7 | d1:7 | g1 |
    }
    #"Bireli"
    #"After You Have Gone"
% }}}

% {{{ LICK D
  lickD = \LickScore
    \time 4/4
    \key c \major
    {
      r2 a''8 ais cis b | gis f cis b g f d c | b4 r4 r2 |
    }
    \chordmode{
      g1:7 | g1:7 | c1 | 
    }
    #"Bireli"
    #"After You Have Gone"
% }}}

% {{{ LICK E
  lickE = \LickScore
    \time 4/4
    \key g \major
    {
      \partial 4. d'8 des c |
      b c e g ais b d4 | fis,8 d bes fis d b c e | g4 r4 r2 | 
    }
    \chordmode{
      \partial 4. s4. |
      a1:m7 | d1:7 | g1 | 
    }
    #"Bireli"
    #"After You Have Gone"
% }}}

% {{{ LICK F
  % lickF = \LickScore
  %   \time 4/4
  %   \key d \major
  %   {
  %     cis''8 r b cis b32 c b16 g8 e d | cis a g dis bes4 r |
  %   }
  %   \chordmode{
  %     e1:m7 | a1:7 |
  %   }
  %   #"Io"
  %   #"Coquette"
% }}}

% {{{ LICK G
  lickG = \LickScore
    \time 4/4
    \key d \major
    {
      \partial 8 dis8 |
      \tuplet 3/2 {e g b} d8 e cis a fis dis |
      e g bes cis e g bes gis | a2 r2 |
    }
    \chordmode{
      \partial 8 s8 |
      e1:m7 | a1:7 | d1:maj7 |
    }
    #"Io"
    #"Coquette"
% }}}

% {{{ LICK H
  lickH = \LickScore
    \time 4/4
    \key c \major
    {
      r8 d' f a e' d c a | aes des, f aes g e bes aes | g1 |
    }
    \chordmode{
      d1:m7 | g1:7 | c1:maj7 |
    }
    #"Io"
    #"Esercizio"
% }}}

% {{{ LICK I
  lickI = \LickScore
    \time 4/4
    \key c \major
    {
      \trip b8 c d \trip e f g \trip a c b \trip d f g |
      aes8 g b g bes aes g f |
      \appoggiatura <g d>8 <g e>4 d8 c 
      \appoggiatura <a d>8 <b d>4 a8 g | 
      \appoggiatura <g d>8 <g e>4 d8 c 
      \appoggiatura <a d>8 <b d>4 a8 g | 
    }
    \chordmode{
      d1:m7 | g1:7 | c1:maj7 | c1:maj7 |
    }
    #"Mike Stern"
    #"Autumn Leaves"
% }}}

% {{{ LICK J
  lickJ = \LickScore
    \time 4/4
    \key c \major
    {
      r8 e8 f g a c a b | c d e a g e c g' | e1 |
    }
    \chordmode{
      d1:m7 | g1:7 | c1:maj7 |
    }
    #"Unknown"
    #"Blue Bossa"
% }}}

% {{{ LICK K
  lickK = \LickScore
    \time 4/4
    \key c \major
    {
      r4 \trip e8 f g \trip a b c \trip d e f |
      \trip g a g \trip f e d \trip c b a \trip g ges f |
      e1 |
    }
    \chordmode{
      d1:m7 | g1:7 | c1:maj7 |
    }
    #"Unknown"
    #"Blue Bossa"
% }}}

% {{{ LICK L
  lickL = \LickScore
    \time 4/4
    \key c \major
    {
      a''4 a8 a~ a4 g8 f | e4 d8 aes'~ aes d, f aes |
      g f e g e4 d8 c | b4 a8 g~ g2 |
    }
    \chordmode{
      d1:m7 | g1:7 | c1:maj7 | c1:maj7 |
    }
    #"Mike Stern"
    #"Autumn Leaves"
% }}}

% {{{ LICK M
  lickM = \LickScore
    \time 4/4
    \key c \major
    {
      b''4 \trip bes8 a aes g8 e b g | e1 |
    }
    \chordmode{
      g1:7 | c1:maj7 |
    }
    #"Unknown"
    #"Unknown"
% }}}

% {{{ LICK N
  lickN = \LickScore
    \time 4/4
    \key c \major
    {
      \partial 8 c'8 |
      e8 g e f a c e a, | c e c a c a c a | 
      b d b g b g b g | e1 |
    }
    \chordmode{
      \partial 8 s8 |
      d1:m7 | g1:7 | c1:maj7 | c1:maj7 |
    }
    #"Bill Evans"
    #"Autumn Leaves"
% }}}

% {{{ LICK O
  lickO = \LickScore
    \time 4/4
    \key c \major
    {
      \partial 4. cis'8 f a |
      c a c a~ a2 | r2 \trip a8 ais b c b~ |
      b g b g~ g2 |
    }
    \chordmode{
      \partial 4. s4. |
      d1:m7 | g1:7 | c1:maj7 | 
    }
    #"Bill Evans"
    #"Autumn Leaves"
% }}}

% {{{ LICK P
  lickP = \LickScore
    \time 4/4
    \key c \major
    {
      r8 c'' \trip a e c b' e, a b |
      g f e g~ g4 \trip e8 c a | b1 |
    }
    \chordmode{
      d1:m7 | g1:7 | c1:maj7 | 
    }
    #"Bill Evans"
    #"Autumn Leaves"
% }}}

% {{{ LICK Q
  lickQ = \LickScore
    \time 4/4
    \key c \major
    {
      r2 r8 \trip a'' e c c' | b bes a aes g ges f r |
      r e c a d b g f | e d' c b c b a c, |
    }
    \chordmode{
      d1:m7 | g1:7 | c1:maj7 | c1:maj7 |
    }
    #"Bill Evans"
    #"Autumn Leaves"
% }}}

% {{{ LICK R
  lickR = \LickScore
    \time 4/4
    \key c \major
    {
      d8\1 e f g a b c e | e f g ges16 f e8 c a f |
      e2. d'8\1 b | c a~ a2 r4 |
    }
    \chordmode{
      d1:m7 | g1:7 | c1:maj7 | c1:maj7 |
    }
    #"Bill Evans"
    #"Autumn Leaves"
% }}}

% {{{ LICK S
  lickS = \LickScore
    \time 4/4
    \key c \major
    {
      \partial 8 b'8 |
      a4~ a8 e'16 c aes4~ aes8 e' | c4~ c8 a b a f d |
      e4 f8 g~ g4 r8 d' | e4 f8 g~ g4 r |
    }
    \chordmode{
      \partial 8 s8 |
      d1:m7 | g1:7 | c1:maj7 | c1:maj7 |
    }
    #"Bill Evans"
    #"Autumn Leaves"
% }}}

% {{{ LICK T
  lickT = \LickScore
    \time 4/4
    \key c \major
    {
      d'8 g e c a r d g | e c a r d4 d |
      r2 d8 g e c | a d b g e a f d |
    }
    \chordmode{
      d1:m7 | g1:7 | c1:maj7 | c1:maj7 |
    }
    #"Bill Evans"
    #"Autumn Leaves"
% }}}

% {{{ LICK U
  lickU = \LickScore
    \time 4/4
    \key c \major
    {
      b'8 r g' r f r g e~ | e4 r8 c a f e d | g4 g8 g e4 g8 d~ | d1 |
    }
    \chordmode{
      d1:m7 | g1:7 | c1:maj7 | c1:maj7 |
    }
    #"Bill Evans"
    #"Autumn Leaves"
% }}}

% {{{ LICK V
  lickV = \LickScore
    \time 4/4
    \key c \major
    {
      \partial 4. d'8 r b |
      e, g c d fis4 a | g fis8 e~ e4 r | 
      r8 a,8 d a' des,4 a' | b, c8 cis r a~ a4 |
    }
    \chordmode{
      \partial 4. s4. |
      d1:m7 | g1:7 | c1:maj7 | c1:maj7 |
    }
    #"Unknown"
    #"Wave"
% }}}

% {{{ LICK W
  lickW = \LickScore
    \time 4/4
    \key c \major
    {
      b''4 g8 a f16 e d8~ d16 g8 e16 |
      c a aes8~ aes e' \trip ees c bes \trip a g f | e1 |
    }
    \chordmode{
      d1:m7 | g1:7 | c1:maj7 |
    }
    #"Unknown"
    #"Wave"
% }}}

% {{{ LICK X
  lickX = \LickScore
    \time 4/4
    \key c \major
    {
      r8 f8 a f b g e c' | a f d' b g dis' b g | e'1 |
    }
    \chordmode{
      d1:m7 | g1:7 | c1:maj7 |
    }
    #"Unknown"
    #"Unknown"
% }}}

% {{{ LICK Y
  lickY = \LickScore
    \time 4/4
    \key c \major
    {
      e'8 g f a, c8. e16~ e8 d | 
      \trip ees16 g ees b8 \trip bes16 b bes aes8 g f c d | e1 |
    }
    \chordmode{
      d1:m7 | g1:7 | c1:maj7 |
    }
    #"Unknown"
    #"Unknown"
% }}}

% {{{ LICK Z
  lickZ = \LickScore
    \time 4/4
    \key c \major
    {
      \partial 2 f8\1 e d e | cis d f a cis e d cis |
      f, e\1 r d\1 r c'\2 b\1 a | g f e g d c b a | g1 |
    }
    \chordmode{
      \partial 2 s2
      d1:m7 | g1:7 | c1:maj7 | c1:maj7 |
    }
    #"Jim Hall"
    #"Tangerine"
% }}}

% {{{ LICK AA
  lickAA = \LickScore
    \time 4/4
    \key c \major
    { 
      c'4 c b c8 a~ | a a~ a2 r4 | b4 b8 b r g e r | a a r4 r2 |
    }
    \chordmode{
      d1:m7 | g1:7 | c1:maj7 | c1:maj7 |
    }						
    #"Jim Hall"
    #"Tangerine"
% }}}

% {{{ LICK AB
  lickAB = \LickScore
    \time 4/4
    \key c \major
    { 
      \partial 2 d8 f a r |
      c r f, r a r d f | r4 r8 fis8 r4 r8 a | 
      g e r f r d r e | r c r d r2 |
    }
    \chordmode{
      \partial 2 s2 |
      d1:m7 | g1:7 | c1:maj7 | c1:maj7 |
    }						
    #"Jim Hall"
    #"Tangerine"
% }}}

% {{{ LICK AC
  lickAC = \LickScore
    \time 4/4
    \key c \major
    { 
      \partial 4. e8 r e | 
      f f cis cis d d e e | f f g g a a ais ais | 
      b e d r a r r a |
    }
    \chordmode{
      \partial 4. s4. |
      d1:m7 | g1:7 | c1:maj7 | 
    }						
    #"Jim Hall"
    #"Tangerine"
% }}}

% {{{ LICK AD
  lickAD = \LickScore
    \time 4/4
    \key c \major
    { 
      r4 r8 c' dis e f dis | e c g f e g dis e | g1 |
    }
    \chordmode{
      d1:m7 | g1:7 | c1:maj7 | 
    }						
    #"Jim Hall"
    #"Tangerine"
% }}}

% {{{ LICK AE
  lickAE = \LickScore
    \time 4/4
    \key c \major
    { 
      r2 e'4 c | a2 e'4 a | e c a8 e' a, r | c2 a4 f8 e |
    }
    \chordmode{
      d1:m7 | g1:7 | c1:maj7 | c1:maj7 |
    }						
    #"Jim Hall"
    #"Tangerine"
% }}}

% {{{ LICK AF
  lickAF = \LickScore
    \time 4/4
    \key a \major
    { 
      r8 gis8 b d fis a b d | fis gis b d cis b ais cis | a4 r4 r2 |
    }
    \chordmode{
      b1:m7 | e1:7 | a1 |
    }						
    #"Bireli"
    #"After You Have Gone"
% }}}

% {{{ LICK AG
  lickAG = \LickScore
    \time 4/4
    \key g \major
    { 
      c8 ees fis bes c ees fis a16 ais | b4 r4 r2 |
    }
    \chordmode{
      d1:7 | g1 |
    }						
    #"Io"
    #"Esercizio"
% }}}

% {{{ LICK AH
  lickAH = \LickScore
    \time 4/4
    \key g \major
    { 
      a8\4 b c d e g e f | fis a c e d b g d' | b1 |
    }
    \chordmode{
      a1:m7 | d1:7 | g1 |
    }						
    #"Libro Manouche"
    #""
% }}}

% {{{ LICK AI
  lickAI = \LickScore
    \time 4/4
    \key g \major
    { 
      b8\1 c\2 e\1 a\4 c e g a | \trip c d c a g e c \trip g' a g |
      fis e b4 r2 |

    }
    \chordmode{
      a1:m7 | d1:7 | g1 |
    }						
    #"Libro Manouche"
    #""
% }}}

% {{{ LICK AJ
  lickAJ = \LickScore
    \time 4/4
    \key g \major
    { 
      e8 a b c e g e f | fis a c ees d c a fis |
      d b a fis g b d fis | g b d fis e2 |

    }
    \chordmode{
      a1:m7 | d1:7 | g1 | g1 |
    }						
    #"Libro Manouche"
    #""
% }}}

% {{{ LICK AK
  lickAK = \LickScore
    \time 4/4
    \key d \major
    { 
      \partial 8 a8 
      cis e g bes cis e g f | e d c b a g f e | d1 |
    }
    \chordmode{
      \partial 8 s8 
      a1:7 | a1:7 | d1 | 
    }						
    #"Libro Manouche"
    #""
% }}}

% {{{ LICK AL
  lickAL = \LickScore
    \time 4/4
    \key g \major
    { 
      \trip a''8 b a fis e c a aes g | fis e'~ e4 r2 |
    }
    \chordmode{
      d1:7 | g1 | 
    }						
    #"Libro Manouche"
    #""
% }}}

% {{{ LICK AM
  lickAM = \LickScore
    \time 4/4
    \key g \major
    { 
      r2 fis'8 a ees fis | c ees a, c \trip fis, a c ees fis | d1 |
    }
    \chordmode{
      d1:7 | d1:7 | g1 | 
    }						
    #"Libro Manouche"
    #""
% }}}

% {{{ LICK AN
  lickAN = \LickScore
    \time 4/4
    \key f \major
    { 
      g'8 bes d f g bes d des | c bes g e c bes g ges |
      f1 |
    }
    \chordmode{
      g1:m7 | c1:7 | f1 | 
    }						
    #"Libro Manouche"
    #""
% }}}

% {{{ BOOKS
\includeLocal "ScoreCompleto251Major.ly"
% }}}
