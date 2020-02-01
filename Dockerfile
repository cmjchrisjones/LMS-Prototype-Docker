FROM alpine as Base

RUN apk --update add git


RUN git --version

WORKDIR /usr/src/moodle

RUN git clone -b MOODLE_36_STABLE git://git.moodle.org/moodle.git 

RUN ls -ltra