#!/bin/bash

. /home/stainsbury/.environment

systools backup -d /home/stainsbury/ghost_content
systools backup -d /etc/letsencrypt
