#!/bin/bash

java -cp /opt/LanguageTool/LanguageTool-4.9.1-stable/languagetool-server.jar org.languagetool.server.HTTPServer --port 8081 --allow-origin "*" --public --config /opt/LanguageTool/config/server-config

