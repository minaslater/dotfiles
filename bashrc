
echo "setting up rbenv"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
echo "finished setting up rbenv"

export NVM_DIR="$HOME/.nvm"

. "/usr/local/opt/nvm/nvm.sh"
