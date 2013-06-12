```javascript
var coffee_init = require('coffee-init');
coffee_init.awesome(); // "awesome"
```

If the output's line is more than the maximum bytes, then the rest of the characters will be treated as if it's in the next line. Meaning that you can find a very long line split into two in the `output` array key. Right now the max char limit is `16384` bytes.
