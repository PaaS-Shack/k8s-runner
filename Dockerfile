FROM node:18-alpine

ENV time=2023-10-17-2

ENV NODE_ENV=production

RUN mkdir /app
WORKDIR /app

RUN apk add --no-cache git

COPY package.json ./

RUN npm install --production

RUN git clone https://github.com/PaaS-Shack/email.git /app/email && cd /app/email && npm install
RUN git clone https://github.com/PaaS-Shack/github.git /app/github && cd /app/github && npm install
RUN git clone https://github.com/PaaS-Shack/ci-cd.git /app/ci-cd && cd /app/ci-cd && npm install
RUN git clone https://github.com/PaaS-Shack/mysql.git /app/mysql && cd /app/mysql && npm install
RUN git clone https://github.com/PaaS-Shack/domains.git /app/domains && cd /app/domains && npm install
RUN git clone https://github.com/PaaS-Shack/routes.git /app/routes && cd /app/routes && npm install
RUN git clone https://github.com/PaaS-Shack/dohs.git /app/dohs && cd /app/dohs && npm install
RUN git clone https://github.com/PaaS-Shack/certificates.git /app/certificates && cd /app/certificates && npm install



CMD ["npm", "start"]
