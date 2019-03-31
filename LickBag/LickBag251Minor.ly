% {{{ PARAMETRI
  myTitle = "Lick Bag - Minor 251"
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
  myStaffSize = #20
  fonts = #(make-pango-font-tree
  "FontAwesome"
  "FontAwesome"
  "FontAwesome"
  (/ myStaffSize 20))  
  
  scoreTitleMarkup = \markup { 
    \column {
      \fill-line {
        \fontsize #2.5 \italic \fromproperty #'header:piece
        \fromproperty #'header:opus
      }
    }
  }
  
    markup-system-spacing =
    #'((basic-distance . 2)
       (padding . 2))
    
    score-markup-spacing =
    #'((basic-distance . 0)
       (padding . 4))
}

global = {
  \numericTimeSignature
  \set Score.markFormatter = #format-mark-box-alphabet
}
\layout { 
  \override Score.RehearsalMark.self-alignment-X = #LEFT
  \set chordChanges = ##t
  indent = #0
  \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = #2

}
%}}}

% {{{ LICK A
  temaA = {
    \time 4/4
    \key f \major
    r2 \tuplet 3/2 {c8 d e} \tuplet 3/2 {f g a} |
    \tuplet 3/2 {f g a} \tuplet 3/2 {bes c d} \tuplet 3/2 {e f g} a8 r8 |
    c4 bes8 a g f e a | f4 d a f |
  }
  

  accordiA = \new ChordNames{ 
    \chordmode{
      e1:m7.5- | a1:7 | d1:m7 | d1:m7 \bar "|."
    }
  }

  lickA = \score {
    \header{ piece="1. Mike Stern, Autumn Leaves"}
    << 
        \relative c' {\temaA}
        \accordiA
    >>    
  }
% }}}

% {{{ LICK B
  temaB = {
    \time 4/4
    \key c \major
    r8. f16\1 e'8\4 \glissando d16\4 a16~\1 a16 f8\2 g16~\3 g16 f8\2 aes16\4 \glissando  | 
    g16 f e d c aes g e\4 f\3 d e f a c e a,\3 \glissando |
    b d\1 c\4 e,\1 r4 r2 |
  }
  

  accordiB = \new ChordNames{ 
    \chordmode{
      b1:m7.5- | e1:7 | a1:m7 | \bar "|."
    }
  }

  lickB = \score {
    \header{ piece="2. Bireli, 500 miles high"}
    << 
        \relative c'' {\temaB}
        \accordiB
    >>    
  }
% }}}

% {{{ LICK C
  temaC = {
    \time 4/4
    \key c \major
    \partial 8 g8
    gis b d f \tuplet 3/2 {gis8 b d} \tuplet 3/2 {e f gis} | \tuplet 3/2 {f e d} c8 b a g f d |
    e8 c b a gis4 r4 |
  }
  

  accordiC = \new ChordNames{ 
    \chordmode{
      \partial 8 r8 |
      e1:7 | e1:7 | a1:m7 | \bar "|."
    }
  }

  lickC = \score {
    \header{ piece="3. Bireli, After You Have Gone"}
    << 
        \relative c' {\temaC}
        \accordiC
    >>    
  }
% }}}

% {{{ LICK D
  temaD = {
    \time 4/4
    \key g \major
    r8 b e fis g a b c | dis fis g a b c d ees |
    d c b a g4 r4 |
  }
  

  accordiD = \new ChordNames{ 
    \chordmode{
      fis1:m7.5- | b1:7 | e1:m7 | \bar "|."
    }
  }

  lickD = \score {
    \header{ piece="4. Bireli, After You Have Gone"}
    << 
        \relative c' {\temaD}
        \accordiD
    >>    
  }
% }}}

% {{{ LICK E
  temaE = {
    \time 4/4
    \key ees \major
    \partial 4 bes8 a | 
    aes ees' r g, r f r ees | d c r b~ b g fis g | d'4~ d8 c b c ees4~ | ees1 |
  }

  accordiE = \new ChordNames{ \chordmode{
    \partial 4 s4 | d1:m7 | g1:7 | c1:maj7 | c1:maj7 |     
  }}

  lickE = \score {
    \header{ piece="5."}
    << 
        \relative c''' {\temaE}
        \accordiE
    >>    
  }
% }}}

% {{{ BOOKS
  \book{
    \bookOutputSuffix "C"    
    \lickA
    \lickB
    \lickC
    \lickD
    \lickE
  }
% }}}
