FROM node:14.18.0-slim

# Install packages
RUN apt-get update && apt-get install -yq \
    git \
    expect-dev

ADD bin/ /bin

CMD npm-auth
