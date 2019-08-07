// config/webpack/environment.js
const { environment } = require('@rails/webpacker');

// Bootstrap 4 has a dependency over jQuery & Popper.js:

const webpack = require('webpack');
environment.plugins.append('Provide', new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery'
}));

module.exports = environment;
