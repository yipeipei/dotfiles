#!/usr/bin/env bash

sudo tlmgr update --self
sudo tlmgr install latexmk

# sig-alternate
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

# moderncv
sudo tlmgr install moderncv  # ! LaTeX Error: File `moderncv.sty' not found.
sudo tlmgr install marvosym  # optional, for icons in moderncv
sudo tlmgr install fontawesome  # optional, for icons in moderncv
sudo tlmgr install cjk  # ! LaTeX Error: File `CJKutf8.sty' not found.

# llncs
sudo tlmgr install algorithm2e  # ! LaTeX Error: File `algorithm2e.sty' not found.
sudo tlmgr install ifoddpage  # ! LaTeX Error: File `ifoddpage.sty' not found.
sudo tlmgr install relsize  # ! LaTeX Error: File `relsize.sty' not found.

# acmart
sudo tlmgr install xstring  # ! LaTeX Error: File `xstring.sty' not found.
sudo tlmgr install totpages  # ! LaTeX Error: File `totpages.sty' not found.
sudo tlmgr install environ  # ! LaTeX Error: File `environ.sty' not found.
sudo tlmgr install trimspaces  # ! LaTeX Error: File `trimspaces.sty' not found.
sudo tlmgr install ncctools  # ! LaTeX Error: File `manyfoot.sty' not found.
sudo tlmgr install libertine  # You do not have the libertine package installed. Please upgrade your TeX
sudo tlmgr install inconsolata  # You do not have the zi4 package installed. Please upgrade your TeX
sudo tlmgr install newtx  # You do not have the newtxmath package installed. Please upgrade your TeX
sudo tlmgr install mweights  # ! LaTeX Error: File `mweights.sty' not found.
sudo tlmgr install fontaxes  # ! LaTeX Error: File `fontaxes.sty' not found.

# IEEEtran
sudo tlmgr install palatino  # Font OT1/ppl/m/n/10=pplr7t at 10.0pt not loadable: Metric (TFM) file not found.
sudo tlmgr install collection-fontsrecommended  # solved all "Metric (TFM) file not found"
