FROM python:2 as builder 

USER root

WORKDIR /home/hep
ADD requirements.sh /home/hep/requirements.sh
RUN apt-get -y update

RUN apt-get -y install $(/bin/bash /home/hep/requirements.sh apt-get-build)

RUN /bin/bash /home/hep/requirements.sh pip

RUN git clone --depth 1 -b master https://github.com/madnklo/madnklo.git

WORKDIR /home/hep/madnklo/vendor/CutTools
RUN make
WORKDIR /home/hep/madnklo/vendor/IREGI/src
RUN make

WORKDIR /home/hep/madnklo
RUN echo "install ninja" | bin/mg5_aMC

WORKDIR /home/hep
ADD install_lhapdf_6.2.3.sh /home/hep/install_lhapdf.sh
RUN /home/hep/install_lhapdf.sh

FROM python:2 as runner

WORKDIR /home/hep
ADD requirements.sh /home/hep/requirements.sh
RUN apt-get -y update
RUN apt-get -y install $(/bin/bash /home/hep/requirements.sh apt-get-run)

RUN /bin/bash /home/hep/requirements.sh pip

ENV PATH="/home/hep/lhapdf/bin:${PATH}"
ENV LD_LIBRARY_PATH="/home/hep/lhapdf/lib:${LD_LIBRARY_PATH}"
ENV PYTHONPATH="/home/hep/lhapdf/lib/python2.7/site-packages/:${PYTHONPATH}"

COPY --from=builder /home/hep/madnklo /home/hep/madnklo
COPY --from=builder /home/hep/lhapdf /home/hep/lhapdf

RUN mkdir -p /root/.config/matplotlib
RUN echo "backend: agg" >>  ~/.config/matplotlib/matplotlibrc
RUN lhapdf install PDF4LHC15_nlo_30

WORKDIR /var/madnklo_persistent
ENTRYPOINT ["/home/hep/madnklo/bin/mg5_aMC"]
CMD []
