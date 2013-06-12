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
