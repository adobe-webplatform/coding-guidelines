This plugin is to generate readme files from many tiny sections of the readme. The readme you are reading is also generated with this plugin!

Lets say you have a readme structure such as:

    - Installation
    - Usage
        -- Example
        -- Example Output
    - Documentation
        -- Options
            --- option1
            --- option2
        -- API
    - License
    - Contributing

- You can write a task to generate `Options.md` from `option1.md` and `option2.md`
- Then a task to generate `Documentation.md` from `Options.md` and `API.md`
- Another task to generate `Usage.md` from `Example.md` and `Example Output.md` files
- And wrap it all up by creating the `Readme.md` from `Installation.md`, `Usage.md`, `Documentation.md`, `License.md` and `Contributing.md`
- voilà !

### Highlights

- Automatic table of contents generation
- Automatic `Back To Top` link generation
- Highly customizable for many many parts of the bigger picture
- Automatic Title and Description generation on the top
- Option to generate travis build status image on the top for desired branch
- Specifically designed for GitHub projects and [GFM](https://help.github.com/articles/github-flavored-markdown)
- Optional banners on the top to put a logo or ascii art!

This plugin requires Grunt `~0.4.1`

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

```shell
npm install grunt-readme-generator --save-dev
```

Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadNpmTasks('grunt-readme-generator');
```