{config, lib, ...}: {
  programs.firefox = {
    profiles."${config.home.username}" = {
      settings = with lib; {
        # Performance
        "browser.cache.disk.enable" = mkDefault true;
        "content.notify.interval" = mkDefault 100000; # 0.10s reflows instead of 0.12s
        "gfx.canvas.accelerated.cache-items" = mkDefault 4096; # more cache items (default 2048)
        "gfx.canvas.accelerated.cache-size" = mkDefault 512; # bigger cache size (default 256)
        "gfx.content.skia-font-cache-size" = mkDefault 20; # (default 5)
        "media.memory_cache_max_size" = mkDefault 65536; # larger media memory cache (default 8192)
        "media.cache_readahead_limit" = mkDefault 7200; # 120min (default 60min) read ahead for media 720p and below
        "media.cache_resume_threshold" = mkDefault 3600; # 60min (default 30min) resume after network suspension
        "image.mem.decode_bytes_at_a_time" = mkDefault 32768; # image decoder chunk size (default 16384)
        "network.http.max-connections" = mkDefault 1800; # (default 900)
        "network.http.max-persistent-connections-per-server" = mkDefault 10; # download connections (default 6)
        "network.http.max-urgent-start-excessive-connections-per-host" = mkDefault 5; # (default 3)
        "network.http.pacing.requests.enabled" = mkDefault false; # no pacing requests (adss delay between requests) (default true)
        "network.dnsCacheExpiration" = mkDefault 3600; # keep DNS entries for 1h
        "network.ssl_tokens_cache_capacity" = mkDefault 10240; # more TLS token caching (default 2048)
        "network.dns.disablePrefetch" = mkDefault true; # disable HTMLLinkElement DNS prefetches
        "network.dns.disablePrefetchFromHTTPS" = mkDefault true; # disable HTMLLinkElement DNS prefetches from HTTPS
        "network.prefetch-next" = mkDefault false; # disable link prefetches
        "network.predictor.enabled" = mkDefault false; # shut off Firefox's Network Predictor algorithm
        "layout.css.grid-template-masonry-value.enabled" = mkDefault true; # CSS Masonry Layout
        "dom.enable_web_task_scheduling" = mkDefault true; # Prioritized Task Scheduling API

        # Security
        "browser.contentblocking.category" = mkDefault "strict"; # Enhanced Tracking Protection
        "urlclassifier.trackingSkipURLs" = mkDefault "*.reddit.com, *.twitter.com, *.twimg.com, *.tiktok.com"; # allow embedded tweets, reddit posts, and tiktoks
        "urlclassifier.features.socialtracking.skipURLs" = mkDefault "*.instagram.com, *.twitter.com, *.twimg.com"; # allow embedded tweets and instagram posts
        "browser.download.start_downloads_in_tmp_dir" = mkDefault true; # download to tmp first
        "browser.helperApps.deleteTempFileOnExit" = mkDefault true; # remove from tmp after
        "browser.uitour.enabled" = mkDefault false; # disable UITour backend
        "privacy.globalprivacycontrol.enabled" = mkDefault true; # enable Global Privacy Control (GPC)
        "security.OCSP.enabled" = mkDefault 0; # disable OCSP fetching
        "security.remote_settings.crlite_filters.enabled" = mkDefault true; # CRLite more private than OCSP
        "security.pki.crlite_mode" = mkDefault 2; # enforce Revoked and Not Revoked results
        "security.ssl.treat_unsafe_negotiation_as_broken" = mkDefault true; # display warning on the padlock for "broken security"
        "browser.xul.error_pages.expert_bad_cert" = mkDefault true; # isplay advanced information on Insecure Connection warning pages
        "security.tls.enable_0rtt_data" = mkDefault false; #  disable 0-RTT (round-trip time) to improve TLS 1.3 security
        "browser.privatebrowsing.forceMediaMemoryCache" = mkDefault true; # set media cache in Private Browsing to in-memory
        "browser.sessionstore.interval" = mkDefault 60000; # minimum interval (in ms) between session save operations (default 15s)
        "browser.privatebrowsing.resetPBM.enabled" = mkDefault true; # purge session icon in Private Browsing windows
        "privacy.history.custom" = mkDefault true; # set History section to show all options
        "browser.urlbar.trimHttps" = mkDefault true; # to save some space since HTTPS is enforced anyways and HTTP is padlocked
        "browser.urlbar.untrimOnUserInteraction.featureGate" = mkDefault true; # same as above
        "security.insecure_connection_text.enabled" = mkDefault true; # display "Not Secure" text on HTTP sites
        "security.insecure_connection_text.pbmode.enabled" = mkDefault true; # same as above in private browsing
        "browser.search.separatePrivateDefault.ui.enabled" = mkDefault true; # separate search engine for Private Windows
        "browser.urlbar.update2.engineAliasRefresh" = mkDefault true; # enable option to add custom search engine
        "browser.search.suggest.enabled" = mkDefault false; # disable live search suggestions
        "browser.urlbar.quicksuggest.enabled" = mkDefault false; # disable Firefox Suggest
        "browser.urlbar.groupLabels.enabled" = mkDefault false; # hide Firefox Suggest label in URL dropdown box
        "browser.formfill.enable" = mkDefault false; # disable search and form history
        "network.IDN_show_punycode" = mkDefault true; # enforce Punycode for Internationalized Domain Names to eliminate possible spoofing
        "dom.security.https_first" = mkDefault true; # HTTPS-First Policy
        "signon.formlessCapture.enabled" = mkDefault false; # disable formless login capture for Password Manager
        "signon.privateBrowsingCapture.enabled" = mkDefault false; # disable capturing credentials in private browsing
        "network.auth.subresource-http-auth-allow" = mkDefault 1; # limit (or disable) HTTP authentication credentials dialogs triggered by sub-resources
        "editor.truncate_user_pastes" = mkDefault false; # prevent password truncation when submitting form data
        "security.mixed_content.block_display_content" = mkDefault true; # block insecure passive content (images) on HTTPS pages
        "pdfjs.enableScripting" = mkDefault false; # allow PDFs to load javascript
        "browser.tabs.searchclipboardfor.middleclick" = mkDefault false; # disable middle click on new tab button opening URLs or searches using clipboard
        "extensions.enabledScopes" = mkDefault 5; # limit allowed extension directories to profile and application
        "network.http.referer.XOriginTrimmingPolicy" = mkDefault 2; # control the amount of cross-origin information to send
        "privacy.userContext.ui.enabled" = mkDefault true; # enable Container Tabs and its UI setting
        "browser.safebrowsing.downloads.remote.enabled" = mkDefault false; # disable SB checks for downloads
        "permissions.default.desktop-notification" = mkDefault 2; # default permission for Web Notifications (block)
        "permissions.default.geo" = mkDefault 2; # default permission for Location Requests (block)
        "browser.search.update" = mkDefault false; # disable search engine updates
        "permissions.manager.defaultsUrl" = mkDefault ""; # remove special permissions for certain mozilla domains
        "datareporting.policy.dataSubmissionEnabled" = mkDefault false; # disable new data submission
        "datareporting.healthreport.uploadEnabled" = mkDefault false; # disable Health Reports
        # disable telemetry
        "toolkit.telemetry.unified" = mkDefault false;
        "toolkit.telemetry.enabled" = mkDefault false;
        "toolkit.telemetry.server" = mkDefault "data:,";
        "toolkit.telemetry.archive.enabled" = mkDefault false;
        "toolkit.telemetry.newProfilePing.enabled" = mkDefault false;
        "toolkit.telemetry.shutdownPingSender.enabled" = mkDefault false;
        "toolkit.telemetry.updatePing.enabled" = mkDefault false;
        "toolkit.telemetry.bhrPing.enabled" = mkDefault false; # Background Hang Reporter
        "toolkit.telemetry.firstShutdownPing.enabled" = mkDefault false;
        # disable Telemetry Coverage
        "toolkit.telemetry.coverage.opt-out" = mkDefault true;
        "toolkit.coverage.opt-out" = mkDefault true;
        "toolkit.coverage.endpoint.base" = mkDefault "";
        # disable Firefox Home telemetry
        "browser.newtabpage.activity-stream.feeds.telemetry" = mkDefault false;
        "browser.newtabpage.activity-stream.telemetry" = mkDefault false;
        "app.shield.optoutstudies.enabled" = mkDefault false; #  disable Studies
        "app.normandy.enabled" = mkDefault false; # disable Normandy/Shield
        "app.normandy.api_url" = mkDefault "";
        "breakpad.reportURL" = mkDefault ""; # disable crash reports
        "browser.tabs.crashReporting.sendReport" = mkDefault false;
        "captivedetect.canonicalURL" = mkDefault ""; # disable Captive Portal detection
        "network.captive-portal-service.enabled" = mkDefault false;
        "network.connectivity-service.enabled" = mkDefault false; # disable Network Connectivity checks

        # Remove pesky annoyances
        "browser.privatebrowsing.vpnpromourl" = mkDefault ""; # Mozilla VPN
        "extensions.getAddons.showPane" = mkDefault false; # disable about:addons' Recommendations pane
        "extensions.htmlaboutaddons.recommendations.enabled" = mkDefault false; # disable recommendations in about:addons' Extensions and Themes panes
        "browser.discovery.enabled" = mkDefault false; #disable Personalized Extension Recommendations in about:addons and AMO
        "browser.shell.checkDefaultBrowser" = mkDefault false; # disable Firefox from asking to set as the default browser
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = mkDefault false; # disable Extension Recommendations (addons)
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = mkDefault false; # disable Extension Recommendations (features)
        "browser.preferences.moreFromMozilla" = mkDefault false; # hide "More from Mozilla" in Settings
        "browser.aboutConfig.showWarning" = mkDefault false; # disable tab and about:config warnings
        "browser.aboutwelcome.enabled" = mkDefault false; #  disable welcome notices
        "browser.profiles.enabled" = mkDefault true; #  new profile switcher
        "toolkit.legacyUserProfileCustomizations.stylesheets" = mkDefault true; #  enable Firefox to use userChome, userContent, etc.
        "browser.compactmode.show" = mkDefault true; # add compact mode back to options
        "layout.css.prefers-color-scheme.content-override" = mkDefault 2; # preferred color scheme for websites
        "browser.privateWindowSeparation.enabled" = mkDefault false; #  prevent private windows being separate
        "cookiebanners.service.mode" = mkDefault 1; # reject cookie banners if it is a one-click option; keep otherwise
        "cookiebanners.service.mode.privateBrowsing" = mkDefault 1;
        "full-screen-api.transition-duration.enter" = mkDefault "0 0"; # remove fullscreen delay
        "full-screen-api.transition-duration.leave" = mkDefault "0 0";
        "full-screen-api.warning.timeout" = mkDefault 0; #  disable fullscreen notice
        "browser.urlbar.suggest.calculator" = mkDefault true; # URL bar suggestions for calculator
        "browser.urlbar.unitConversion.enabled" = mkDefault true; # URL bar suggestions for calculator
        "browser.urlbar.trending.featureGate" = mkDefault false; # disable urlbar trending search suggestions
        "browser.newtabpage.activity-stream.feeds.topsites" = mkDefault false; # Pinned Shortcuts on New Tab
        "browser.newtabpage.activity-stream.showWeather" = mkDefault false; # no weather lookup
        "browser.newtabpage.activity-stream.feeds.section.topstories" = mkDefault false; # recommended by Pocket
        "browser.newtabpage.activity-stream.showSponsored" = mkDefault false; # no sponsored stories
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = mkDefault false;
        "extensions.pocket.enabled" = mkDefault false; # disable pocket extension
        "browser.download.manager.addToRecentDocs" = mkDefault false; # disable adding downloads to the system's "recent documents" list
        "browser.download.open_pdf_attachments_inline" = mkDefault true; # open PDFs inline
        "browser.bookmarks.openInTabClosesMenu" = mkDefault false; # leave Bookmarks Menu open when selecting a site
        "browser.menu.showViewImageInfo" = mkDefault true; # restore "View image info" on right-click
        "findbar.highlightAll" = mkDefault true; # show all matches in Findbar
        "layout.word_select.eat_space_to_next_word" = mkDefault false; # do not select the space next to a word when selecting a word
      };
    };
  };
}
