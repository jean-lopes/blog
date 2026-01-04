;; font sizes
;; (setq ratio 1.125
;;       base  1.75
;;       sizes (list (/ base ratio)
;;                   base
;;                   (* base ratio)
;;                   (* base ratio ratio)
;;                   (* base ratio ratio ratio)))

(defun disable-loaded-themes ()
  "Disable all enabled themes."
  (mapc 'disable-theme custom-enabled-themes))

;; (disable-loaded-themes)
;; (load-theme 'modus-operandi-tinted t)
;; (load-theme 'modus-vivendi-tinted t)

(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialize the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install dependencies
(package-install 'htmlize)

;; Load the publishing system
(require 'ox-publish)

(setq org-use-sub-superscripts '{}
      org-export-with-sub-superscripts '{}
      org-html-postamble t
      org-html-preamble-format '(("en" "<h1>%t</h1>"))
      org-html-postamble-format '(("en" "<p><small>%d</small></p>"))
      org-src-fontify-natively t
      org-html-html5-fancy t
      org-src-preserve-indentation nil
      org-html-validation-link nil
      org-html-htmlize-output-type 'css
      org-html-htmlize-font-prefix "org-"
      org-html-use-infojs nil
      org-html-head-include-default-style nil
      org-html-head-include-scripts nil
      org-html-doctype "html5"
      org-publish-project-alist  '(("posts"
                                    :base-directory "org/"
                                    :publishing-directory "docs/"
                                    :publishing-function org-html-publish-to-html
                                    :recursive t
                                    :with-toc nil
                                    :section-numbers nil
                                    :with-title nil
                                    :with-author nil
                                    :with-date nil
                                    :with-creator nil
                                    :time-stamp-file nil
                                    :auto-sitemap t
                                    :sitemap-filename "index.org"
                                    :html-head-extra "<link rel=\"stylesheet\" href=\"css/style.css\" />")
                                   ("attachments"
                                    :base-directory "org/"
                                    :base-extension "dockerfile\\|sql\\|avif\\|png\\|yml"
                                    :publishing-directory "docs/"
                                    :publishing-function org-publish-attachment
                                    :recursive t
                                    :with-toc nil
                                    :section-numbers nil
                                    :with-author nil
                                    :with-date nil
                                    :with-creator nil
                                    :time-stamp-file nil)
                                   ("static"
                                    :base-directory "static/"
                                    :base-extension ".*"
                                    :publishing-directory "docs/"
                                    :publishing-function org-publish-attachment
                                    :recursive t
                                    :with-toc nil
                                    :section-numbers nil
                                    :with-author nil
                                    :with-date nil
                                    :with-creator nil
                                    :time-stamp-file nil)
                                   ("blog"
                                    :components ("posts" "attachments" "static"))))

(org-publish-all t)

(message "Build complete.")
