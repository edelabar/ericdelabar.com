#! /bin/bash
jekyll build && git add -A . && git commit -m "Generated site" && git push dreamhost master