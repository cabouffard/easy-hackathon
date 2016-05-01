// Example webpack configuration with asset fingerprinting in production.
'use strict';

// NOTE(cab): Basic default stuff require for webpack to work
var path = require('path');
var webpack = require('webpack');
var StatsPlugin = require('stats-webpack-plugin');

// NOTE(cab): postcss shizzle
var precss       = require('precss');
var atImport = require('postcss-import');
var autoprefixer = require('autoprefixer');
var bemLinter = require('postcss-bem-linter');
var reporter = require('postcss-reporter');
var stylelint = require("stylelint")

// must match config.webpack.dev_server.port
var devServerPort = 3808;

// set TARGET=production on the environment to add asset fingerprints
var production = process.env.TARGET === 'production';

var config = {
  entry: {
    // Sources are expected to live in $app_root/webpack
    javascript: './javascripts/application.js',
    stylesheet: './stylesheets/application.css'
  },

  output: {
    // Build assets directly in to public/webpack/, let webpack know
    // that all webpacked assets start with webpack/

    // must match config.webpack.output_dir
    path: path.join(__dirname, '..', 'public', 'webpack'),
    publicPath: '/webpack/',

    filename: production ? '[name]-[chunkhash].js' : '[name].js'
  },

  resolve: {
    root: path.join(__dirname, '..', 'webpack')
  },

  module: {
    loaders: [
    {
      test:   /\.css$/,
      loader: "style-loader!css-loader!postcss-loader"
    }
    ]
  },
  postcss: function(webpack) {
    return [atImport({ addDependencyTo: webpack, plugins: [ stylelint ] }), precss, autoprefixer, reporter({ clearMessages: true })]
  },

  plugins: [
    // must match config.webpack.manifest_filename
    new StatsPlugin('manifest.json', {
      // We only need assetsByChunkName
      chunkModules: false,
      source: false,
      chunks: false,
      modules: false,
      assets: true
    }),
  ]
};

if (production) {
  config.plugins.push(
      new webpack.NoErrorsPlugin(),
      new webpack.optimize.UglifyJsPlugin({
        compressor: { warnings: false },
        sourceMap: false
      }),
      new webpack.DefinePlugin({
        'process.env': { NODE_ENV: JSON.stringify('production') }
      }),
      new webpack.optimize.DedupePlugin(),
      new webpack.optimize.OccurenceOrderPlugin()
      );
} else {
  config.devServer = {
    port: devServerPort,
    headers: { 'Access-Control-Allow-Origin': '*' },
  };
  config.output.publicPath = '//localhost:' + devServerPort + '/webpack/';
  // Source maps
  config.devtool = 'cheap-module-eval-source-map';
}

module.exports = config;
