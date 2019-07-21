export LANG=ja_JP.UTF-8
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_171.jdk/Contents/Home
export ANDROID_HOME=/Users/ryomashindo/Library/Android/sdk
# 色
export LSCOLORS=gxfxcxdxbxegedabagacag
export LS_COLORS='di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;46'

export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/

# Repro
export TOOLBOX_HOME="$HOME/src/github.com/reproio/sdk-toolbox"

export AWS_DEFAULT_PROFILE=default

export PATH="$TOOLBOX_HOME/bin:$PATH"
export PATH=/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc:$PATH
export PATH=/user/local:$PATH
export PATH=/user/local/bin:$PATH
export PATH="$HOME/.yarn/bin:$PATH"
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH" 

eval "$(rbenv init - zsh)"

########################################
# peco
#pecoでhistory検索
function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# path検索　コマンドなしの場合はそのままvimで開く
function peco-file() {
    local filepath=$(ag -l | peco --prompt 'PATH >')
    if [ -n "$filepath" ]; then
        if [ -n "$BUFFER" ]; then
            BUFFER="$BUFFER $(echo $filepath | tr '\n' ' ')"
            CURSOR=$#BUFFER
        else
            if [ -f "$filepath" ]; then
                BUFFER="vim $filepath"
                zle accept-line
            fi
        fi
    fi
}
zle -N peco-file
bindkey '^v' peco-file

if [ -f ~/.zshrc ]; then
  . ~/.zshrc
fi
