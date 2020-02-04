# FROM alpine as Base

# RUN apk --update add git


# RUN git --version

# WORKDIR /usr/src/moodle

# VOLUME ["/lms-git /usr/src/moodle"]

# RUN git clone -b MOODLE_36_STABLE git://git.moodle.org/moodle.git 

# RUN ls -ltra

# FROM alpine as Web

# RUN apk --update add nginx

# EXPOSE 80

FROM alpine/git as base

WORKDIR /usr/src/

RUN git clone git://git.moodle.org/moodle.git 

FROM alpine/git as moodle

WORKDIR /usr/src/moodle

COPY --from=base /usr/src/moodle .

RUN git branch -a \
    && git branch --track MOODLE_38_STABLE origin/MOODLE_38_STABLE \
    && git checkout MOODLE_38_STABLE

FROM nginx:1.17.8-alpine as Web

WORKDIR /usr/share/nginx/html

COPY --from=moodle /usr/src/moodle .

# RUN mkdir /var/www/html
# RUN cd /var/www/html
RUN echo "<html><head><title>Test</title></head><body>Test LMS</body></html>" > index.html
# RUN cat index.html
RUN pwd
RUN ls -ltra

EXPOSE 80
