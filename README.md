# PSWebpackProjectScaffold
An example demonstrating how
[Webpack](https://webpack.js.org/)
is used to automatically bundle
[PureScript](http://www.purescript.org/)
together with *index.html* into a *dist*-folder.

A small demonstration of
[PureScript FFI](https://github.com/purescript/documentation/blob/master/guides/FFI.md)
is demonstrated as well.

## Instructions
1. After cloning, install with command:
    ```
    npm install
    ```
    *This will also automatically install PureScript dependencies.*

1. Start automated build process with command:
    ```
    npm run build
    ```
    In addition you may optionally start automated testing process with command:
    ```
    npm test
    ```

1. Start development server with command:
    ```
    npm run server
    ```
1. Start PureScript [read-eval-print-loop](https://en.wikipedia.org/wiki/Read–eval–print_loop) (REPL) with command:
    ```
    npm run repl
    ```