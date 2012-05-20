#!/bin/bash

# TODO: use argument for site name

rsync -r --delete /home/wulff/jekyll/psyke.org/html/ /home/wulff/www/psyke.org/
