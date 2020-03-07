---
layout: post
title: "A tiny script to make a new Jekyll post"
date: 2020-03-07
---

In order to make it just a _little_ bit easier to make blog posts on my blog, I made a tiny little script to generate the front matter and dates for Jekyll posts.

Here it is:

```bash
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
```