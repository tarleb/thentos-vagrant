haskell:
  pkg.installed:
    - pkgs:
      - ghc
      - cabal-install
    - fromrepo: sid
    - refresh: True
    - requires:
      - pkg: apt-sources

zlib:
  pkg.installed:
    - pkgs:
      - zlib1g
      - zlib1g-dev

pcre:
  pkg.installed:
    - pkgs:
      - libpcre3
      - libpcre3-dev

happy:
  pkg.installed

cabal update:
  cmd.run:
    - user: vagrant
    # Don't update if the last update was within the last 10 days
    - unless: test -z "$(find ~vagrant/.cabal/packages/hackage.haskell.org/ -mtime +10 -name 00-index.\*)"
    - requires:
      - pkg: haskell

/etc/apt/preferences.d/haskell:
  file.managed:
    - source: salt://haskell/files/haskell.preferences
    - user: root
    - group: root
    - mode: 644
    - required_in:
      - pkg: haskell
