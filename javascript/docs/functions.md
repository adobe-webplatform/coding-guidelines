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

