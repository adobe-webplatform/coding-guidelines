/*global module:false*/
module.exports = function(grunt) {

    // Project configuration.
    grunt.initConfig({
        // Task configuration.
        pkg: grunt.file.readJSON('package.json'),
        readme_generator: {
            readme: {
                options: {
                    readme_folder: "docs",
                    output: "README.md",
                    table_of_contents: true,
                    generate_changelog: false,
                    has_travis: false,
                    generate_footer: false,
                    generate_title: true,
                    package_name: "JavaScript Coding Guidelines",
                    package_desc: '<%= pkg.description %>',
                },
                order: {
                    "jslint.md": "JSLint",
                    "globals.md": "Globals",
                    "primitives.md": "Primitives",
                    "whitespace.md": "Whitespace",
                    "semicolons.md": "Semicolons",
                    "quotes.md": "Quotes",
                    "commas.md": "Commas",
                    "syntax.md": "Syntax",
                    "functions.md": "Functions",
                    "modules.md": "Modules",
                    "api.md": "API",
                    "jquery.md": "jQuery"
                },
            },
        },
        watch: {
            files: ['Gruntfile.js', 'docs/**/*.md'],
            tasks: ['readme_generator']
        }
    });

    // These plugins provide necessary tasks.
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-readme-generator');

    // Default task.
    grunt.registerTask('default', ['readme_generator']);

};
