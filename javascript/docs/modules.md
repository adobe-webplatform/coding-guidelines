- JavaScript files should define a single module

    Require.js Style

    ```
    define(function (require, exports, module) {
        var Module = require('Module');

        var function = someFunction () {
            // ...
        }

        // Export public API
        export.someFunction = someFunction;

    });
    ```

    Return a Class

    ```
    define(function (require, exports, module) {

        var MainView = Backbone.View.extend({
            // ...
        });

        return MainView;

    });
    ```

    Browser only module

    ```
    (function (global) {
        // ...
    }(this));
    ```

>See Functions
