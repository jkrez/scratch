# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/johnkrzemien/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Slow pasting
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=1000

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-completions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



#
# Custom Settings by John Krzemien
#

# Load pyenv automatically by appending
# the following to ~/.zshrc:

eval "$(pyenv init -)"

#
# Fixed slow pasting: https://github.com/zsh-users/zsh-autosuggestions/issues/238
#
# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238

pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# kubectl source
source <(kubectl completion zsh)

# Dir: current working directory
# Trim long paths
prompt_dir() {
  prompt_segment blue black '%2~'
}

# Adding init for jenv
eval "$(jenv init -)"

# Adding java home to env -- Should be set by jenv
#export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
#export PATH=$JAVA_HOME/bin:$PATH

# intellij idea alias
alias idea='/Applications/IntelliJ\ IDEA\ CE.app/Contents/MacOS/idea'

# github branch spinoff alias
alias bs='~/scripts/branch_spin_off.sh'

# QOL
alias dev='cd ~/Snapchat/Dev'
export DEVSRC="/Users/john.krzemien/Snapchat/Dev"
alias godev='cd ~/Snapchat/Dev/go/src/github.sc-corp.net/Snapchat'
export GOSNAP="/Users/john.krzemien/Snapchat/Dev/go/src/github.sc-corp.net/Snapchat"


# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# java setup
export JAVA_HOME=`/usr/libexec/java_home`

# android / gradle / buck setup
export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export ANDROID_SDK=$ANDROID_HOME
export ANDROID_SDK_ROOT=$ANDROID_SDK
export ANDROID_NDK=$ANDROID_SDK/ndk-bundle
export ANDROID_NDK_HOME=$ANDROID_NDK
unset ANDROID_NDK_REPOSITORY
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_NDK

# appengine setup
export APPENGINE_HOME=~/Snapchat/Dev/appengine-java-sdk-1.9.72
export PATH=$PATH:$APPENGINE_HOME/bin/

# go support
export GOPATH=$HOME/Snapchat/Dev/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export PATH=/usr/local/opt/go/libexec/bin:$PATH

# duplex
export DUP=$GOPATH/src/github.sc-corp.net/Snapchat/duplex.git
export TRAN=$GOPATH/src/github.sc-corp.net/Snapchat/gateway_transport.git

# snap-token support
make-snaptoken() {
    curl -s \
    -H "SC-LCA-1: $(snapaccess jwt make everybodysayhodor | xargs echo -n)" \
    -d "userId=${1}&scope=https%3A%2F%2Fauth.snapchat.com%2Fsnap_token%2Fapi%2F${2}" \
    https://everybodysayhodor.appspot.com/snap_token/test/vendor | xargs echo -n
}

# mcs
alias kubeprod-f='cd $GOPATH/src/github.sc-corp.net/Snapchat/messaging-core-service/ && make context-prod && source /tmp/env_mcs_mcs_us-east-1_prod.txt && kubectl port-forward service/mcs 8888:4400 && cd -'
alias kubeprod-us='cd $GOPATH/src/github.sc-corp.net/Snapchat/messaging-core-service/ && make context-prod && source /tmp/env_mcs_mcs_us-east-1_prod.txt && cd -'
alias kubeprod-eu='cd $GOPATH/src/github.sc-corp.net/Snapchat/messaging-core-service/ && make context-prod REGION=eu-west-1 && source /tmp/env_mcs_1_eu-west-1_prod.txt && cd -'
alias kubeprod-ap='cd $GOPATH/src/github.sc-corp.net/Snapchat/messaging-core-service/ && make context-prod REGION=ap-southeast-1 && source /tmp/env_mcs_1_ap-southeast-1_prod.txt && cd -'

# mcs staging
alias kubebeta-us='cd $GOPATH/src/github.sc-corp.net/Snapchat/messaging-core-service/ && make context-beta && source /tmp/env_mcsstaging_aws-mcs-staging_us-east-1_staging.txt && cd -'
alias kubebeta-us2='cd $GOPATH/src/github.sc-corp.net/Snapchat/messaging-core-service/ && make context-beta REGION=us-west-2 && source /tmp/env_mcsstaging_1_us-west-2_staging.txt && cd -'
alias kubebeta-f='cd $GOPATH/src/github.sc-corp.net/Snapchat/messaging-core-service/ && make context-beta && source /tmp/env_mcsstaging_aws-mcs-staging_us-east-1_staging.txt && kubectl port-forward service/mcs 8888:4400 && cd -'
alias kubebeta-f2='cd $GOPATH/src/github.sc-corp.net/Snapchat/messaging-core-service/ && make context-beta REGION=us-west-2 && source /tmp/env_mcsstaging_1_us-west-2_staging.txt && kubectl port-forward service/mcs 8888:4400 && cd -'

# mcs logs
alias lv="grep '^{' | jq -C '.' | sed -e 's/\\\\n/\\n/g' | sed -e 's/\\\\t/\\t/g'"

#duplex
alias kubeprodd-us='cd $GOPATH/src/github.sc-corp.net/Snapchat/duplex.git/ && make context-prod && source /tmp/env_duplex_eks1_us-east-1_PROD.txt && cd -'
alias kubeprodd-eu='cd $GOPATH/src/github.sc-corp.net/Snapchat/duplex.git/ && make context-prod REGION=eu-west-1 && source /tmp/env_duplex_euwest1-01_eu-west-1_prod.txt && cd -'
alias kubeprodd-ap='cd $GOPATH/src/github.sc-corp.net/Snapchat/duplex.git/ && make context-prod REGION=ap-southeast-1 && source /tmp/env_duplex_apsoutheast1-01_ap-southeast-1_prod.txt && cd -'

# duplex staging
alias kubebetad-us='cd $GOPATH/src/github.sc-corp.net/Snapchat/duplex.git/ && make context-beta && source /tmp/env_duplex_04_us-east-1_staging.txt && cd -'
alias kubebetad-us2='cd $GOPATH/src/github.sc-corp.net/Snapchat/duplex.git/ && make context-beta REGION=us-west-2 && source /tmp/env_duplex_04_us-west-2_staging.txt && cd -'
alias kubebetad-f='cd $GOPATH/src/github.sc-corp.net/Snapchat/duplex.git/ && make context-beta && source /tmp/env_duplex_04_us-east-1_staging.txt && kubectl port-forward service/duplex 8888:9000 && cd -'
alias kubebetad-f2='cd $GOPATH/src/github.sc-corp.net/Snapchat/duplex.git/ && make context-beta REGION=us-west-2 && source /tmp/env_mcsstaging_1_us-west-2_staging.txt && kubectl port-forward service/mcs 8888:9000&& cd -'

# add gnu style command utils to path
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# add python path to cmdline (including aws cli)
export PATH="~/Library/Python/3.6/bin/:$PATH"

# security related
alias scr="snapaccess credentials refresh"

# add custom kubectl to path for amazon eks preview
export PATH=$HOME/bin:$PATH
#export AWS_PROFILE=snap-core-stage
#export KUBECONFIG=/Users/john.krzemien/.kube/config-messaging-eks-cluster
alias k=kubectl

# NVM support
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# tab completion
#[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# client c++ project export for build cache
export NDK_CCACHE=/usr/local/bin/ccache

# GoLand command line launcher
alias goland='/usr/local/bin/goland'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
hgrip(){
history | grep $1
}

#----- AWS -------

s3ls(){
aws s3 ls s3://$1
}

s3cp(){
aws s3 cp $2 s3://$1
}

#----- misc -----
certspotter(){
curl -s https://certspotter.com/api/v0/certs\?domain\=$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | sort -u | grep $1
} #h/t Michiel Prins

crtsh(){
curl -s https://crt.sh/?q=%.$1  | sed 's/<\/\?[^>]\+>//g' | grep $1
}

certnmap(){
curl https://certspotter.com/api/v0/certs\?domain\=$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | sort -u | grep $1  | nmap -T5 -Pn -sS -i - -$
} #h/t Jobert Abma

certbrute(){
cat $1.txt | while read line; do python3 dirsearch.py -e . -u "https://$line"; done
}

ipinfo(){
curl http://ipinfo.io/$1
}

#------ Tools ------
dirsearch(){
cd /tools/dirsearch*
python3 dirsearch.py -e . -u $1
}

sqlmap(){
cd /tools/sqlmap*
python sqlmap.py -u $1
}

knock(){
cd /home/tools/knock/knockpy
python knockpy.py -w list.txt $1
}

ncx(){
nc -l -n -vv -p $1 -k
}

# The next line updates PATH for the Google Cloud SDK.
#if [ -f '/Users/johnkrzemien/google-cloud-sdk/path.bash.inc' ]; then . '/Users/johnkrzemien/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
#if [ -f '/Users/johnkrzemien/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/johnkrzemien/google-cloud-sdk/#completion.bash.inc'; fi





alias k=kubectl
complete -F __start_kubectl k

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/johnkrzemien/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/johnkrzemien/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/johnkrzemien/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/johnkrzemien/google-cloud-sdk/completion.zsh.inc'; fi
