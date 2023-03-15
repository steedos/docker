Steedos VS Code Server
===

## Getting Started

```
docker run -it --init -p 3000:3000 -v "$(pwd):/home/workspace/steedos-project:cached" steedos/vscode-server
```