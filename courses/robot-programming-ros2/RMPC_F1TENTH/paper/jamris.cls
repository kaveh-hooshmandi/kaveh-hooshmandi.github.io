\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{jamris}
              [2019/07/16 v1.0.6a
Non standard LaTeX document class]
% Article class of ``Journal of Automation Mobile Robotics and Intelligent Systems''
% a quarterly focusing on new achievements in the following fields:
% - Fundamentals of automation and robotics,
% - Applied automatics,
% - Mobile robots control,
% - Distributed systems,
% - Navigation,
% - Mechatronic systems in robotics,
% - Sensors and actuators,
% - Data transmission,
% - Biomechatronics,
% and Mobile Computing.
% Publisher: Industrial Research Institute for Automation and Measurements PIAP, Poland

\newif\ifpdfmode\pdfmodefalse
\newif\ifcorrespond\correspondfalse

\ifx\pdfoutput\undefined
 \else
 \ifnum\the\pdfoutput > 0
     \pdfmodetrue
  \fi
\fi
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagefalse
   \setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}%
    \ifpdfmode
        \pdfpagewidth=210mm
        \pdfpageheight=297mm
    \else
	\special{papersize=210mm,297mm}%
   \fi
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}
\def\flushboth{% zrodlo: http://www.tex.ac.uk/cgi-bin/texfaq2html?label=flushboth ; dodane 11.02.13 przez PD; wyjustowanie akapitu do lewej i prawej
  \let\\\@normalcr
  \@rightskip\z@skip \rightskip\@rightskip
  \leftskip\z@skip
  \parindent 1.5em\relax}
\def\nameofgame{Journal of Automation, Mobile Robotics and Intelligent Systems}
\def\dblline{%
             \vrule width \textwidth height 0.3pt\hbox to 0pt{}\vskip -4.6mm
	     \leavevmode\hfill \hbox to 3mm{\vbox to 0mm{\hsize 3mm\hrule width 3mm height 3mm depth 0mm\vss}\hss}\hfill\hbox to 0pt{}%
	     \vskip -1.1mm
             \leavevmode\vrule width \textwidth height 0.3pt\hbox to 0pt{\hss}\par}
\ExecuteOptions{10pt,twocolumn,twoside}
\def\Volnum#1{\gdef\@volnum{#1}}
\def\Received#1{\gdef\@Received{#1}}
\def\Accepted#1{\gdef\@Accepted{#1}}
\def\Num#1{\gdef\@numnum{#1}}
\def\Year#1{\gdef\@Year{#1}}
\def\Title#1{\gdef\@title{#1}}
\def\Keywords#1{\gdef\@keywords{#1}}
\def\FirstPage#1{\gdef\@firstpage{#1}}
\def\DOI#1{\gdef\@DOI{DOI: #1}}
\FirstPage{1}


\Year{0}
\Volnum{0}
\Num{0}
\ProcessOptions
\input{size1\@ptsize.clo}
\textwidth=17.2cm
\hoffset=-1in
\voffset=-1in
\oddsidemargin=1.8cm
\evensidemargin=2.0cm
\textheight=260mm
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{9}
\renewcommand\topfraction{.99}
\setcounter{bottomnumber}{9}
\setcounter{totalnumber}{9}
\renewcommand\bottomfraction{.99}

\renewcommand\textfraction{.01}
\renewcommand\floatpagefraction{.99}
\setcounter{dbltopnumber}{9}
\renewcommand\dbltopfraction{.99}
\renewcommand\dblfloatpagefraction{.99}
\usepackage{hz}
\usepackage{graphicx, color}
\usepackage[hyphens]{url}
\definecolor{navy}{cmyk}{0.98, 0.84, 0, 0.5}
\usepackage{indentfirst}
\usepackage{ifthen}
\usepackage{endnotes}
\usepackage{dblfloatfix, flushend}

\def\themypage{\noindent\colorbox{black}{\vbox to 3mm{\parindent 0pt\hsize =3mm\vss\leavevmode\hbox to 3mm{\hss\footnotesize\color{white}\the\c@page\hss}\vss}}}
  \def\ps@headings{%
      \def\@oddhead{\vbox{\parindent=0pt\hsize=\textwidth\newfontfamily\fontnog{TeX Gyre Pagella}\fontnog\upshape\footnotesize\noindent \nameofgame\hfill VOLUME~\@volnum,~~~~~N${^\circ}$ \@numnum~~~~~\@Year\par\dblline}}%
      \let\@evenhead=\@oddhead
%      \def\@evenfoot{\hbox to -2.5mm{\kern -7.5mm\hbox to 3mm{\themypage\hss}\hss}~~~Articles\hfill}%
      \def\@evenfoot{\hbox to -2.5mm{\kern -6.5mm\hbox to 3mm{\themypage\hss}\hss}\hfill}%
%      \def\@oddfoot{\leavevmode\hfill Articles~~~\hbox to -2.5mm{\hbox to 3mm{\themypage\hss}\hss}}%
      \def\@oddfoot{\leavevmode\hfill \hbox to -1.5mm{\hbox to 3mm{\themypage\hss}\hss}}%	  
      \let\@mkboth\markboth
    \def\sectionmark##1{%
      \markboth {\MakeUppercase{%
        \ifnum \c@secnumdepth >\z@
          \thesection\quad
        \fi
        ##1}}{}}%
    \def\subsectionmark##1{%
      \markright {%
        \ifnum \c@secnumdepth >\@ne
          \thesubsection\quad
        \fi
        ##1}}}
\let\ps@plain=\ps@headings
\newcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\date\relax
  \global\let\and\relax
}
\newcounter{numofauthors}
\newcounter{tmpnumofauthors}
\setcounter{numofauthors}{0}
 \def\@xvipt{16}
\newcommand\xLarge{\@setfontsize\Large\@xvipt{18}}

\def\Author{%
   \@ifstar
     {\xauthor}%
     {\yauthor}%
}
\def\xauthor{%
    \correspondtrue
    \advance\c@numofauthors 1
    \expandafter\def\csname c:\the\c@numofauthors\endcsname{$^*$}%
\@xyauthor}
\def\yauthor{%
    \advance\c@numofauthors 1
    \expandafter\def\csname c:\the\c@numofauthors\endcsname{}%
\@xyauthor}
\def\@xyauthor#1#2#3#4#5#6{%
    \expandafter\xdef\csname n:\the\c@numofauthors\endcsname{#1}%
    \expandafter\xdef\csname e:\the\c@numofauthors\endcsname{#2}%
    \expandafter\xdef\csname w:\the\c@numofauthors\endcsname{#3}%
    \expandafter\xdef\csname i:\the\c@numofauthors\endcsname{#4}%
    \expandafter\xdef\csname t:\the\c@numofauthors\endcsname{#5}%
    \expandafter\xdef\csname a:\the\c@numofauthors\endcsname{#6}%
}

\def\AuthorNote{%

        %end notes
		\ifnum\c@endnote> 0
        \theendnotes 
        \fi

      \ifnum\value{numofauthors} < 1
        \else
	   \vskip 12pt
	   \hrule
	   \vglue 13pt
	  \ifnum\value{numofauthors} > 1
	       \noindent{\bfseries AUTHORS}
	    \else
	       \noindent{\bfseries AUTHOR}
	   \fi
	   \setcounter{tmpnumofauthors}{0}%
	   \whiledo{\value{numofauthors} > \value{tmpnumofauthors}}{%
	       \stepcounter{tmpnumofauthors}%
	       \rightskip=0pt plus 1fill \flushboth
	       {\par\noindent\bfseries \csname n:\the\c@tmpnumofauthors\endcsname\csname c:\the\c@tmpnumofauthors\endcsname}%
	       { -- \csname i:\the\c@tmpnumofauthors\endcsname}%
	       \edef\xxx{\csname a:\the\c@tmpnumofauthors\endcsname}%
	       \ifx\xxx\@empty
	        \else
		   {, \csname a:\the\c@tmpnumofauthors\endcsname}%
	       \fi
	       \edef\xxx{\csname e:\the\c@tmpnumofauthors\endcsname}%
	       \ifx\xxx\@empty
	        \else
		   {, \hbox{e-mail}: {\csname e:\the\c@tmpnumofauthors\endcsname}}%
	       \fi
	       \edef\xxx{\csname w:\the\c@tmpnumofauthors\endcsname}%
	       \ifx\xxx\@empty
	        \else
		   {, www: {\csname w:\the\c@tmpnumofauthors\endcsname}}%
	       \fi .%kropka na koncu
	   }%
	\ifcorrespond
	    \vglue 3pt
	    \noindent $^*$Corresponding author
	\fi
        \vglue 7pt
        \hrule
        \vskip 3pt
      \fi
}
\newbox\@tmpabox
\newdimen\@tmpxdim
\newdimen\@tmpydim
\def\@maketitle{%
  \newpage
  \null
  \vskip -8mm
  \null
  \vbox to 4.25cm{%
  \vfill
  \hsize=\textwidth
  \setbox\@tmpabox=\hbox{\vbox{\hsize=\textwidth\leftskip=0pt plus 1fill\rightskip=0pt plus 1fill\parindent=0pt {\newfontfamily\fonttyt{Carlito}\fonttyt\scshape \xLarge \@title \par}}}%
  \@tmpxdim=\wd\@tmpabox
  \@tmpydim=\ht\@tmpabox
  \leftskip=0pt plus 1fill\rightskip=0pt plus 1fill
   \leavevmode\scalebox{0.85}[1.15]{\copy\@tmpabox
                                     \kern-\@tmpxdim\kern 0.2pt\lower 0.2pt\copy\@tmpabox
                                     \kern-\@tmpxdim\kern 0.2pt\lower 0.2pt\copy\@tmpabox
				     \kern-\@tmpxdim\kern 0.2pt\lower 0.2pt\copy\@tmpabox}%
  \vfill
  \footnotesize
  \newfontfamily\fontrec{TeX Gyre Pagella}  
  \@ifundefined{@Received}%
      {\leavevmode}%
%      {\newfontfamily\fontrec{Palatino Linotype}\fontrec Submitted: \@Received%
      {\fontrec Submitted: \@Received
	  \@ifundefined{@Accepted}%
          {}%
	  {}%
      }%
  \@ifundefined{@Accepted}%
      {\leavevmode}%
%      {\newfontfamily\fontrec{Palatino Linotype}\fontrec%
	  {\fontrec
      \@ifundefined{@Received}%
	  {Accepted \@Accepted.}
	  {; accepted: \@Accepted}%
      }%
  \vskip 2pt
  \dblline
    \vskip 1em%
      \lineskip .5em%
      \normalsize\slshape
      \ifnum\value{numofauthors} < 1
	   \errmessage{Author of this article not defined!}%
        \else
	   \setcounter{tmpnumofauthors}{0}%
	   \whiledo{\value{numofauthors} > \value{tmpnumofauthors}}{%
	       \ifnum\c@tmpnumofauthors > 0
		, %
	       \fi
	       \stepcounter{tmpnumofauthors}%
%	       \newfontfamily\fontrec{Palatino Linotype}\fontrec
       \fontrec
		   \csname n:\the\c@tmpnumofauthors\endcsname%
	   }%
      \fi
  \null}%
  \vskip 1em}
 

\setcounter{secnumdepth}{3}
\newcounter {section}
\newcounter {subsection}[section]
\newcounter {paragraph}[subsection]
\renewcommand \thesection {\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-2.5ex \@plus -1ex \@minus -.2ex}%
                                   {3pt \@plus.1ex}%
                                   {\newfontfamily\fontsek{Carlito}\fontsek\large\bfseries}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-1.25ex\@plus -1ex \@minus -.2ex}%
                                     {3pt \@plus .2ex}%
                                     {\newfontfamily\fontsek{Carlito}\fontsek\normalsize\bfseries}}
\newcommand\paragraph{\@startsection{paragraph}{5}{\z@}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\newfontfamily\fontsek{Carlito}\fontsek\normalsize\bfseries}}
\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\if@titlepage
  \newenvironment{abstract}{%
      \titlepage
      \null\vfil
      \@beginparpenalty\@lowpenalty
      \begin{center}%
        \bfseries \abstractname
        \@endparpenalty\@M
      \end{center}}%
     {\par\vfil\null\endtitlepage}
\else
  \newenvironment{abstract}{%
      \if@twocolumn
        \section*{\abstractname}%
      \else
        \small
        \begin{center}%
          {\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}%
        \end{center}%
        \quotation
      \fi}
      {\if@twocolumn\else\endquotation\fi}
\fi
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\if@compatibility
\newenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\z@
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
    }
\else
\newenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\fi
\newcommand\appendix{\par
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \gdef\thesection{\@Alph\c@section}}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\renewcommand \theequation {\@arabic\c@equation}
\newcounter{figure}
\renewcommand \thefigure {\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}
\renewcommand\thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{\slshape #1. #2}%
%  \ifdim \wd\@tempboxa >\hsize
    \noindent \slshape #1. #2\par
%  \else
%    \global \@minipagefalse
%    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
%  \fi
  \vskip\belowcaptionskip}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{3}
\newcommand\tableofcontents{%
%    \section*{\contentsname
%        \@mkboth{%
%           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
%    \@starttoc{toc}%
    }
\newcommand*\l@section[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{1.0em \@plus\p@}%
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}
\newcommand*\l@subsection{\@dottedtocline{2}{1.5em}{2.3em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{3.8em}{3.2em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{7.0em}{4.1em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{10em}{5em}}
\newcommand\listoffigures{%
    \section*{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \section*{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    }
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{0.0ex}
\newenvironment{thebibliography}[1]
     {\section*{\refname}%
      \@mkboth{\refname}{\refname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
	    \itemsep 0pt
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \twocolumn[\section*{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \columnseprule \z@
                \columnsep 35\p@
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\refname{REFERENCES}
\newcommand\indexname{Index}
\newcommand\figurename{Fig.}
\newcommand\tablename{Tab.}
\newcommand\appendixname{Appendix}
\newcommand\abstractname{Abstract}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{plain}
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi
\pagestyle{headings}
\columnseprule=0.4pt
\columnsep=12mm
\parindent=1.5em
\renewcommand{\@seccntformat }[1]{\csname the#1\endcsname.~}
\let\footnote\endnote
\newenvironment{Abstract}
    {\newfontfamily\jakisfont{Carlito}\jakisfont\noindent{\upshape \@DOI}\vskip 1ex\noindent\bf\abstractname: \par \noindent \mdseries \slshape}
    {\@ifundefined{@keywords}{}{\vskip 1ex\noindent{\upshape \bf Keywords:} {\mdseries \slshape \@keywords}}}
	
\newenvironment{Acknowledgements}
    {\section*{ACKNOWLEDGEMENTS} \noindent \flushboth}	
	{}
\usepackage{enumitem}
\usepackage[breaklinks=true,
            colorlinks=true,
	    linkcolor=navy,
	    anchorcolor=black,
	    citecolor=navy,
	    filecolor=navy,
	    urlcolor=navy]
            {hyperref}
\setenumerate{itemsep=0pt,topsep=0pt,partopsep=3pt, leftmargin=*}
\setenumerate[1]{label=\arabic*), listparindent=1em}
\setenumerate[2]{label=\alph*)}
\setitemize{itemsep=0pt,topsep=0pt,partopsep=3pt, label={-}, itemindent=0pt, labelwidth=1em, leftmargin=*}
\def\texttilde{\char"7E} %8C
%\usepackage[QX]{fontenc}
\usepackage{fontspec}
\defaultfontfeatures{Ligatures=TeX}
%\usepackage{tgtermes}
%\renewcommand\sfdefault{lmss}

\setmainfont{Caladea}

% \setmainfont[Ligatures=TeX]{Cambria}
%\renewcommand\mddefault{sbc}
\usepackage[sort]{cite}
%\def\citepunct{, }
%\def\citemid{; }

\newfontfamily\fontcapt{Carlito}
\usepackage[config, labelfont={it}, textfont={it}, labelsep=period, justification=raggedright,
			singlelinecheck=false]{caption} %{caption, subfig}
\DeclareCaptionFont{fontcaption}{\fontcapt}
\captionsetup{labelfont={fontcaption, bf}, textfont={fontcaption}}

\let\bf\bfseries
\frenchspacing
\AtBeginDocument{\c@page=\@firstpage}

  \AtEndDocument{%
  }
\endinput
%%
%% End of file `article.cls'.
