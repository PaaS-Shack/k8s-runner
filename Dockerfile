FROM node:18-alpine

ENV time=2023-10-17-3

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
RUN git clone https://github.com/PaaS-Shack/accounts.git /app/accounts && cd /app/accounts && npm install
RUN git clone https://github.com/PaaS-Shack/config.git /app/config && cd /app/config && npm install
RUN git clone https://github.com/PaaS-Shack/mongodb.git /app/mongodb && cd /app/mongodb && npm install
RUN git clone https://github.com/PaaS-Shack/tokens.git /app/tokens && cd /app/tokens && npm install
RUN git clone https://github.com/PaaS-Shack/k8s.git /app/k8s && cd /app/k8s && npm install
RUN git clone https://github.com/PaaS-Shack/kube.git /app/kube && cd /app/kube && npm install
RUN git clone https://github.com/PaaS-Shack/utils.git /app/utils && cd /app/utils && npm install



CMD ["npm", "start"]
