require.config({
  baseUrl: '/vendor/',
  paths: {
    "src": "../src"
  },
});
require([
  'cs!src/app',
  'less!src/style'
], function(App){
    window.app = new App();
});
