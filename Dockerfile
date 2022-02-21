FROM ghost:4.36.1
MAINTAINER Caden Kraft (cadenkraft@gmail.com)

RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates python-dev git bash vim curl && apt-get clean
RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py
RUN python get-pip.py
RUN pip2 install --upgrade pip==9.0.3
RUN	pip2 install buster

COPY /ghost-on-github-pages /tmp

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 2368
CMD ["node", "current/index.js"]

