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

FROM python:2 as runner

WORKDIR /home/hep
ADD requirements.sh /home/hep/requirements.sh
RUN apt-get -y update
RUN apt-get -y install $(/bin/bash /home/hep/requirements.sh apt-get-run)

RUN /bin/bash /home/hep/requirements.sh pip

COPY --from=builder /home/hep/madnklo /home/hep/madnklo

WORKDIR /var/mg5_persistent
ENTRYPOINT ["/home/hep/madnklo/bin/mg5_aMC"]
CMD []
