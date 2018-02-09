#!/bin/bash

mkdir lsp-dev
cd lsp-dev

# git clone git@github.com:Microsoft/vscode-languageserver-node.git
git clone https://github.com/kieferrm/vscode-languageserver-node.git
cd vscode-languageserver-node
git checkout test271
npm install
cd ..

# git clone git@github.com:Microsoft/vscode-extension-samples.git
git clone https://github.com/kieferrm/vscode-extension-samples.git
cd vscode-extension-samples/lsp-sample
git checkout test271
npm install
cd ../..


# patch vscode.d.ts to use regular modules rather than global definitions
SCRIPTDIR=`dirname $0`
cp -f ../${SCRIPTDIR}/vscode-definitions/1.18/vscode.d.ts vscode-languageserver-node/client/node_modules/vscode 
cp -f ../${SCRIPTDIR}/vscode-definitions/1.16/vscode.d.ts vscode-extension-samples/lsp-sample/client/node_modules/vscode


FOLDER=`pwd`
find ${FOLDER} -depth -name vscode-languageclient -exec rm -rf {} \;
find ${FOLDER} -depth -name vscode-jsonrpc -exec rm -rf {} \;
find ${FOLDER} -depth -name vscode-languageserver -exec rm -rf {} \;
find ${FOLDER} -depth -name vscode-languageserver-protocol -exec rm -rf {} \;
find ${FOLDER} -depth -name vscode-languageserver-types -exec rm -rf {} \;

mkdir node_modules
cd node_modules
ln -s ../vscode-languageserver-node/client vscode-languageclient
ln -s ../vscode-languageserver-node/jsonrpc vscode-jsonrpc
ln -s ../vscode-languageserver-node/server vscode-languageserver
ln -s ../vscode-languageserver-node/protocol vscode-languageserver-protocol
ln -s ../vscode-languageserver-node/types vscode-languageserver-types
cd ..

cd vscode-languageserver-node
npm run compile
cd ..

cd vscode-extension-samples/lsp-sample
npm run compile
cd ../..