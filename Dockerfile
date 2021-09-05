FROM ubuntu:18.04
COPY hello.sh /
ENTRYPOINT [ "/bin/bash", "/hello.sh" ]
