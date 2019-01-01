const path = require('path')

module.exports = {
    entry: './src/index.js',
    mode: 'development',
    module: {
        rules: []
    },
    resolve: {
        extensions: ['.js']
    },
    output: {
        filename: 'bundle.js',
        path: path.resolve(__dirname, './dist/')
    }
}