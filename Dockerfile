FROM node:11

RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | tee -a /etc/apt/sources.list 
    # Fetch Chrome's PGP keys for secure installation
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - 
    # Update aptitude's package sources
RUN apt-get -qq update -y 
    # Install latest Chrome stable, Xvfb packages
RUN apt-get -qq install -y google-chrome-stable xvfb gtk2-engines-pixbuf xfonts-cyrillic xfonts-100dpi xfonts-75dpi xfonts-base xfonts-scalable imagemagick x11-apps default-jre
    # Launch Xvfb
RUN Xvfb :0 -ac -screen 0 1024x768x24 & 
    # Export display for Chrome
RUN export DISPLAY=:99 
RUN curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose 
RUN chmod +x /usr/local/bin/docker-compose 
