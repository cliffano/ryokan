alias dsa='docker stop $(docker ps -a -q)'
alias dra='docker rm $(docker ps -a -q)'
alias dia='docker rmi $(docker images -q --filter "dangling=true")'
alias dxt='docker exec -it'