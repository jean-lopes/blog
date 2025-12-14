((nil . ((org-src-fontify-natively . t)
         (org-src-preserve-indentation . t)
         (org-html-validation-link . nil)
         (org-html-htmlize-output-type inline-css)
         (org-html-use-infojs . nil)
         (org-html-head-include-default-style . nil)
         (org-html-head-include-scripts . nil)
         (org-html-doctype . "html5")
         (org-publish-project-alist . (("blog"
                                        :base-directory "org/"
                                        :publishing-directory "docs/"
                                        :publishing-function org-html-publish-to-html
                                        :recursive t
                                        :with-toc t
                                        :section-numbers nil
                                        :with-author nil
                                        :with-date t
                                        :with-creator nil
                                        :time-stamp-file nil))))))
