{**
 * head.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2000-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Common site header.
 *}
 
<script src="https://cdn.jsdelivr.net/npm/cookieconsent@3/build/cookieconsent.min.js" data-cfasync="false"></script>
<script>
window.cookieconsent.initialise({
  "palette": {
    "popup": {
      "background": "#eaf7f7",
      "text": "#5c7291"
    },
    "button": {
      "background": "#d83b5b"
    }
  },
  "theme": "classic",
  "type": "opt-out",
  "content": {
    "href": "https://ejournal.stipwunaraha.ac.id/index.php/ISLE/pages/view/Cookies"
  }
});
</script>

<!-- Cookies Policy style sheet -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/cookieconsent@3/build/cookieconsent.min.css" />

<!-- Add View Port -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Add Favicon -->
<link rel="icon" type="img/ico" href="{$baseUrl}/favicon.ico" />

<!-- Add fonts style sheet -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="{$baseUrl}/plugins/themes/stipwunaraha/css/typography.css" type="text/css" />

<!-- Add theme style sheet -->
<link rel="stylesheet" href="{$baseUrl}/plugins/themes/stipwunaraha/css/stipwunaraha.modern.css" type="text/css" />
<link rel="stylesheet" href="{$baseUrl}/plugins/themes/stipwunaraha/css/stipwunaraha.style.css" type="text/css" />
<link rel="stylesheet" href="{$baseUrl}/plugins/themes/stipwunaraha/css/stipwunaraha.theme.css" type="text/css" />

<!-- Collaboration style sheet -->
<!-- <link rel="stylesheet" href="{$baseUrl}/plugins/themes/stipwunaraha/css/article-screen.css" type="text/css" /> -->

<!-- Common style sheet -->
<link rel="stylesheet" href="{$baseUrl}/plugins/themes/stipwunaraha/css/print.css" media="print" type="text/css" />
<link rel="stylesheet" href="{$baseUrl}/plugins/themes/stipwunaraha/css/summary.css" type="text/css" />
<link rel="stylesheet" href="{$baseUrl}/plugins/themes/stipwunaraha/css/externalFeed.css" type="text/css" />
