#!/bin/sh


git config --global alias.s "status -sb"
git config --global alias.l "log --oneline --decorate"
git config --global alias.g "log --oneline --decorate --graph"
git config --global alias.b "branch"
git config --global alias.snapshot "!snapshot() { COMMENT=wip; if [ \"\$*\" ]; then  COMMENT=\"\$*\"; fi; git add -A; git commit -m \"\$COMMENT\"; }; snapshot"
git config --global alias.backup "!backup() { git snapshot \"\$*\"; git push; }; backup"
git config --global alias.create-file "!createFile() { for name in \"\$@\"; do echo \$name>\$name.txt; done; }; createFile"
git config --global alias.simple-commit "!simpleCommit() { for name in \"\$@\"; do git create-file \"\$name\"; git snapshot \$name; done; }; simpleCommit"
git config --global alias.simple-loop "!simpleLoop() { NAME=\$1; i="1"; while [ \$i -le \$2 ]; do git simple-commit \$NAME\$i; i=\$[\$i+1]; done; }; simpleLoop"
git config --global alias.multi-commit "!multiCommit() { for name in \"\$@\"; do git create-file $name; done; git snapshot \"\$*\"; }; multiCommit"
git config --global alias.empty-commit "!emptyCommit() { git commit --allow-empty -m \"Empty commit\"; }; emptyCommit"
git config --global alias.empty-init "!emptyInit() { git init ; git commit --allow-empty -m \"Initial empty commit\"; }; emptyInit"




