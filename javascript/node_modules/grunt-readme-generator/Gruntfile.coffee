#
# * grunt-readme-generator
# * https://github.com/aponxi/grunt-readme-generator
# *
# * Copyright (c) 2013 Logan Howlett
# * Licensed under the MIT license.

"use strict"
module.exports = (grunt) ->
  
  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    
    # Before generating any new files, remove any previously-created files.
    clean:
      tests: [
        "test/readme.md"
        "test/readme_no_toc.md"
        "test/readme_all_options.md"
        "test/readme_no_travis.md"
        "test/readme_no_footer.md"
        "test/readme_no_changelog.md"
        "test/default_options.md"
        "test/testing_anomallies.md"
        "test/readme_different_header.md"
      ]

    
    # Configuration to be run (and then tested).
    readme_generator:
      default_options:
        options:
          output: "test/default_options.md"
          readme_folder: "test/readme"
          changelog_folder: "test/changelogs"
        order:
          "installation.md" : "Installation"
          "usage.md" :"Usage"
          "options.md" :"Options"
          "example.md":"Example"
          "output.md":"Example Output"
          "building-and-testing.md":"Building and Testing"
          "legal.md" : "Legal Mambo Jambo"
      testing_anomallies:
        options:
          generate_changelog: on
          has_travis: on
          output: "test/testing_anomallies.md"
          table_of_contents: on
          readme_folder: "test/readme"
          changelog_folder: "test/changelogs"
          changelog_version_prefix: ""
          toc_extra_links: [
            "[Tip Me ![](http://i.imgur.com/C0P9DIx.gif?1)](https://www.gittip.com/aponxi/)"
            "[Donate Me! ![](http://i.imgur.com/2tqfhMO.png?1)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=VBUW4M9LKTR62)"
          ]
          banner: "banner.md"

        order:
          "installation.md" : "Installation"
          "usage.md" :"Usage"
          "options.md" :"Options"
          "example.md":"Example"
          "output.md":"Example Output"
          "building-and-testing.md":"Building and Testing"
          "legal.md" : "Legal Mambo Jambo"
      no_toc:
        options:
          generate_changelog: on 
          has_travis: on
          output: "test/readme_no_toc.md"
          table_of_contents: off
          readme_folder: "test/readme"
          changelog_folder: "test/changelogs"
          changelog_version_prefix: "v"
          toc_extra_links: [
            "[Tip Me ![](http://i.imgur.com/C0P9DIx.gif?1)](https://www.gittip.com/aponxi/)"
            "[Donate Me! ![](http://i.imgur.com/2tqfhMO.png?1)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=VBUW4M9LKTR62)"
          ]
          banner: "banner.md"

        order:
          "installation.md" : "Installation"
          "usage.md" :"Usage"
          "options.md" :"Options"
          "example.md":"Example"
          "output.md":"Example Output"
          "building-and-testing.md":"Building and Testing"
          "legal.md" : "Legal Mambo Jambo"
      all_options:
        options:
          generate_changelog: on 
          has_travis: on
          output: "test/readme_all_options.md"
          table_of_contents: on
          readme_folder: "test/readme"
          changelog_folder: "test/changelogs"
          changelog_version_prefix: "v"
          toc_extra_links: [
            "[Tip Me ![](http://i.imgur.com/C0P9DIx.gif?1)](https://www.gittip.com/aponxi/)"
            "[Donate Me! ![](http://i.imgur.com/2tqfhMO.png?1)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=VBUW4M9LKTR62)"
          ]
          banner: "banner.md"

        order:
          "installation.md" : "Installation"
          "usage.md" :"Usage"
          "options.md" :"Options"
          "example.md":"Example"
          "output.md":"Example Output"
          "building-and-testing.md":"Building and Testing"
          "legal.md" : "Legal Mambo Jambo"
      different_header:
        options:
          generate_changelog: on 
          h1:"##"
          h2 : "###"
          has_travis: on
          output: "test/readme_different_header.md"
          table_of_contents: on
          readme_folder: "test/readme"
          changelog_folder: "test/changelogs"
          changelog_version_prefix: "v"
          toc_extra_links: [
            "[Tip Me ![](http://i.imgur.com/C0P9DIx.gif?1)](https://www.gittip.com/aponxi/)"
            "[Donate Me! ![](http://i.imgur.com/2tqfhMO.png?1)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=VBUW4M9LKTR62)"
          ]
          banner: "banner.md"

        order:
          "installation.md" : "Installation"
          "usage.md" :"Usage"
          "options.md" :"Options"
          "example.md":"Example"
          "output.md":"Example Output"
          "building-and-testing.md":"Building and Testing"
          "legal.md" : "Legal Mambo Jambo"
      no_travis:
        options:
          generate_changelog: on 
          has_travis: off
          output: "test/readme_no_travis.md"
          table_of_contents: on
          readme_folder: "test/readme"
          changelog_folder: "test/changelogs"
          changelog_version_prefix: "v"
          toc_extra_links: [
            "[Tip Me ![](http://i.imgur.com/C0P9DIx.gif?1)](https://www.gittip.com/aponxi/)"
            "[Donate Me! ![](http://i.imgur.com/2tqfhMO.png?1)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=VBUW4M9LKTR62)"
          ]
          banner: "banner.md"

        order:
          "installation.md" : "Installation"
          "usage.md" :"Usage"
          "options.md" :"Options"
          "example.md":"Example"
          "output.md":"Example Output"
          "building-and-testing.md":"Building and Testing"
          "legal.md" : "Legal Mambo Jambo"
      no_footer:
        options:
          generate_changelog: on 
          has_travis: on
          output: "test/readme_no_footer.md"
          table_of_contents: on
          readme_folder: "test/readme"
          changelog_folder: "test/changelogs"
          changelog_version_prefix: "v"
          toc_extra_links: [
            "[Tip Me ![](http://i.imgur.com/C0P9DIx.gif?1)](https://www.gittip.com/aponxi/)"
            "[Donate Me! ![](http://i.imgur.com/2tqfhMO.png?1)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=VBUW4M9LKTR62)"
          ]
          generate_footer: no
          banner: "banner.md"

        order:
          "installation.md" : "Installation"
          "usage.md" :"Usage"
          "options.md" :"Options"
          "example.md":"Example"
          "output.md":"Example Output"
          "building-and-testing.md":"Building and Testing"
          "legal.md" : "Legal Mambo Jambo"
      no_release_history:
        options:
          has_travis: on
          output: "test/readme_no_changelog.md"
          table_of_contents: on
          readme_folder: "test/readme"
          generate_changelog: off
          toc_extra_links: [
            "[Tip Me ![](http://i.imgur.com/C0P9DIx.gif?1)](https://www.gittip.com/aponxi/)"
            "[Donate Me! ![](http://i.imgur.com/2tqfhMO.png?1)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=VBUW4M9LKTR62)"
          ]
          banner: "banner.md"

        order:
          "installation.md" : "Installation"
          "usage.md" :"Usage"
          "options.md" :"Options"
          "example.md":"Example"
          "output.md":"Example Output"
          "building-and-testing.md":"Building and Testing"
          "legal.md" : "Legal Mambo Jambo"
      
      this_readme:
        options:
          readme_folder: "readme"
          output: "README.md"

          table_of_contents: on
          toc_extra_links: [
            "[Tip Me ![](http://i.imgur.com/C0P9DIx.gif?1)](https://www.gittip.com/aponxi/)"
            "[Donate Me! ![](http://i.imgur.com/2tqfhMO.png?1)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=VBUW4M9LKTR62)"
          ]

          generate_changelog: on
          changelog_folder: "changelogs"
          changelog_version_prefix: "v"
          changelog_insert_before: "legal.md"

          banner: "banner.md"

          has_travis: yes
          github_username: "aponxi"

          generate_footer: on

          generate_title: on
          package_name : ""
          package_desc : ""

          informative : yes

        order:
          "getting_started.md" : "Getting Started"
          "usage.md" :"Usage"
          "options.md" :"Options"
          "legal.md" : "Legal Mambo Jambo"

  
  # Actually load this plugin's task(s).
  grunt.loadTasks "tasks"
  
  # These plugins provide necessary tasks.
  grunt.loadNpmTasks "grunt-contrib-clean"
  
  # Whenever the "test" task is run, first clean the "tmp" dir, then run this
  # plugin's task(s), then test the result.
  grunt.registerTask "test", [
    "clean", 
    "readme_generator:all_options"
    "readme_generator:no_toc"
    "readme_generator:no_travis"
    "readme_generator:no_footer"
    "readme_generator:no_release_history"
    "readme_generator:default_options"
    "readme_generator:testing_anomallies"
    "readme_generator:different_header"
  ]

  grunt.registerTask "build", [
    "readme_generator:this_readme"
  ]
  grunt.registerTask "default", ["build"]