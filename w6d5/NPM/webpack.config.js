module.exports = {
  entry: "./index.jsx",
  output: {
    filename: "./bundle.js"
  },
  devServer: {
    inline: true,
    port: 8080,
  },
  module: {
    loaders: [
      {
        test: [/\.jsx?$/, /\.js?$/],
        exclude: /(node_modules)/,
        loader: 'babel',
        query: {
          presets: ['es2015', 'react']
        }
      }
    ]
  },
  devtool: 'source-map',
  resolve: {
    extensions: ["",".js", ".jsx" ]
  }
};
