FROM ubuntu:latest

RUN apt-get update -qq
RUN apt-get install -qqy build-essential git make unzip tree curl nkf git python apache2

RUN git clone https://github.com/usp-engineers-community/Open-usp-Tukubai
RUN cd Open-usp-Tukubai && sudo make install

RUN git clone https://github.com/ryuichiueda/BashCMSBookCodes
RUN mkdir -p /var/www/www-data
RUN chown www-data:www-data /var/www/www-data
RUN cp -rp BashCMSBookCodes/bashcms.remote.chap4 /var/www/bashcms
RUN mkdir /var/log/bashcms
RUN chown root:adm /var/log/bashcms
RUN a2enmod cgi
ADD blog.conf /etc/apache2/sites-available/
RUN rm /etc/apache2/sites-enabled/000-default.conf
RUN ln -s /etc/apache2/sites-available/blog.conf /etc/apache2/sites-enabled/

EXPOSE 80
