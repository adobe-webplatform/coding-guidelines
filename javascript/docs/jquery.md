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

