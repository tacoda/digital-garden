#!/usr/bin/env bash

# python -m venv venv
source venv/bin/activate
python -m http.server --directory build/html 8081
