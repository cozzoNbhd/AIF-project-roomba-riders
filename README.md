1) Eseguire comando “docker build .  -t aif” per buildare il docker utilizzando il docker file della repository
2) Eseguire comando “docker run -it aif”. Ora sei nel container.
3) Andare su Visual Studio code e collegarsi con l’estensione dev container
4) Una volta su /app, eseguire comando “pyenv install 3.8”. Questo scaricherà python nel container
5) Eseguire pyenv global 3.8
6) Eseguire python -m venv minihack
7) Eseguire source minihack/bin/activate
8) pip install nle minihack matplotlib notebook pyswip
9) Eseguire apt update
10) Installare ssh eseguendo apt install -y openssh-client
