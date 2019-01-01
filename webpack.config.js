const path = require('path')

module.exports = {
    entry: './src/index.js',
    mode: 'development',
    module: {
        rules: [
            {
                test: /.html$/,
                exclude: [/node_modules/, /.psc-package/, /output/],
                loader: 'file-loader?name=[name].[ext]'
            },
            {
                test: /.purs$/,
                loader: 'purs-loader',
                exclude: [/node_modules/, /.psc-package/, /output/],
                query: {
                    bundle: true,
                    pscPackage: true,
                    watch: true
                }
            }
        ]
    },
    resolve: {
        extensions: ['.purs', '.js']
    },
    output: {
        filename: 'bundle.js',
        path: path.resolve(__dirname, './dist/')
    }
}