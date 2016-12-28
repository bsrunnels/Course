\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{course}
\DeclareOption{syllabus}{\def\@syllabus{}}
\DeclareOption{notes}{\def\@notes{}}
\DeclareOption{homework}{\def\@homework{}}
\DeclareOption{exam}{\def\@exam{}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

%
% PACKAGES
%
\RequirePackage[cm]{sfmath}
\RequirePackage[labelformat=empty]{caption}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{bm}
\RequirePackage{booktabs}
\RequirePackage{cancel}
\RequirePackage{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage{framed}
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\RequirePackage{ifthen}
\RequirePackage{lastpage}                       % count number of pages, provide LastPage
\RequirePackage{mdframed}  
\RequirePackage{placeins}
\RequirePackage{tabularx}
\RequirePackage{tcolorbox}
\RequirePackage{textcomp}
\RequirePackage{textpos}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{tocloft}
\RequirePackage{url}
\RequirePackage{xr}                             % ability to reference external documents

%
% METADATA MACROS 
%
\def\@name{}       \newcommand{\name}[1]{\def\@name{#1}}
\def\@institution{}\newcommand{\institution}[1]{\def\@institution{#1}}
\def\@webpage{}    \newcommand{\webpage}[1]{\def\@webpage{#1}}
\def\@copyright{}  \renewcommand{\copyright}[1]{\def\@copyright{#1}}


\ifdefined\@homework
\newcommand{\hwtitle}[1]{\def\@hwtitle{#1}}
\newcommand{\assigneddate}[1]{\def\@assigneddate{#1}}
\newcommand{\duedate}[2][]{
  \ifthenelse{\equal{#1}{}}{\def\@shortduedate{#2}}{\def\@shortduedate{#1}}
  \def\@duedate{#2}}
\newcommand{\hwnotes}[1]{\def\@hwnotes{#1}}
\fi

\ifdefined\@exam
\newcommand{\examname}[1]{\def\@examname{#1}}
\newcommand{\givendate}[1]{\def\@givendate{#1}}
\newcommand{\instructions}[1]{\def\@instructions{#1}}
\newcommand{\results}[1]{\def\@results{#1}}
\newcommand{\examnotes}[1]{\def\@examnotes{#1}}
\fi


%
% UNIVERSAL FORMATTING SETTINGS
%
% Page layout
\setlength{\headheight}{25pt}
\setlength{\topmargin}{-0.44in}
\setlength{\oddsidemargin}{-15pt}
\setlength{\evensidemargin}{-15pt}
\setlength{\marginparsep}{5pt}
\setlength{\marginparwidth}{45pt}
\setlength{\textheight}{625pt}
\setlength{\textwidth}{500pt}
\setlength{\footskip}{30pt}
% Sans Serif Font
\renewcommand{\familydefault}{\sfdefault}
\renewcommand*{\arraystretch}{0.75} % change matrix height
% Page rule styling
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}
% Table of contents customization
\setcounter{tocdepth}{2}
\setlength{\cftbeforesecskip}{2pt}\setlength{\cftbeforesubsecskip}{2pt}
\cftsetpnumwidth{2em} % fix so that long page numbers don't overflow to the right
\cftsetindents{subsection}{1cm}{1cm}
% Paragraph flow
\widowpenalties 1 1000 % no page breaks in the middle of paragraphs
\setlength\parindent{0cm}
% Default MDFrame -- no borders
\mdfsetup{skipabove=0pt,skipbelow=0pt} 
% Hyperlink setup
\hypersetup{pdfborder={0 0 0}}

%
% TITLE PAGE CUSTOMIZATION
%
% Syllabus
\ifdefined\@syllabus
\renewcommand\maketitle
{
  \thispagestyle{syllabus-plain}
  \begin{center}
    {\LARGE \bf \@name} \\
    \vspace{5pt}{\LARGE \bf Syllabus}
  \end{center}
  \noindent\rule{\textwidth}{0.5pt}
}
\fi
% Course Notes
\ifdefined\@notes
\renewcommand\maketitle
{
  \thispagestyle{notes-plain}
  \begin{center}
    {\LARGE \bf \@name} \\
    \vspace{5pt}{\LARGE \bf Course Notes}
  \end{center}
  \noindent\rule{\textwidth}{0.5pt}
}
\fi
% Homework
\ifdefined\@homework
\renewcommand\maketitle
{
  \thispagestyle{hw-plain}
  \begin{center}
    {\LARGE \bf \@name} \\
    \vspace{5pt}{\LARGE \bf \@hwtitle \ifdefined\Solutions\ Solutions \fi}

    \ifdefined\@duedate
    \vspace{0.5cm}
    \ifdefined\@assigneddate{\large Assigned: \@assigneddate}\fi \\ 
    \vspace{1pt}{\large \bf Due: \@duedate}
    \fi

    \ifdefined\@hwnotes
    \vspace{0.5cm}
    {\large \@hwnotes}
    \fi
  \end{center}
  \noindent\rule{\textwidth}{0.5pt}
}
\fi
% Exam
\ifdefined\@exam
\renewcommand\maketitle
{
  \thispagestyle{exam-plain}
  \begin{center}
    {\LARGE \bf \@name} \\
    \vspace{5pt}{\LARGE \bf \@examname \ifdefined\Solutions\ Solutions \fi}

    \ifdefined\@givendate
    \vspace{0.5cm}
    {\large \@givendate} \\ 
    \fi

    \ifdefined\@examnotes
    \vspace{0.5cm}
    {\large \@examnotes}
    \fi
  \end{center}
  \noindent\rule{\textwidth}{0.5pt}
  \ifdefined\Solutions
  \ifdefined\@results \vfill\@results\vfill \newpage \fi
  \else
  \ifdefined\@instructions \vfill\@instructions\vfill \newpage \fi 
  \fi
}
\fi



%
% HEADER / FOOTER CUSTOMIZATION
%
\ifdefined\@notes 
\fancypagestyle{notes-fancy}
{
  \lhead{\@name\\\@institution}
  \chead{}
  \rhead{Course Notes\\ \@webpage}
  \lfoot{\@copyright}
  \cfoot{}\rfoot{\thepage}
}
\fancypagestyle{notes-plain}
{
  \rhead{} 
  \chead{} 
  \lhead{}
  \lfoot{\@copyright}
  \cfoot{}
  \rfoot{\thepage}
}
\pagestyle{notes-fancy}
\tocloftpagestyle{notes-plain}
\fi

\ifdefined\@homework
\fancypagestyle{hw-plain}
{
  \rhead{} 
  \chead{} 
  \lhead{}
  \lfoot{\@copyright}
  \cfoot{}
  \rfoot{\thepage/\pageref{LastPage}}
}
\fancypagestyle{hw-fancy}
{
  \lhead{\@name\\\@institution}
  \chead{} 
  \rhead{
    \@hwtitle \ifdefined\Solutions\ Solutions \fi \\ 
    \ifdefined\@shortduedate Due: \@shortduedate\fi} 
  \lfoot{\@copyright}
  \cfoot{}
  \rfoot{\thepage/\pageref{LastPage}}
}
\pagestyle{hw-fancy}
\tocloftpagestyle{hw-plain}
\fi

\ifdefined\@exam
\fancypagestyle{exam-plain}
{
  \rhead{} 
  \chead{} 
  \lhead{}
  \lfoot{\@copyright}
  \cfoot{}
  \rfoot{\thepage/\pageref{LastPage}}
}
\fancypagestyle{exam-fancy}
{
  \lhead{\@name\\\@institution}
  \chead{} 
  \rhead{
    \@examname \ifdefined\Solutions\ Solutions \fi \\ 
    \ifdefined\@givendate\@givendate\fi} 
  \lfoot{\@copyright}
  \cfoot{}
  \rfoot{\thepage/\pageref{LastPage}}
}
\pagestyle{exam-fancy}
\tocloftpagestyle{exam-plain}
\fi

\ifdefined\@syllabus
\fancypagestyle{syllabus-plain}
{
  \rhead{} 
  \chead{} 
  \lhead{}
  \lfoot{\@copyright}
  \cfoot{}
  \rfoot{\thepage}
}
\fancypagestyle{syllabus-fancy}
{
  \lhead{\@name\\\@institution}
  \chead{} 
  \rhead{
    Syllabus - \@date \\ 
    \@webpage} 
  \lfoot{\@copyright}
  \cfoot{}
  \rfoot{\thepage}
}
\pagestyle{syllabus-fancy}
\fi



%
% DEFINITIONS
%
\newtheorem{definition}{Definition}
\numberwithin{definition}{section}

%
% EQUATIONS
%
\numberwithin{equation}{section}

%
% LECTURE ENVIRONMENT
%
\newcounter{lecture}
\newcounter{tempsec}\setcounter{tempsec}{888}
\newcounter{tempsubsec}\setcounter{tempsubsec}{888}
\newenvironment{lecture}[1][]
{
  \clearpage\pagebreak\newpage
  \FloatBarrier 
  \phantomsection
  \setcounter{page}{1}
  \stepcounter{lecture}
  %\pagestyle{notes-fancy}
  \thispagestyle{notes-plain}
  \rhead{Course Notes - Lecture \thelecture \\ \@webpage}
  \renewcommand\thepage{\thelecture.\arabic{page}}
  \begin{minipage}{\linewidth}
    \vspace{-1.4cm}
    \begin{minipage}{0.20\linewidth}\begin{tcolorbox}[width=\linewidth,height=1cm,arc=0pt,boxsep=0pt,colback=black]\vfill\color{white}\bf\Large {Lecture \thelecture}\vfill\end{tcolorbox}\end{minipage}
    \begin{minipage}{0.80\linewidth}\begin{tcolorbox}[width=\linewidth,height=1cm,arc=0pt,boxsep=0pt,grow to left by=5pt,grow to right by=-2pt]\bf\Large {#1}\end{tcolorbox}\end{minipage}
  \end{minipage}
  \nopagebreak\par\vspace{1em}\nopagebreak
  \addtocontents{toc}{\protect\pagebreak[1]}
  \addcontentsline{toc}{lecture}{Lecture \thelecture}
  \addtocontents{toc}{\protect\nopagebreak[4]\vspace{-\baselineskip}}
}{
  \ifthenelse{\value{tempsec}=\value{section} \AND \value{tempsubsec}=\value{subsection}}
  {\addtocontents{toc}{\protect\nopagebreak[4]\vspace{\baselineskip}}}{}
  \setcounter{tempsec}{\arabic{section}}
  \setcounter{tempsubsec}{\arabic{subsection}}
  \renewcommand\thepage{\thelecture.\arabic{page}}
  \clearpage
}

% 
% EXAMPLE ENVIRONMANT
% 
\newtheorem{example}{Example}
\numberwithin{example}{section}
\renewenvironment{example}[1][]
{
  \vspace{.25cm}
  \begin{mdframed}[backgroundcolor=gray!80,linewidth=2pt,innertopmargin=4pt,innerbottommargin=2pt,outermargin=0pt,topline=false,bottomline=true,leftline=false,rightline=false]
    \refstepcounter{example}
    {\bf Example \theexample}
    \ifthenelse{\equal{#1}{}}{}{{\bf: #1}}
  \end{mdframed}\nopagebreak
  \begin{mdframed}[backgroundcolor=gray!10,linewidth=1pt,outermargin=0pt,topline=false,bottomline=true,leftline=false,rightline=false]
  }
  { 
  \end{mdframed}
  \vspace{.25cm}
}

\newcounter{problem}

%
% PROBLEM ENVIRONMENT
%
\newenvironment{problem}[1][]
{
  \setenumerate[0]{label=(\alph*)}
  \numberwithin{equation}{problem}
  \numberwithin{figure}{problem}
  \renewcommand{\theequation}{\theproblem\alph{subproblem}.\arabic{equation}}
  \FloatBarrier{\vspace{1.5em}\bf\large Problem \setcounter{subproblem}{0}\setcounter{equation}{0}\theproblem\ifthenelse{\equal{#1}{}}{}{{\bf: #1}}
  }\nopagebreak\par\vspace{1em}\nopagebreak
}
{
}

%
% SUBPROBLEM ENVIRONMENT
%
\newcounter{subproblem}
\newenvironment{subproblem}
{
  \vspace{-2mm}
  \refstepcounter{subproblem}
  \setcounter{equation}{0}
  \begin{itemize}[style=multiline,labelindent=0pt,leftmargin=40pt]\item[(\theproblem\alph{subproblem})]
}
{
  \end{itemize}\vspace{-2mm}
}

%
% SOLUTION ENVIRONMENT
%
\NewEnviron{solution}{
    \ifdefined\Solutions
    \begin{subequations}
    \renewcommand{\theequation}{$^*$\theproblem\alph{subproblem}.\arabic{equation}}
    \begin{mdframed}[backgroundcolor=gray!20,linewidth=1pt,outermargin=0pt,skipabove=2pt,topline=false,bottomline=false,leftline=false,rightline=false]
      \noindent {\bf Solution} \\
      \BODY
    \end{mdframed}
    \renewcommand{\theequation}{\theproblem\alph{subproblem}.\arabic{equation}} 
  \end{subequations}
  \addtocounter{equation}{-1}
  \fi
}


%%PRISTINE
%\newcommand*\l@lecture[2]{%
%  \ifnum \c@tocdepth >\z@
%    \addpenalty\@secpenalty
%    \addvspace{1.0em \@plus\p@}%
%    \setlength\@tempdima{1.5em}%
%    \begingroup
%      \parindent \z@ \rightskip \@pnumwidth
%      \parfillskip -\@pnumwidth
%      \leavevmode \bfseries
%      \advance\leftskip\@tempdima
%      \hskip -\leftskip
%      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
%    \endgroup
%  \fi}


\cftsetindents{section}{2.3cm}{0.7cm}
\cftsetindents{subsection}{3.2cm}{1.0cm}

\newlength{\@lectocoffset}
\setlength{\@lectocoffset}{2pt}
\newcommand*\l@lecture[2]{%
  \vspace{\@lectocoffset}
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip 1.5em
      \hskip -\leftskip
      \small\color{gray}\fontfamily{phv}\fontseries{b}\fontshape{sc}\selectfont#1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss }\par\vspace{-\@lectocoffset}
    \endgroup
  }




