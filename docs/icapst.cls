\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{icapst}[2026/05/13 ICAPST Abstract Class]
\LoadClass[12pt,a4paper]{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{newtxtext,newtxmath}
\RequirePackage{geometry}
\RequirePackage{setspace}
\RequirePackage{ragged2e}
\RequirePackage{indentfirst}

\geometry{
    a4paper,
    left=25.4mm,
    right=25.4mm,
    top=35mm,
    bottom=25.4mm
}

% ── Title ────────────────────────────────────────────────────────────────────
\newcommand{\@paperTitle}{}
\renewcommand{\title}[1]{\renewcommand{\@paperTitle}{#1}}

% ── Authors: collect as comma-separated list ─────────────────────────────────
\newcommand{\@paperAuthors}{}
\newif\if@authorsfirst
\@authorsfirsttrue
\renewcommand{\author}[2][]{%
    \if@authorsfirst
        \@authorsfirstfalse
        \g@addto@macro\@paperAuthors{#2\ifx\\#1\\\else$^{#1}$\fi}%
    \else
        \g@addto@macro\@paperAuthors{, #2\ifx\\#1\\\else$^{#1}$\fi}%
    \fi
}

% ── Affiliations: collect line by line ───────────────────────────────────────
\newcommand{\@affiliations}{}
\newif\if@affilfirst
\@affilfirsttrue
\newcommand{\affil}[2][]{%
    \if@affilfirst
        \@affilfirstfalse
        \g@addto@macro\@affiliations{\ifx\\#1\\\else$^{#1}$\fi#2}%
    \else
        \g@addto@macro\@affiliations{\\[1pt]\ifx\\#1\\\else$^{#1}$\fi#2}%
    \fi
}

% ── Email ────────────────────────────────────────────────────────────────────
\newcommand{\@email}{}
\newcommand{\email}[1]{\renewcommand{\@email}{#1}}

% ── Title block ──────────────────────────────────────────────────────────────
\renewcommand{\maketitle}{
    \begin{center}
        \singlespacing
        {\fontsize{12pt}{14pt}\selectfont \textbf{\@paperTitle} \\[0pt]}
        {\fontsize{12pt}{14pt}\selectfont \@paperAuthors \\[0pt]}
        {\fontsize{12pt}{14pt}\selectfont \textit{\@affiliations} \\[0pt]}
        {\fontsize{12pt}{14pt}\selectfont \textit{* E-mail: \@email} \par}
    \end{center}
    \vspace{2pt}
}

% ── Abstract environment ─────────────────────────────────────────────────────
\renewenvironment{abstract}{
    \begin{center}
        {\fontsize{12pt}{14pt}\selectfont \textbf{ABSTRACT} \par}
    \end{center}
    \vspace{-10pt}
    \fontsize{12pt}{14pt}\selectfont
    \setstretch{1.0}
    \justifying
    \setlength{\parindent}{0.5in}
    \noindent\hspace{0.5in}\ignorespaces
}{
    \par
}

% ── Keywords ─────────────────────────────────────────────────────────────────
\newcommand{\keywords}[1]{
    \vspace{1\baselineskip}
    \noindent \fontsize{11pt}{13pt}\selectfont \textbf{Keywords:} \textit{#1}
}
