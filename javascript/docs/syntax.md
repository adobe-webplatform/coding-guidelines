- Use camel case

    Yes

    ```
    var goodVariable = 'Good';
    ```


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
        console.log('WAT');
    }
    ```

    No

    ```
    if (![] + [] == 'false')
    {
        console.log('WAT');
    }
    ```
