- Use JavaScript namespaced selectors as your API

    Yes

    ```
    <a href="#" class="js-clickable">Click Me</a>
    ```

    No

    ```
    <a href="#" class="myButton">Click Me</a>
    ```
>This creates a specific separation of concerns between styling and JavaScript
>API. Keeps others from accidentally breaking JavaScript code when refactoring
>styles.
