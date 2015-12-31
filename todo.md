* wordpress multi environment
 * http://wptavern.com/wordpress-multi-environment-config-work-seamlessly-between-development-staging-and-production-sites
 * https://github.com/studio24/wordpress-multi-env-config

or:

---

Hi there

What I'm doing now is using shell scripts (https://github.com/markbaindesign/mbd-wp-deploy-scripts) to export/import to the different environments, ignoring the wp-config file, and running another script to change the url in the DB. I've automated it locally to some extend via grunt tasks, but there's still the need to manually FTP back and forth, as well as ssh into the server to run the import/export scripts remotely. Keep meaning to look at rsync, though.

We're using https://github.com/vlucas/phpdotenv on one project, which seems to do the job, but haven't had time to try it on my other projects, but it's a definite "to-do".

My main tool for switching the URLs for the last 5 years or so is https://github.com/interconnectit/Search-Replace-DB. However, I think WP-CLI is the way forward, if you are on a UNIX-like system.

Happy to discuss this more, and learn from anything you discover!

Cheers

---

* pre-installed plugins
