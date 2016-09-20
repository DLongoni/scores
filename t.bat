@echo off

REM {{{  Dominio, Pw, maiusc

echo
echo ****** Prova con Dominio, Pw, Maiusc ******

set HTTP_PROXY=http://SPIMI\\U368208:Intesa01@inet1.gtm.corp.sanpaoloimi.com:8080
set HTTPS_PROXY=https://SPIMI\\U368208:Intesa01@inet1.gtm.corp.sanpaoloimi.com:8080
git fetch

set HTTP_PROXY=http://SPIMI\\U368208:Intesa01@inet2.gtm.corp.sanpaoloimi.com:8080
set HTTPS_PROXY=https://SPIMI\\U368208:Intesa01@inet2.gtm.corp.sanpaoloimi.com:8080
git fetch

set HTTP_PROXY=http://SPIMI\\U368208:Intesa01@172.22.16.64:3128
set HTTPS_PROXY=https://SPIMI\\U368208:Intesa01@172.22.16.64:3128
git fetch

set HTTP_PROXY=http://SPIMI\\U368208:Intesa01@172.22.0.206:3128
set HTTPS_PROXY=https://SPIMI\\U368208:Intesa01@172.22.0.206:3128
git fetch

REM }}}

REM {{{  Senza dominio, Pw, maiusc

echo
echo ****** Prova senza Dominio, Pw, Maiusc ******

set HTTP_PROXY=http://U368208:Intesa01@inet1.gtm.corp.sanpaoloimi.com:8080
set HTTPS_PROXY=https://U368208:Intesa01@inet1.gtm.corp.sanpaoloimi.com:8080
git fetch

set HTTP_PROXY=http://U368208:Intesa01@inet2.gtm.corp.sanpaoloimi.com:8080
set HTTPS_PROXY=https://U368208:Intesa01@inet2.gtm.corp.sanpaoloimi.com:8080
git fetch

set HTTP_PROXY=http://U368208:Intesa01@172.22.16.64:3128
set HTTPS_PROXY=https://U368208:Intesa01@172.22.16.64:3128
git fetch

set HTTP_PROXY=http://U368208:Intesa01@172.22.0.206:3128
set HTTPS_PROXY=https://U368208:Intesa01@172.22.0.206:3128
git fetch

REM }}}

REM {{{ Dominio senza escape, Pw, Maiusc

echo
echo ****** Prova con Dominio senza escape, Pw, Maiusc ******

set HTTP_PROXY=http://SPIMI\U368208:Intesa01@inet1.gtm.corp.sanpaoloimi.com:8080
set HTTPS_PROXY=https://SPIMI\U368208:Intesa01@inet1.gtm.corp.sanpaoloimi.com:8080
git fetch

set HTTP_PROXY=http://SPIMI\U368208:Intesa01@inet2.gtm.corp.sanpaoloimi.com:8080
set HTTPS_PROXY=https://SPIMI\U368208:Intesa01@inet2.gtm.corp.sanpaoloimi.com:8080
git fetch

set HTTP_PROXY=http://SPIMI\U368208:Intesa01@172.22.16.64:3128
set HTTPS_PROXY=https://SPIMI\U368208:Intesa01@172.22.16.64:3128
git fetch

set HTTP_PROXY=http://SPIMI\U368208:Intesa01@172.22.0.206:3128
set HTTPS_PROXY=https://SPIMI\U368208:Intesa01@172.22.0.206:3128
git fetch

REM }}}

REM {{{ No credenziali

echo
echo ****** Prova senza credenziali ******

set HTTP_PROXY=http://inet1.gtm.corp.sanpaoloimi.com:8080
set HTTPS_PROXY=https://inet1.gtm.corp.sanpaoloimi.com:8080
git fetch

set HTTP_PROXY=http://inet2.gtm.corp.sanpaoloimi.com:8080
set HTTPS_PROXY=https://inet2.gtm.corp.sanpaoloimi.com:8080
git fetch

set HTTP_PROXY=http://172.22.16.64:3128
set HTTPS_PROXY=https://172.22.16.64:3128
git fetch

set HTTP_PROXY=http://172.22.0.206:3128
set HTTPS_PROXY=https://172.22.0.206:3128
git fetch

REM }}}

REM {{{ Dominio senza escape, Pw, Maiusc

echo
echo ****** Prova con Dominio senza escape, Pw, Maiusc ******

set HTTP_PROXY=http://SPIMI\U368208:Intesa01@inet1.gtm.corp.sanpaoloimi.com:8080
set HTTPS_PROXY=https://SPIMI\U368208:Intesa01@inet1.gtm.corp.sanpaoloimi.com:8080
git fetch

set HTTP_PROXY=http://SPIMI\U368208:Intesa01@inet2.gtm.corp.sanpaoloimi.com:8080
set HTTPS_PROXY=https://SPIMI\U368208:Intesa01@inet2.gtm.corp.sanpaoloimi.com:8080
git fetch

set HTTP_PROXY=http://SPIMI\U368208:Intesa01@172.22.16.64:3128
set HTTPS_PROXY=https://SPIMI\U368208:Intesa01@172.22.16.64:3128
git fetch

set HTTP_PROXY=http://SPIMI\U368208:Intesa01@172.22.0.206:3128
set HTTPS_PROXY=https://SPIMI\U368208:Intesa01@172.22.0.206:3128
git fetch

REM }}}
