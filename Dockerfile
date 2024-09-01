FROM node:20-slim

RUN apt-get clean && apt-get update --allow-unauthenticated
RUN apt-get install -y fonts-liberation fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf tini wget unzip ca-certificates \
      --no-install-recommends

RUN apt-get install -y libasound2 libatk-bridge2.0-0 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 \
  libfontconfig1 libgbm1 libgcc1 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 \
  libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 lsb-release xdg-utils \
  --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN wget https://storage.googleapis.com/chrome-for-testing-public/128.0.6613.86/linux64/chrome-headless-shell-linux64.zip -O /tmp/chrome-headless-shell-linux64.zip \
  && unzip /tmp/chrome-headless-shell-linux64.zip -d / && rm /tmp/chrome-headless-shell-linux64.zip && ln -s /chrome-headless-shell-linux64/chrome-headless-shell /usr/bin/chrome
  
#RUN npm i -g @puppeteer/browsers
#RUN npx @puppeteer/browsers install chrome-headless-shell@128.0.6613.86
#RUN ln -s /chrome-headless-shell/linux-128.0.6613.86/chrome-headless-shell-linux64/chrome-headless-shell /usr/bin/chrome
