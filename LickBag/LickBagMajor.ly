% {{{ PARAMETRI
  myTitle = "Lick Bag - Major"
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
    \key g \major
    r2 r8 a8 fis g | b d fis g b d e f | fis4 r4 r2 |
  }
  

  accordiA = \new ChordNames{ 
    \chordmode{
      g1 | g1 | e1:7 | \bar "|."
    }
  }

  lickA = \score {
    \header{ piece="1. Bireli, After You Have Gone"}
    << 
        \relative c'' {\temaA}
        \accordiA
    >>    
  }
% }}}

% {{{ LICK B
  temaB = {
    \time 4/4
    \key c \major
    \partial 8 c8 |
    b8 c e g b c e g | b16 a b8~ b a a4 r4 | 
  }
  

  accordiB = \new ChordNames{ 
    \chordmode{
      \partial 8 s8 |
      c1 | c1 | \bar "|."
    }
  }

  lickB = \score {
    \header{ piece="2. Bireli, After You Have Gone"}
    << 
        \relative c' {\temaB}
        \accordiB
    >>    
  }
% }}}

% {{{ LICK C
  temaC = {
    \time 4/4
    \key bes \major
    r4 r16 a'16 r16 g f8 a16 c,16~ c16 f a,8 | c16 f,8 a16 d,8 r8 r2|
  }
  

  accordiC = \new ChordNames{ 
    \chordmode{
      bes1:maj7 | bes1:maj7 | \bar "|."
    }
  }

  lickC = \score {
    \header{ piece="3. Bireli, 500 miles high"}
    << 
        \relative c'' {\temaC}
        \accordiC
    >>    
  }
% }}}

% {{{ BOOKS
  \book{
    \bookOutputSuffix "C"    
    \lickA
    \lickB
    \lickC
  }
% }}}
