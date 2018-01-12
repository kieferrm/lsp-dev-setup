[setup-lsp-dev.sh](https://github.com/kieferrm/lsp-dev-setup/blob/master/setup-lsp-dev.sh) helps you to setup an experimentation environment for the [Language Server Protocol](https://microsoft.github.io/language-server-protocol). The [LSP Client](https://github.com/kieferrm/vscode-extension-samples/tree/master/lsp-sample/client) and the [LSP server](https://github.com/kieferrm/vscode-extension-samples/tree/master/lsp-sample/server) are built using the `VS Code LSP SDK for node.js` and are bundled as a VS Code extension. The SDK comprises 5 different npm modules. To experiment with protocol modifications it is helpful to have these npm modules in source.

Execute [setup-lsp-dev.sh](https://github.com/kieferrm/lsp-dev-setup/blob/master/setup-lsp-dev.sh) from the folder in which you want the environment to be set up. The script creates a `lsp-dev` folder with the environment.

[insiders-lsp-dev.sh](https://github.com/kieferrm/lsp-dev-setup/blob/master/insiders-lsp-dev.sh) opens two VS Code insider windows. One for the LSP client and server, and one for the SDK.

See https://github.com/kieferrm/vscode-extension-samples/blob/master/lsp-sample/README.md for where to go from here.

### File layout
```
vscode-languageserver-node
node_modules
   vscode-languageclient -> ../vscode-languageserver-node/client
   vscode-languageserver -> ../vscode-languageserver-node/server
   vscode-languageserver-protocol -> ../vscode-languageserver-node/protocol
   vscode-languageserver-types -> ../vscode-languageserver-node/types
   vscode-jsonrpc -> ../vscode-languageserver-node/jsonrpc
vscode-extension-samples
   lsp-sample
      client
      server
```
There are no `vscode-languageclient`, `vscode-languageserver`, `vscode-languageserver-protocol`, `vscode-languageserver-types` or `vscode-jsonrpc` packages in any `node_modules` folder in `vscode-languageserver-node` or `vscode-extension-samples/lsp-sample`.
