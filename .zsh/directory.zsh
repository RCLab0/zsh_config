# cd した際に pushd コマンドも同時に実行するような振る舞い
# cd - [tab] で terminal 起動から移動したディレクトリを一望でき、対応する数字を入力することですぐに移動できる
setopt autopushd

# pushd (directory stack) に同じ directory を重複させない
setopt pushdignoredups
