// config/webpack/environment.js
const { environment } = require('@rails/webpacker');

// Bootstrap 4 has a dependency over jQuery & Popper.js:

const webpack = require('webpack');



// const webpack = require('webpack');
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
);

environment.plugins.append('Provide', new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery'
}));

module.exports = environment;
