#!/usr/bin/env bash

sudo tlmgr update --self
sudo tlmgr install latexmk
sudo tlmgr install helvetic  # ! I can't find file `phvb8t'.
sudo tlmgr install enumitem  # ! LaTeX Error: File `enumitem.sty' not found.
sudo tlmgr install kantlipsum  # ! LaTeX Error: File `kantlipsum.sty' not found.
sudo tlmgr install preprint  # ! LaTeX Error: File `balance.sty' not found.
sudo tlmgr install comment  # ! LaTeX Error: File `comment.sty' not found.
sudo tlmgr install subfigure  # ! LaTeX Error: File `subfigure.sty' not found.
sudo tlmgr install savesym  # ! LaTeX Error: File `savesym.sty' not found.
sudo tlmgr install multirow  # ! LaTeX Error: File `multirow.sty' not found.
sudo tlmgr install soul  # ! LaTeX Error: File `soul.sty' not found.
sudo tlmgr install algorithmicx  # ! LaTeX Error: File `algorithmicx.sty' not found.
sudo tlmgr install algorithms  # ! LaTeX Error: File `algorithm.sty' not found.

sudo tlmgr install moderncv  # ! LaTeX Error: File `moderncv.sty' not found.
sudo tlmgr install marvosym  # optional, for icons in moderncv
sudo tlmgr install fontawesome  # optional, for icons in moderncv
