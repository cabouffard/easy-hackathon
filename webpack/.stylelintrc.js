var path = require('path');

module.exports = {
  "extends": "../node_modules/stylelint-config-standard",
  "plugins": [
    "stylelint-selector-bem-pattern"
  ],
  "rules": {
    // NOTE(cab): We use auto-prefixer, we shouldn't have to specify vendor
    // prefixes ourselves
    "at-rule-no-vendor-prefix": true,
    "value-no-vendor-prefix": true,
    "selector-no-vendor-prefix": true,
    "property-no-vendor-prefix": true,
    "media-feature-name-no-vendor-prefix": true,

    "selector-no-id": true,

    "property-unit-whitelist": {
      "font-size": ["em"],
      "/^animation/": ["s"]
    },

    "selector-bem-pattern": {
      "preset": "bem",
      "utilitySelectors": "^\.u-[a-z]+$",
      "componentName": "[a-z]+",
      "componentSelectors": function(componentName) {
        var word = '[a-za-z0-9]+(?:-[a-za-z0-9]+)*';
        var element = '(?:__' + word + ')?';
        var modifier = '(?:--' + word + '){0,2}';
        var attribute = '(?:\\[.+\\])?';
        return new RegExp('^\\.' + componentName + element + modifier + attribute + '$');
      }
    }
  }
}
