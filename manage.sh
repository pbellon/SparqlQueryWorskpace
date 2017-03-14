#!/usr/bin/env zsh

PROMPT=${PROMPT:="(SparqlWorkspace)"}
VENV_DIR=${VENV_DIR:=venv}

install(){
  if [ ! -d $VENV_DIR ]; then
    virtualenv --system-site-packages --prompt=$PROMPT $VENV_DIR
  fi
  __exec pip install -r requirements.txt
}

__exec(){
  ./${VENV_DIR}/bin/$@
}

query(){
  query=${1:="example.sparql"}
  endpoint=${2:="http://data.persee.fr/sparql"}
  format=${3:=CSV}
  __exec asq -f $format -e $endpoint -q $query --debug
}


help(){
  echo -e "Available commands:\n\n\t- \e[1minstall\n\t\t\e[21mInstalls the dependencies of the workspace\n\n\t- \e[1mquery \e[21m\e[93mFILENAME ENDPOINT FORMAT\n\t\t\e[39mExecute the given sparql FILENAME on the Sparql\n\t\tENDPOINT and outputs the result with the given\n\t\tFORMAT (default = CSV)"
}

if [[ "$(type -w $@)" =~ .*function ]];
then
  eval $(printf "%q " "$@")
fi
