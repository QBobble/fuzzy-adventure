module.exports = function(grunt) {

    // 1. All configuration goes here 
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),

        coffee: {
            compileWithMaps: {
                options: {
                    sourceMaps: true
                },
                files: {
                    "js/main.js": "js/coffee/*.coffee"
                }
            }
        },

        watch: {
            scripts: {
                files: ["js/coffee/*.coffee"],
                tasks: ["coffee"],
                options: {
                    spawn: false
                }
            },

            options: {
                livereload: true
            }
        }

    });

    // 3. Where we tell Grunt we plan to use this plug-in.
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-watch');


    // 4. Where we tell Grunt what to do when we type "grunt" into the terminal.
    grunt.registerTask('default', ['coffee', 'watch']);

};
