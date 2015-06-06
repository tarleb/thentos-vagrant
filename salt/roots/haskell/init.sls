haskell:
  pkg.installed:
    - pkgs:
      - ghc
      - cabal-install
    - fromrepo: sid
    - refresh: True
    - requires:
      - pkg: apt-sources

cabal update:
  cmd.run:
    - user: vagrant
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
