#!/bin/bash
mkdir lsp-dev
cd lsp-dev

# git clone git@github.com:Microsoft/vscode-languageserver-node.git
git clone git@github.com:kieferrm/vscode-languageserver-node.git
cd vscode-languageserver-node
npm install
cd ..

# git clone git@github.com:Microsoft/vscode-extension-samples.git
git clone git@github.com:kieferrm/vscode-extension-samples.git
cd vscode-extension-samples/lsp-sample
npm install

# patch for compile issue with double resolved symbols (can be removed once we understand why it happens)
rm -rf client/node_modules/vscode

cd ../..


FOLDER=`pwd`
find ${FOLDER} -d -name vscode-languageclient -exec rm -rf {} \;
find ${FOLDER} -d -name vscode-jsonrpc -exec rm -rf {} \;
find ${FOLDER} -d -name vscode-languageserver -exec rm -rf {} \;
find ${FOLDER} -d -name vscode-languageserver-protocol -exec rm -rf {} \;
find ${FOLDER} -d -name vscode-languageserver-types -exec rm -rf {} \;

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