FROM momocpp

# build in ~/programmieren/C with the following command:
# docker build -t momocpplibs ~/setupUbuntu/momocpplibs.Dockerfile

WORKDIR /momo

# logging
COPY logging/Makefile ./
COPY logging/src/ ./src
RUN make clean
RUN make install
RUN rm -rf src

# tools
COPY tools/Makefile ./
COPY tools/src/ ./src
RUN make clean
RUN make install
RUN rm -rf src

# jsonParser
COPY jsonParser/Makefile ./
COPY jsonParser/src/ ./src
RUN make clean
RUN make install
RUN rm -rf src

# math TODO

# molgen TODO

# chem TODO


ENTRYPOINT ["sh"]


