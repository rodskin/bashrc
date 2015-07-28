#Stop bash from caching duplicate lines.
HISTCONTROL=ignoredups

source ~/.bashrc_common

# Disk free in human terms
alias df='df -h'

# List paths
alias path='echo -e ${PATH//:/\\n}'

#Network
alias pingg='ping -c 4 www.google.com'
alias pingbox='ping -c 4 192.168.0.1'
alias wget='wget -c'
alias mac='ifconfig | grep HWaddr'
alias monip="curl -s http://checkip.dyndns.org | sed 's/[a-zA-Z<>/ :]//g'"

#-------------------
# Personnal Aliases
#-------------------
# equivalent sudo cygwin
alias fuck='cygstart --action=runas'
#ask for validation
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# -> Prevents accidentally clobbering files.
alias mkdir='mkdir -p'
alias git='LANG=en_US git'

# Add colors for filetype and  human-readable sizes by default on 'ls':
alias ls='ls -h --color'
alias ll='ls -alh --color=auto --group-directories-first'

# alias pour vi => vim
unalias vim
alias vi='vim'

#convert
alias imgk_recurve='convert -despeckle -despeckle -despeckle -linear-stretch 10x10%'
alias imgk_redress='convert -deskew 40'

#grep
alias grep='grep --exclude-dir=".svn" --color=auto'

alias mysql='mysql --show-warnings'

alias curdate='date +%Y%m%d%H%M%S'

alias htdocs='cd /cygdrive/c/xampp/htdocs'
alias downloads='cd /cygdrive/c/Users/francis/Downloads/'

alias pasync='git clone https://github.com/pa-de-solminihac/sitesync.git'

#ajout des acces ssh
source .bashrc_ssh

#ajout des fonctions perso
source .bashrc_functions

#clean svn and git folders
#alias cleansvn='echo '\''Supprimer tous les sous dossiers .svn ? (ctrl+c pour annuler)'\'' && read && find . -type d -name '\''\.svn'\'' -exec /bin/rm -rf {} \;'
alias cleansvn="echo 'Supprimer tous les sous dossiers .svn ? (ctrl+c pour annuler)' && read && find . -type d -name '\.svn' -exec /bin/rm -rf {} \;"
alias cleangit="echo 'Supprimer tous les sous dossiers .git ? (ctrl+c pour annuler)' && read && find . -type d -name '\.git' -exec /bin/rm -rf {} \;"
alias cleanmac="echo 'Supprimer tous les fichiers macOS ? (ctrl+c pour annuler)' && read && find . -name '*.DS_Store' -type f -exec /bin/rm -rf {} \;"

alias checkphp='find . -type f -name '*.php' -exec php -l '{}' \;'

alias d2ufolder='find // -type f -print0 | xargs -0 dos2unix'


#MODIFICATIONS DE FICHIERS
alias find_all_bom='find ./ -type f -name '\''*.php'\'' -exec echo {} \; -exec hexdump {} \| head -n 2 \; | grep -B 1 '\''^0000000'\'' | grep -v '\''3f3c'\'' | grep -B 1 '\''^000'\'' | grep -v '\''^000\|^--$'\'''
alias find_bad_encod='find ./ -type f -exec echo {} \; -exec enca -L none {} \; | grep -B 1 '\''Unrecognized encoding'\'' | grep -v '\''.svn-base'\'' | grep -v '\''Unrecognized encoding'\'' | grep -v '\''^--$'\'' | sort | uniq'
alias find_bom='find ./ -type f -name '\''*.php'\'' -exec echo {} \; -exec hexdump -n 4 -v -C {} \; | grep -B 1 '\''^0000000.*3c 3f'\'' | grep -v '\''^00000000 *\(3c 3f\|0d 0a\)'\'' | grep -B 1 '\''^000'\'' | grep -v '\''^000\|^--$'\'''
alias find_latin1='find ./ -type f -exec file -i {} \; | grep '\''charset'\'' | grep -v '\''\.svn\|us-ascii\|utf\|not-regular-file\|shockwave-flash\|image'\'' | sed '\''s/:.*//g'\'''
alias find_latin1_converti='find ./ -name '\''*_converti_from_iso_to_utf'\'' -exec file -i {} \; | grep '\''charset'\'' | grep -v '\''\.svn\|us-ascii\|iso-8859-1\|not-regular-file\|shockwave-flash\|image'\'' | sed '\''s/:.*//g'\'''
alias find_less_bom='find ./ -type f -name '\''*.php'\'' -exec echo {} \; -exec hexdump {} \| head -n 2 \; | grep -B 1 '\''^0000000'\'' | grep -v '\''3f3c\|683c\|213c\|483c\|2123'\'' | grep -B 1 '\''^000'\'' | grep -v '\''^000\|^--$'\'''
alias findbadnames='find . | iconv -f utf8 -t latin1 | tail -n 1 && echo'

########
# PROMPT
########
COLOR_NONE="\[\e[0m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
YELLOW="\[\033[0;33m\]"
LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
LIGHT_BLUE="\[\033[1;34m\]"
LIGHT_YELLOW="\[\033[1;33m\]"
WHITE="\[\033[1;37m\]"
LIGHT_GRAY="\[\033[0;37m\]"
GRAY="\[\033[01;30m\]"
# MODIF PA 2014-09-25 : better git-prompt (cf. http://www.git-attitude.fr/2013/05/22/prompt-git-qui-dechire/)
# MODIF PA 2014-07-17 : git completion et git-prompt (cf. http://stackoverflow.com/questions/10435117/ps1-env-variable-does-not-work-on-mac)
# MODIF PA : prompt avec mise en evidence de la valeur de retour (adapte de http://www.austinriba.com/2010/09/best-bash-prompt-ever/)
# MODIF PA : prompt avec integration GIT (cf. http://www.bramschoenmakers.nl/en/node/624)
# *: modified, +: added, %: untracked, u=: up to date
export GIT_PS1_SHOWDIRTYSTATE=1 GIT_PS1_SHOWSTASHSTATE=1 GIT_PS1_SHOWUNTRACKEDFILES=1 GIT_PS1_SHOWUPSTREAM=verbose GIT_PS1_DESCRIBE_STYLE=branch
########################################################
# COMMENTER OU DECOMMENTER LE BON SELON CYGWIN OU UNIX #
########################################################
#source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
source "/cygdrive/c/Program Files (x86)/Git/etc/git-prompt.sh"
#source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
source "/cygdrive/c/Program Files (x86)/Git/etc/git-completion.bash"
PS1="${debian_chroot:+($debian_chroot)}\n\`if [ \$? = 0 ]; then echo -e '${LIGHT_BLUE}'; else echo -e '${LIGHT_RED}'; fi\`\D{%d-%m_%H:%M }${GREEN}\u@\h:${LIGHT_GREEN}\w${LIGHT_YELLOW}\$(__git_ps1)${COLOR_NONE}\n${COLOR_NONE}\`if [ \$(whoami) = 'root' ]; then echo '#'; else echo '$'; fi\` "

