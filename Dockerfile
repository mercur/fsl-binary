FROM centos:7

ENV MIRROR https://fsl.fmrib.ox.ac.uk
RUN yum update -y
RUN yum install -y python2 file libpng12 libmng which wget libquadmath-devel
RUN mkdir build
RUN curl -o /build $MIRROR/fsldownloads/fslinstaller.py 
WORKDIR /build
ENV FSLDIR /usr/local/fsl
RUN python2 fslinstaller.py -d $FSLDIR
ENV PATH "$FSLDIR/bin:$PATH"