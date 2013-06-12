Brackets uses some specific coding conventions. All of the pull requests that come in should adhere to the following rules:

## Basics ##
* Use 4 space indents (spaces, not tabs)

* All JavaScript files have a single module definition using the following format:

```javascript
define(function (require, exports, module) {

    // Load dependent modules
    var Module = require("Module");

    function someFunction() {
        // ...
    }

    // Export public APIs
    exports.someFunction = someFunction;
});
```

* Must pass JSLint. The default settings for JSLint are:

```
/*jslint vars: true, plusplus: true, devel: true, nomen: true, indent: 4, maxerr: 50 */
/*global define */
```

(With one wrinkle: JSLint warns about lines consisting entirely of whitespace, but we ignore those warnings. The JSLint feature built into Brackets filters out these warnings automatically).


### Globals ###

Globals should be limited to those defined by thirdparty libraries (e.g. jquery ``$``, RequireJS ``require``, CodeMirror ``CodeMirror``, etc.). Browser globals should be referenced via the ``window`` object, e.g. ``window.setTimeout()`` instead of ``setTimeout()``.

## Naming and Syntax ##
Variable and function names use camelCase (not under_scores):
> Do this:
>
> ```
> var editorHolder; 
> function getText();
> ```
>
> Not this:
>
> ```
> var editor_holder; // Don't use underscore!
> function get_text(); // Don't use underscore!
> ```

<br/>
Use $ prefixes on variables referring to jQuery objects:
> Do this:
>
> ```
> var $sidebar = $("#sidebar");
> ```
>
> Not this:
>
> ```
> var sidebar = $("#sidebar"); // Use '$' to prefix variables referring to jQuery objects
> ```

<br/>
Use _ prefixes on private variables/methods:
> Do this:
>
> ```
> var _privateVar = 42;
> function _privateFunction() 
> ```
>
> Not this:
>
> ```
> var privateVar = 42; // Private vars should start with _
> function privateFunction() // Private functions should start with _
> ```

<br/>
Classes and id's in HTML use all lower-case with dashes (-), not camelCase or under_scores:
> Do this:
>
> ```
> <div id="search-results">
> <span class="title-wrapper">
> ```
>
> Not this:
>
> ```
> <div id="searchResults">  // Don't use camel-case for ids
> <span class="title_wrapper"> // Don't use underscore
> ```

<br/>
Use semicolons:
> Do this:
>
> ```
> var someVar;
> someVar = 2 + 2;
> ```
>
> Not this:
>
> ```
> var someVar   // Missing semicolon!
> someVar = 2 + 2   // Missing semicolon!
> ```

<br/>
Use double quotes in JavaScript. If a JavaScript string literal _contains_ code within it, use single quotes within the string to avoid escaping.
> Do this:
>
> ```
> var aString = "Hello";
> someFunction("This is awesome!");
>
> var htmlCode = "<div id='some-id' class='some-class'></div>";
> ```
>
> Not this:
>
> ```
> var aString = 'Hello'; // Use double quotes!
> someFunction('This is awesome!'); // Use double quotes!
>
> var htmlCode = '<div id="some-id" class="some-class"></div>'; // Use double quotes!
> var htmlCode = "<div id=\"some-id\" class=\"some-class\"></div>"; // Within string, use single quotes!
> ```


## Code Structure ##
Prototypal inheritance pattern:
> ```
> function MyClass() { // constructor
>     Parent.call(this); // if this is a subclass
>     // ...
> }
>
> // the following are only necessary if this is a subclass
> MyClass.prototype = Object.create(Parent.prototype);
> MyClass.prototype.constructor = MyClass;
> MyClass.prototype.parentClass = Parent.prototype;
>
> /**
>  * Declare instance variables so we can JSDoc them.
>  * @type {string}
>  */
> MyClass.prototype.myVar = null;
>
> /**
>  * @override
>  * For override methods, use this pattern for super calls.
>  */
> MyClass.prototype.myMethod = function (arg1, arg2) {
>      // - don't use this.parentClass -- won't work if hierarchy is more than one deep
>      // - use apply(this, arguments) instead of call(this, arg1, arg2) so we don't have to fix it up
>      //   every time we add a new argument
>      MyClass.prototype.parentClass.myMethod.apply(this, arguments);
>      // ... 
> };


## APIs to Use or Avoid ##
On Arrays, use Array.forEach() or Array.some() rather than $.each() or for loops:
> Do this:
> ```
> var anArray = [1, 2, 3, 4];
> anArray.forEach(function (value, index) {
>     // ...
> });
> ```
>
> Not this:
> ```
> for (var i = 0; i < anArray.length; i++) {  // Use Array.forEach()
>     // ...
> }
> ```
>
> Or this:
> ```
> $.each(anArray, function (index, value) {  // Use Array.forEach()
>     // ...
> })
> ```

<br/>
To iterate object keys, use CollectionUtils.forEach() or CollectionUtils.some() rather than $.each() or for-in loops. (This avoids various pitfalls when the keys could have arbitrary values, and matches Array.forEach()'s callback API better).
> Do this:
> ```
> var anObject = { foo: "a", bar: "b", baz: "c" };
> CollectionUtils.forEach(anObject, function (value, key) {
>     // ...
> });
> ```
>
> Not this:
> ```
> for (var key in anObject) {  // Use CollectionUtils.forEach()
>     if (anObject.hasOwnProperty(key)) { /* ... */ }
> }
> ```
>
> Or this:
> ```
> $.each(anObject, function (key, value) {  // Use CollectionUtils.forEach()
>     // ...
> })
> ```

<br/>
Use ViewUtils.toggleClass() instead of jQuery.toggleClass(). (This avoids problems with flags that are truthy/falsy but not strictly boolean).
> Do this:
> `ViewUtils.toggleClass($listItem, "selected", isSelected);`
>
> Not this:
> `$listItem.toggleClass("selected", isSelected);`


## Comments ##
* All comments should be C++ single line style //comment.
* Even multiline comments should use // at the start of each line
* Use C style /* comments */ for notices at the top and bottom of the file
* Use JSDoc tags for annotations with Google's Closure Compiler Type Expressions, see https://developers.google.com/closure/compiler/docs/js-for-compiler
* Annotations should use the /** annotation */
* Annotate all functions

## <a name="error_handling"></a>Exceptions/Asserts/Logging ##

* Use exceptions when encountering an unexpected error and recovery is not possible. In other words, the error means that Brackets will be noticeably broken or data could be corrupted if execution continues.
* Use `console.error()` or `console.assert()` when encountering an unexpected error that *can* be recovered from. In other words, an error occurred and the current operation may not complete successfully, but the overal integrity of the program is not compromised.
* Use `console.log()` to note *unexpected* behavior that is not necessarily an error. 

**NOTE** `console.log()` should **not** be used to log general information.

### Example 1 - `throw` ###

The Document constructor throws an error if a document already exists for the current file. Creating a new document that points to the same file could lead to file corruption if both documents are edited.

```
function Document(file, initialTimestamp, rawText) {
    ...
    if (_openDocuments[file.fullPath]) {
        throw new Error("Creating a document when one already exists, for: " + file);
    }
    ...
}
```

### Example 2 - `console.assert()` ###

In `DocumentManager.closeFullEditor()`, after opening the next file, we check that the `currentDocument` property is updated correctly. This is an error if not true, and may lead to unexpected behavior, but it is not catastrophic.

```
CommandManager.execute(Commands.FILE_OPEN, { fullPath: nextFile.fullPath })
    .done(function () {
        // (Now we're guaranteed that the current document is not the one we're closing)
        console.assert(!(_currentDocument && _currentDocument.file.fullPath === file.fullPath));
    })
```

### Example 3 - `console.log()` ###

The `CommandManager.register()` function uses `console.log()` to note an unexpected (but not dangerous) condition -- the specified command id has already been registered. The code can continue safely from here.

```JS
function register(name, id, commandFn) {
    if (_commands[id]) {
        console.log("Attempting to register an already-registered command: " + id);
        return null;
    }
    ...
}

```