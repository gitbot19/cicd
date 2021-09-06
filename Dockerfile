FROM debian

RUN export node_version="0.10" \
&& apt-get update && apt-get -y install nodejs="$node_verion"

COPY package.json usr/src/app
# hadolint ignore=DL3016888
RUN cd /usr/src/app \
&& npm install node-static

# hadolint ignore=DL3011888
#EXPOSE 80000
EXPOSE 65531
CMD ["npm", "start"]