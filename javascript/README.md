# JavaScript Coding Guidelines 

> Adobe Web Platform Javascript Coding Guidelines

## Jump to Section

* [JSLint](#jslint)
* [Globals](#globals)
* [Primitives](#primitives)
* [Whitespace](#whitespace)
* [Semicolons](#semicolons)
* [Quotes](#quotes)
* [Commas](#commas)
* [Syntax](#syntax)
* [Functions](#functions)
* [Modules](#modules)
* [jQuery](#jquery)

## JSLint
[[Back To Top]](#javascript-coding-guidelines)

- All code must pass these JSLint settings

    `/*jslint vars: true, plusplus: true, devel: true, nomen: true, indent: 4, maxerr: 50 */`

    `/*global define */`



## Globals
[[Back To Top]](#javascript-coding-guidelines)

- Do not introduce global variables

>See modules. Any variable not defined inside function or module scope will be
>attached to the global window object. Polluting the global scope breaks
>encapsulation.

- Browser globals should be referenced via the `window` object

  Yes

  ```
  window.setTimeout();
  ```

  No

  ```
  setTimeout();
  ```


## Primitives
[[Back To Top]](#javascript-coding-guidelines)

- Use literal syntax for creation of primitives

    Yes

    ```
    var myObject = {};
    ```

    No

    ```
    var myObject = new Object();
    ```

    Yes

    ```
    var myArray = [];
    ```

    No

    ```
    var myArray = new Array();
    ```



## Whitespace
[[Back To Top]](#javascript-coding-guidelines)

- Use soft tabs of 4 Spaces

    Yes

    ```
    var boom = function () {
    ....return "BOOM!";
    }
    ```

    No

    ```
    var boom = function () {
    ....return "BOOM!";
    }
    ```

- Place one space before leading brace

    Yes

    ```
    function boom() {
        console.log('BOOM!');
    }
    ```

    No

    ```
    function boom(){
        console.log('BOOM!');
    }
    ```




## Semicolons
[[Back To Top]](#javascript-coding-guidelines)

- Use semicolons

    Yes

    ```
    var semicolons = 'YES!';

    var add = function add(a, b) {
        return a + b;
    };
    ```

    No

    ```
    var semicolons = 'Never?'
    ```



## Quotes
[[Back To Top]](#javascript-coding-guidelines)

- Always use single quotes in JaveScript

    Yes

    ```
    var greeting = 'Sup';
    var htmlCode = '<div class="container"></div>';
    ```

    No

    ```
    var poorExample = "Nope";
    var annoyingEscapedhtmlCode = "<div class=\"container\">Why</div>";
    ```


## Commas
[[Back To Top]](#javascript-coding-guidelines)

- Commas go at the end of the line

  Yes

  ```
  var garth = {
    party: 'on',
    friend: 'wayne',
    lady: 'foxy'
  };
  ```

  No

  ```
  var garth = {
      party: 'on'
    , friend: 'wayne'
    , lady: 'foxy'
  };
  ```


## Syntax
[[Back To Top]](#javascript-coding-guidelines)

- Use camel case

  Yes

  ```
  var goodVariable = 'Good';
  ``

  No

  ```
  var bad_variable = 'Bad';
  ```

- Prefix private variables with an underscore

  Yes

  ```
  var _privateFunc = function _privateFunc() {
    return 42;
  }
  ```

  No

  ```
  var privateVar = 42;
  ```

- Use same line opening bracket

  Yes

  ```
  var goodFunction = function goodFunction() {
    return 'Good';
  }
  ```

  No

  ```
  var badFunction = function badFunction()
  {
    return 'Nope';
  }
  ```

  Yes

  ```
  if (typeof NaN == 'number') {
    return 'WAT';
  }
  ```

  No

  ```
  if (![] + [] == 'false')
  {
    return 'WAT';
  }
  ```


## Functions
[[Back To Top]](#javascript-coding-guidelines)

- Anonymous functions

    Yes

  	```
  	var anonymous = function () {
  	    return 'Guess who?';
  	}
  	```

  	No

  	```
  	var anonymous = function() {
  	    return 'Guess who?';
  	}
  	```

- Named functions

    Yes

    ```
    var named = function named() {
        return 'Jimmy';
    }
    ```

    No

    ```
    var named = function named () {
        return 'Jimmy';
    }
    ```
>Named functions aid in debugging by having a name displayed in the debugger

- Immediately invoked functions

    Yes

    ```
    (function () {
        console.log('IIFE');
    }());
    ```

    No

    ```
    (function() {
        console.log('IIEFFED');
    })();
    ```

    No

    ```
    !function() {
        console.log('IIEFFED');
    }();
    ```

    No

    ```
    ;function() {
        console.log('EFFED');
    }()
    ```



## Modules
[[Back To Top]](#javascript-coding-guidelines)

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


## jQuery
[[Back To Top]](#javascript-coding-guidelines)

- Prefix all jQuery variables with a `$`

  Yes

  ```
  var $sidebar = $('.js-sidebar');
  ```
>This also explicitly adds a js specific class as the JavaScript API.
>This keeps the API from breaking if someone else edits the sidebar css classes

  No

  ```
  var sidebar = $('.sidebar');
  ```

- API Considerations

    Prefer native methods over jQuery methods

    Yes

    ```
    var myArray = [1, 2, 3, 4];
    myArray.forEach(function (value, index) {
        // ...
    }
    ```

    No

    ```
    var myArray = [1, 2, 3, 4];
    $.each(myArray, function (index, value) {
        // Use forEach
    }
    ```


