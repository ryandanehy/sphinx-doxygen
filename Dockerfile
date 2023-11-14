# Container image that runs your code
FROM python:3.13.0a1-alpine3.18

# Sphinx
RUN pip3 install --no-cache-dir \
    sphinx \
    breathe &&\
    # Tex
    apk update

RUN ["chmod", "+x", "entrypoint.sh"]
# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
# this where doxygen is added as a package
ENTRYPOINT ["/entrypoint.sh"]
