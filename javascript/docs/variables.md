- Declare variables at the top of scope

    Yes

    ```
    var holler = function holler() {
        var shotCaller = "Tom",
            words = "Cool story bro.";

        console.log(shotCaller, "says", words);
    }

    ```

    No

    ```
    var holler = function holler() {
        var shotCaller = "Tom";

        console.log(shotCaller, "says", words);

        var words = "Cool story bro.";
    }

    ```

>Contrived example is contrived

- Declare empty variables as the last entry in your single var declarations

    Yes

    ```
    var foo = "Foo",
        bar = "Bar",
        baz;
    ```

    No

    ```
    var foo = "Foo",
        baz,
        bar = "Bar";
    ```
