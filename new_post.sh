#!/bin/bash

# usage: ./new_post.sh Title of New Post

TITLE="$@"

SNAKE_TITLE=${TITLE// /_}

DATE=`date +%Y-%m-%d`

POST_FILENAME="_posts/${DATE}-${SNAKE_TITLE}.md"

cat << EOF >> $POST_FILENAME
---
layout: post
title: "${TITLE}"
date: ${DATE}
---
EOF

$EDITOR $POST_FILENAME
