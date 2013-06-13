- Use namespaced selectors for your JavaScript API

    Yes

    ```
    <a href="#" class="submit-button js-submit">Submit</a>
    ```

    No

    ```
    <a href="#" class="submit-button">Submit</a>
    ```
>This creates a specific separation of concerns between styling and JavaScript
>API. Keeps others from accidentally breaking JavaScript code when refactoring
>styles.
