;;; init-blog.el --- -*- lexical-binding: t -*-

(use-package org-static-blog
  :custom
  (org-static-blog-publish-title fiery-blog-title)
  (org-static-blog-publish-url fiery-blog-url)
  (org-static-blog-publish-directory fiery-blog-directory)
  (org-static-blog-posts-directory (concat fiery-blog-directory "posts/"))
  (org-static-blog-drafts-directory (concat fiery-blog-directory "drafts/"))
  (org-static-blog-enable-tags t)
  (org-static-blog-use-preview t)
  (org-export-with-toc nil)
  (org-export-with-section-numbers nil)
  (org-static-blog-page-header
   "<meta name=\"author\" content=\"fieryzig\">
<meta name=\"referrer\" content=\"no-referrer\">
<link href=\"static/style.css\" rel=\"stylesheet\" type=\"text/css\" />
")
  (org-static-blog-page-preamble
   "<div class=\"header\">
<h1 class=\"title\"><a href=\"https://fieryzig.github.io\">fieryzig</a></h1>
<p class=\"text-muted\">fieryzig's blog</p>
<ul class=\"list-inline\">
<li class=\"list-inline-item\"><a href=\"https://fieryzig.github.io\">About</a></li>
</ul>
</div>")
  (org-static-blog-page-postamble ""))


(provide 'init-blog)