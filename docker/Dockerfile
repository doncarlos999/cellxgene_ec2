FROM continuumio/anaconda3:2021.04
WORKDIR /app
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install -y libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6 libcairo2-dev libxt-dev cpio wget
RUN git clone https://github.com/interactivereport/cellxgene_VIP.git
WORKDIR cellxgene_VIP
RUN conda config --set channel_priority flexible
RUN conda env create -n VIP -f VIP_conda_R.yml
#ENV PATH /opt/conda/envs/VIP/bin:$PATH
RUN /bin/bash -c 'source activate VIP && ./config.sh'
RUN export LIBARROW_MINIMAL=false
#RUN conda install -c bioconda r-devtools bioconductor-fgsea r-rmarkdown r-tidyverse r-viridis r-arrow r-cairo r-foreign 
#RUN conda install -c confa-forge r-seurat==3.2.3 r-ggpubr r-ggrastr
RUN /bin/bash -c "source activate VIP &&  R -q -e 'if(!require(devtools)) install.packages(\"devtools\",repos = \"http://cran.us.r-project.org\")'"
RUN /bin/bash -c "source activate VIP &&  R -q -e 'if(!require(ggrastr)) devtools::install_version(\"ggrastr\",version=\"0.1.9\",repos = \"http://cran.us.r-project.org\")'"
RUN /bin/bash -c "source activate VIP &&  R -q -e 'if(!require(foreign)) devtools::install_version(\"foreign\",version=\"0.8-76\",repos = \"http://cran.us.r-project.org\")'"
RUN /bin/bash -c "source activate VIP &&  R -q -e 'if(!require(ggpubr)) devtools::install_version(\"ggpubr\",version=\"0.3.0\",repos = \"http://cran.us.r-project.org\")'"
RUN /bin/bash -c "source activate VIP &&  R -q -e 'if(!require(arrow)) devtools::install_version(\"arrow\",version=\"2.0.0\",repos = \"http://cran.us.r-project.org\")'"
RUN /bin/bash -c "source activate VIP &&  R -q -e 'if(!require(rmarkdown)) devtools::install_version(\"rmarkdown\",version=\"2.5\",repos = \"http://cran.us.r-project.org\")'"
RUN /bin/bash -c "source activate VIP &&  R -q -e 'if(!require(tidyverse)) devtools::install_version(\"tidyverse\",version=\"1.3.0\",repos = \"http://cran.us.r-project.org\")'"
RUN /bin/bash -c "source activate VIP &&  R -q -e 'if(!require(viridis)) devtools::install_version(\"viridis\",version=\"0.5.1\",repos = \"http://cran.us.r-project.org\")'"
RUN /bin/bash -c "source activate VIP &&  R -q -e 'if(!require(BiocManager)) devtools::install_version(\"BiocManager\",version=\"1.30.10\",repos = \"http://cran.us.r-project.org\")'"
RUN /bin/bash -c "source activate VIP &&  R -q -e 'if(!require(rsvd)) devtools::install_version(\"rsvd\",version=\"1.0.3\",repos = \"http://cran.us.r-project.org\")'"
RUN /bin/bash -c "source activate VIP &&  R -q -e 'devtools::install_version(\"spatstat\",version=\"1.64-1\",repos = \"http://cran.us.r-project.org\")'"
RUN /bin/bash -c "source activate VIP &&  R -q -e 'devtools::install_version(\"Seurat\",version=\"3.2.3\", upgrade = \"never\",repos = \"http://cran.us.r-project.org\")'"
RUN /bin/bash -c "source activate VIP &&  R -q -e 'if(!require(fgsea)) BiocManager::install(\"fgsea\")'"
RUN /bin/bash -c "source activate VIP && Rscript -e 'reticulate::py_config()'"
RUN export RETICULATE_PYTHON=`which python`
RUN pip install cellxgene-gateway
COPY cellxgene-gateway.sh .
EXPOSE 3838
ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "VIP", "bash", "cellxgene-gateway.sh"]
