FROM ubuntu:latest

# see: https://askubuntu.com/questions/909277/avoiding-user-interaction-with-tzdata-when-installing-certbot-in-a-docker-contai
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update

#latex
RUN apt-get install -y texlive-lang-german        
RUN apt-get install -y texlive-fonts-recommended   
RUN apt-get install -y texlive-pictures            
RUN apt-get install -y texlive-latex-recommended   
RUN apt-get install -y texlive-science             
RUN apt-get install -y texlive-latex-extra         
RUN apt-get install -y preview-latex-style         
RUN apt-get install -y imagemagick                 
WORKDIR /etc
COPY policy.xml ImageMagick-6

ENV DEBIAN_FRONTEND=interactive

#gnuplot
RUN apt-get update
RUN apt-get install -y gnuplot

# C/C++
RUN apt-get install -y make
RUN apt-get install -y g++

# libraries
# RUN apt-get install -y libeigen2-dev          # lin Algebra, required vor openbabel
# RUN apt-get install -y libeigen3-dev          # lin Algebra, required vor valeev/libint uses
# RUN apt-get install -y libopencv-dev          # opencv
RUN apt-get install -y nauty
RUN apt-get install -y libnauty2-dev
RUN apt-get install -y librapidxml-dev
# funktioniert noch nicht, war fuer schuelerlabor? RUN apt-get install -y phantomjs


# tools: ping/curl for testing, ssh required e.g. for tunnels to grouper service
RUN apt-get install -y iputils-ping
RUN apt-get install -y curl
RUN apt-get install -y openssh-server

# the make install commands in my cpp projects read and write resources
# to ~/local/include and ~/local/lib
# in my docker image, I want these to be located in momo/lib/ and momo/include
WORKDIR /momo/lib
WORKDIR /momo/include
WORKDIR /root/local
RUN ln -s /momo/lib
RUN ln -s /momo/include




ENTRYPOINT ["sh"]
