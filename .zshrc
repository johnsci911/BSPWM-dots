# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/jkcachero/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="agnoster"
ZSH_THEME="pi"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

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

laranew() {
    while getopts v:p: flag

    do
        case "${flag}" in
            v) version=${OPTARG};;
            p) project=${OPTARG};;
        esac
    done

    if [[ ! $version && ! $project ]]; then
        echo "Please add the following arguments -v for version, -p for project name."
        echo "Should have at least -p project argument"
    fi

    if [[ $version && ! $project ]]; then
        echo "Missing argument -p project"
    fi

    if [[ ! $version && $project ]]; then
        laravel new $project
    fi

    if [[ $version && $project ]]; then
        composer create-project laravel/laravel="$version" $project
    fi
}

alias zshconfig="sudo vim ~/.zshrc"
alias ohmyzsh="sudo vim ~/.oh-my-zsh"

alias www="cd $HOME/Documents/www"
alias composer7="/usr/bin/php7 /usr/local/bin/composer"
alias code="/snap/bin/code"
alias laratest="composer dump-autoload;php artisan route:cache;vendor/bin/phpunit"
alias paratest="composer dump-autoload;php artisan route:cache;vendor/bin/paratest"
alias art="php artisan"
alias cypress="yarn run cypress open"
alias phpunit="vendor/bin/phpunit"
alias v="nvim"
alias hosts="sudo nvim /etc/hosts"
alias server-up="cd $HOME/Documents/www/laradock;docker-compose up -d nginx apache2 mysql phpmyadmin"
alias server-build="cd $HOME/Documents/www/laradock;docker-compose up -d nginx apache2 mysql phpmyadmin --build"
alias server-down="cd $HOME/Documents/www/laradock;docker-compose down"
alias server-stop="cd $HOME/Documents/www/laradock;docker-compose stop"
alias laradock="cd $HOME/www/laradock"

export SPICETIFY_INSTALL="/home/jkcachero/spicetify-cli"
export PATH="$SPICETIFY_INSTALL:$PATH"
export PATH=$PATH:~/.config/composer/vendor/bin
