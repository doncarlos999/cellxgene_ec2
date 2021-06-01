FROM continuumio/anaconda3:2021.04
WORKDIR /app
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install -y libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6 libcairo2-dev libxt-dev
RUN apt-get install -y wget
RUN git clone https://github.com/interactivereport/cellxgene_VIP.git
WORKDIR cellxgene_VIP
RUN conda config --set channel_priority flexible
RUN conda env create -n VIP -f VIP_conda_R.yml
ENV PATH /opt/conda/envs/VIP/bin:$PATH
RUN /bin/bash -c "source activate VIP"
RUN apt-get -y install cpio
RUN ./config.sh
RUN export LIBARROW_MINIMAL=false
RUN  R -q -e 'if(!require(devtools)) install.packages("devtools",repos = "http://cran.us.r-project.org")'
RUN  R -q -e 'if(!require(Cairo)) devtools::install_version("Cairo",version="1.5-12",repos = "http://cran.us.r-project.org")'
RUN  R -q -e 'if(!require(foreign)) devtools::install_version("foreign",version="0.8-76",repos = "http://cran.us.r-project.org")'
RUN  R -q -e 'if(!require(ggpubr)) devtools::install_version("ggpubr",version="0.3.0",repos = "http://cran.us.r-project.org")'
RUN  R -q -e 'if(!require(ggrastr)) devtools::install_version("ggrastr",version="0.1.9",repos = "http://cran.us.r-project.org")'
RUN  R -q -e 'if(!require(arrow)) devtools::install_version("arrow",version="2.0.0",repos = "http://cran.us.r-project.org")'
RUN  R -q -e 'if(!require(Seurat)) devtools::install_version("Seurat",version="3.2.3",repos = "http://cran.us.r-project.org")'
RUN  R -q -e 'if(!require(rmarkdown)) devtools::install_version("rmarkdown",version="2.5",repos = "http://cran.us.r-project.org")'
RUN  R -q -e 'if(!require(tidyverse)) devtools::install_version("tidyverse",version="1.3.0",repos = "http://cran.us.r-project.org")'
RUN  R -q -e 'if(!require(viridis)) devtools::install_version("viridis",version="0.5.1",repos = "http://cran.us.r-project.org")'
RUN  R -q -e 'if(!require(BiocManager)) devtools::install_version("BiocManager",version="1.30.10",repos = "http://cran.us.r-project.org")'
RUN  R -q -e 'if(!require(fgsea)) BiocManager::install("fgsea")'
RUN Rscript -e 'reticulate::py_config()'
RUN export RETICULATE_PYTHON=`which python`
RUN pip install cellxgene-gateway
COPY cellxgene-gateway.sh .
EXPOSE 3838
ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "VIP", "bash", "cellxgene-gateway.sh"]
