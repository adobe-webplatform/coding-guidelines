                                  _                
                                 (_)               
      __ _ _ __   ___  _ __ __  ___                
     / _` | '_ \ / _ \| '_ \\ \/ / |               
    | (_| | |_) | (_) | | | |>  <| |               
     \__,_| .__/ \___/|_| |_/_/\_\_|               
          | |                                      
          |_|                                      
        ______               ____  ___                 
        | ___ \             | |  \/  |                 
        | |_/ /___  __ _  __| | .  . | ___             
        |    // _ \/ _` |/ _` | |\/| |/ _ \            
        | |\ \  __/ (_| | (_| | |  | |  __/            
        \_| \_\___|\__,_|\__,_\_|  |_/\___|            
                                                       
                                                       
             _____                           _             
            |  __ \                         | |            
            | |  \/ ___ _ __   ___ _ __ __ _| |_ ___  _ __ 
            | | __ / _ \ '_ \ / _ \ '__/ _` | __/ _ \| '__|
            | |_\ \  __/ | | |  __/ | | (_| | || (_) | |   
             \____/\___|_| |_|\___|_|  \__,_|\__\___/|_|   
                                                           
                                                   
# grunt-readme-generator [![Build Status](https://secure.travis-ci.org/aponxi/grunt-readme-generator.png?branch=master)](http://travis-ci.org/aponxi/grunt-readme-generator)

> A grunt task to generate a dynamic readme.md from partial markdown files in readme folder. Specifically designed for GitHub projects!

## Jump to Section

* [Getting Started](#getting-started)
* [Usage](#usage)
* [Options](#options)
* [Release History](#release-history)
* [Legal Mambo Jambo](#legal-mambo-jambo)
* [Tip Me ![](http://i.imgur.com/C0P9DIx.gif?1)](https://www.gittip.com/aponxi/)
* [Donate Me! ![](http://i.imgur.com/2tqfhMO.png?1)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=VBUW4M9LKTR62)

## Getting Started
[[Back To Top]](#grunt-readme-generator-)

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

## Usage
[[Back To Top]](#grunt-readme-generator-)

In your project's Gruntfile, add a section named `readme_generator` to the data object passed into `grunt.initConfig()`.

```js
grunt.initConfig({
  pkg: grunt.file.readJSON('package.json'),
  readme_generator: {
    options: {
      // Task-specific options go here.
      // detailed explanation is under options
      // Default options:
      readme_folder: "readme",
      output: "README.md",
      table_of_contents: true,
      toc_extra_links: [],
      generate_changelog: false,
      changelog_folder: "changelogs",
      changelog_version_prefix: null,
      changelog_insert_before: null,
      banner: null,
      has_travis: true,
      github_username: "aponxi",
      travis_branch: "master",
      generate_footer: true,
      generate_title: true,
      package_title: null,
      package_name: null,
      package_desc: null,
      informative: true,
      h1: "#",
      h2: "##",
      back_to_top_custom: null
    },
    order: {
      // Title of the piece and the File name goes here
      // "Filename" : "Title"
      "installation.md": "Installation",
      "usage.md": "Usage",
      "options.md": "Options",
      "example.md": "Example",
      "output.md": "Example Output",
      "building-and-testing.md": "Building and Testing",
      "legal.md": "Legal Mambo Jambo"
    },
  },
})
```

- You provide with markdown files and the titles in the `order` object which has the format of `file : title`
- It generates the readme by iterating through that array in the given order
- In the example `"building-and-testing.md": "Building and Testing"` it is going to create a section called `Building and Testing`, making it a title; then it will read `building-and-testing.md` file from the readme directory set in `readme_folder` option and insert it after the title. 
- Meaning that you shouldn't have titles in your seperate markdown files or in `building-and-testing.md` for the above example. They are automatically generated from the title.

To test use `grunt test` command and look at the outputs under `test/` folder.

## Options
[[Back To Top]](#grunt-readme-generator-)


### Notes on the features

- Every folder name you provide is relative to the Gruntfile location, which is the root of your project
- If you see on/off yes/no that is true/false in CoffeeScript
- This readme has been generated by this plugin. Therefore the [readme folder](/readme) and the [Gruntfile](/Gruntfile.js) or [Gruntfile.coffee](/Gruntfile.coffee) of this project are great examples. Also you can check out the [test folder](/test) folder.

#### readme_folder 
> the folder where readme partial files are located

- This is the folder where markdown files are located. These markdown files can have any file extension and will be appended into the README.MD file that will be generated.
- As an example I use "/readme" folder in my project directory and it has "banner.md", "legal.md", "options.md" etc. as seen under [readme folder](/readme).

```coffee
readme_folder: "readme" 
```
#### output
> where readme file should be generated in respect to Gruntfile location

- You can name your generated readme file here.
- You can also provide a location which will be in respect to the root of the project
- For example I did `/test/readme_no_banner.md` to generate a readme with the banner option off to test, amongst other readme files.
- This is good to have when you are working with multiple generated markdown files.
- A good example can be seen on the [Gruntfile](/Gruntfile.js) or the default is:

```coffee
output: "README.md" 
```

#### table_of_contents
> generate automatic table of contents

- This generates automatic table of contents
- After each title for a _section_ it will generate _Back To Top_ links to navigate to the top
- This is either on/off (coffeescript) or true/false (javascript)
- Default is on

```coffee
table_of_contents: on
```

#### toc_extra_links
> Sometimes I like adding quick-links on the top in table of contents. Table of contents (TOC) must be enabled for this option to matter

- This adds extra links to the table of contents
- The need for this was to add a donation link, or link to issues page. Which is something that doesn't belong anywhere else than some navigation bar.
- You supply it with an array of the exact text you want on there. It copy pastes exactly what's written, doesn't auto-formats like it does when generating the table of contents from files provided.
- What I use for my purposes is donation links and they are like so:

```coffee
toc_extra_links: [
    "[Tip Me ![](http://i.imgur.com/C0P9DIx.gif?1)](https://www.gittip.com/aponxi/)"
    "[Donate Me! ![](http://i.imgur.com/2tqfhMO.png?1)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=VBUW4M9LKTR62)"
    ]
```

- However, it is an empty array by default

```coffee
toc_extra_links: [] 
```

#### generate_changelog
> generates automatic changelog

- This feature adds the latest changelog from the folder that you write your markdown formatted changelog files and inserts it in the readme file. I usually have so many logs that I just want to add the latest changes in the Readme file.
- It sorts the changelog files found alphabetically to tell which one is the newest
- Check out [changelogs folder](/changelogs) folder to reference formatting 
- Files can have a prefix if you want to eliminate old changelogs from being processed. To do so refer to the [changelog_version_prefix](#changelog_version_prefix) option.
- Usually files are named such as `0.1.2.md`, `0.11.0.markdown`, `1.0.0.mdown` etc
- This feature is either `on` or `off` (true/false for javascript)
- *Important:* If this feature is on, then you must have some changelog files under your changelog folder
- By default it is `off`:

```coffee
generate_changelog: off 
```

#### changelog_folder
> where changelog files are located

- If you keep your changelogs in a folder, specify it here
- It is a string of the folder name in respect to the project root
- Some examples would be `test/changelogs`, `changelog`, `release_history`, `docs/changelog` etc.
- By default it is `changelogs` folder

```coffee
changelog_folder: "changelogs" 
```

#### changelog_version_prefix
> under changelog folder, there are files like v0.1.0.md if the prefix is "V"

- As I've mentioned above, this is a rule for targeting only prefixed changelogs.
- If you have `_2.4.3.md` in there for some reason and other changelogs as `v2.4.2.md`, `v2.4.3.md` you could easily include only those two files by setting prefix to `"v"`. It would only look for files that start with `v` and sort from those.

```coffee
changelog_version_prefix: null 
```

#### changelog_insert_before
> I like my legal stuff at the bottom of the readme and release history before that

- Let's say you like sorting things a bit differently and think that Legal stuff should be at the bottom of your readme file. No worries! Just tell it to place changelogs before `legal.md`
- *Important:* The file you set must be in the `order` list in the task. Meaning that it should be something that is going to be included in the readme file. If there is no `legal.md` file that will be included in the generated readme, then it will put the changelog in the end of the file.
- This is separate than the `order` object you set for the task because changelog is automatically generated
- Examples for this can be any file from the `order` list. For this readme I could have chosen `getting_started.md` or `usage.md` as well... But it would have been very silly.
- Default is:

```coffee
changelog_insert_before: null 
```

#### banner
> I like some ascii art on the top of the readme

- This is one of the visually enhancing features. You can supply a header for your readme files in text format.
- I usually add an ascii logo of my project name. But you can provide logos, or other texts that you want to display on the top of the readme.
- It should be the path of the file in respect to the readme folder.
- Examples: `"test/banner.md"`, `"my_header.md"`, `"my_plain_header.txt"`
- It accepts a string and default is:

```coffee
banner: null 
```

#### has_travis
> I use travis a lot and want to have the travis image generated on the top

- If you use travis, you can add the image of your master branch automatically generated with this option
- If you aren't generating title automatically then this has no purpose, because it is displayed near the title.
- This option is either on or off
- By default:

```coffee
has_travis: on
```

#### github_username
> this is mainly for travis link

- When you are using travis, your username may not be gotten from the package.json
- Who knows if your username is the same as the author name, and who is to say which author you are!
- Therefore, you supply it with your username to have it generate the link as `user/repo`
- By default it has my username:

```coffee
github_username: "aponxi" 
```

#### travis_branch
> this specifies the travis branch that you want to use for the build status logo

- If you want to use develop branch for your travis build status logo then set it to `"develop"
`
- This only works if you have `generate_title` and `has_travis` turned `on`

- By default:

```coffee
travis_branch : "master"
```

#### generate_footer
> generates automatic footer that tells the time it was generated using this task

- You may want to call it my watermark, and you don't have to have it there at all!
- Although it would make me happy to see it there :)
- This adds a small footnote saying that this readme was generated by this grunt task and when it was generated.
- Example can be found on the bottom of this file (assuming that you are reading from the generated readme file and not the options.md)
- It can be either on/off for CoffeeScript and true/false for Javascript
- By default:

```coffee
generate_footer: on 
```

#### generate_title
> generates automatic title from package name and description

- This option is related to all the travis options.
- If this option is off, then travis options are disregarded.
- This option gets the package name and the package description from the `package_name` and `package_desc` options if they are set. If they aren't, then it gets the package name and description from the package.json file. Then the package name and descriptions are added to the top of the readme file.
- Be warned that table of contents uses the package name anchor to go to the top. So, if you aren't going to use this feature then have a title with the package_name in the readme.
- If you aren't going to supply either name or description via options, then you should dd `pkg` configuration to your `grunt.initConfig` so that we can scavenge it from the package.json for you. To do so add this line under `grunt.initConfig` in your Gruntfile: 

```js
grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    //....
```

- It can be either on/off for CoffeeScript and true/false for Javascript
- By default:

```coffee
generate_title: on 
```

#### package_title
> This can be different than the package name, this will be on the title of the readme and used for anchor purposes to go back to the top

- This overrides `package_name` option for title.
- Allows you to customize your Readme title
- For example instead of `grunt-readme-generator` I could say `Readme Generator`

#### package_name
> by default we get it from the package.json

- `Back to top` links from `Table of Contents` uses this to generate anchors that link to the title, thus allowing to jump to the top of the page.
- While generating the travis image, we use package name
- `Generate title` also uses this to generate the title
- This option accepts a string such as `"My Plugin Title"`
- By default it is empty, allowing the pacakge name to be gotten from package.json. To have it get it from package.json you must  add this line under `grunt.initConfig` in your Gruntfile: 

```js
grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    //....
```

- Default value:

```coffee
package_name : null 
```
#### package_desc
> by default we get it from package.json

- `Generate title` uses this to generate the title
- This option accepts a string such as `"My Plugin Description"`
- Feel free to use any markdown formats. However, it will be added as a quote with `>` in the beginning of the description.
- By default it is empty, allowing the package description to be gotten from package.json. To have it get it from package.json you must  add this line under `grunt.initConfig` in your Gruntfile: 

```js
grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    //....
```

- Default value:

```coffee
package_desc : null 
```

#### informative
> tell the people what's going on (verbose)

- This is somewhat for verbose outputs
- Informs what the task is doing 
- It can be either on/off, yes/no for CoffeeScript and true/false for Javascript
- By default:

```coffee
informative : yes 
```

- Example output:

```
>> Generating banner...
>> Writing package name and description...
>> Engineering travis button...
>> Generating table of contents...
>> Adding the generation message, thank you...
Your readme file "test/readme_no_changelog.md" is ready!
```

#### h1
> for the auto generated title of the readme

- If you are generating a documentation from many different markdown files then you would probably want the big titles be `### option group` and smaller titles be `#### option` and when you are generating the whole readme from another grunt task then you would want the title of the many option groups to be `##Options`
- By setting this option to `###` you can make the titles of the markdown files to be `### title`
- Be sure to set `h2` option to `####` for that case, so that sub-titles will appear nicely.
- By default:

```coffee
h1 : "#"
```

#### h2
> for the auto generated title of the section, like usage or legal or installation parts of the readme

- Similar to the `h1` option, set this to make the sub-titles appear differently
- Usually used with `h1` option
- By default:

```coffee
h2 : "##"
```

#### back_to_top_custom
> where backtotop leads you, by default it takes you to the title of the readme

- This is used with `table_of_contents` option
- Normally, it would take you to the title of the readme page. This is to override that.
- If you want to change that for whatever reason, set it to the exact link you want to provide
- for example `back_to_top_custom : "#my-custom-anchor-in-the-readme-page"`
- By default:

```coffee
back_to_top_custom : null
```

## Release History
[[Back To Top]](#grunt-readme-generator-)

You can find [all the changelogs here](/changelogs).

### Latest changelog is for [v0.2.0.md](/changelogs/v0.2.0.md):

#### v0.2.32 06/Jun/2013
- fixed typos
- grunt support added for travis

#### v0.2.3 06/Jun/2013
- Check null checks and empty strings for option failsafe
- Get the package info once #7
- add these new options
-- travis_branch #3
-- package_title
-- h1 #5
-- h2 #5
-- back_to_top_custom
- Latest changelog is `h2 + #`. So if h2 is `##`, then it is `###Latest Changelog`. Because `##` would be Release history title and latest changelog is its sub-title.

#### v0.2.2 05/Jun/2013
- Minor typo fixes
- added keywords to package
- released the package

#### v0.2.0 05/Jun/2013
- Wrote the documentation
- Fixed some more issues with prefix check. Now if there isn't a prefix, it sorts the files under changelog alphabetically. z0.1.0.md, and v0.1.0.md are both included in the sorting process.
- changed some default options to more convenient values
- updated docs
- added more tests
- updated keywords and package desc.


## Legal Mambo Jambo
[[Back To Top]](#grunt-readme-generator-)

Copyright © 2013 aponxi <aponxi@weaponxi.com>

This software is licensed under [MIT License](http://aponxi.mit-license.org/).



--------
<small>_This readme has been automatically generated by [readme generator](https://github.com/aponxi/grunt-readme-generator) on Thu Jun 06 2013 17:51:02 GMT-0400 (EDT)._</small>