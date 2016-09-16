/*gruntfile.js*/

module.exports = function(grunt) {

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    watch: {
      browserify: {
        files: ['src/*.js'],
        tasks: ['browserify']
      },
      extra: {
        files: ['src/**/*.js'],
        tasks: ['browserify']
      }
    },

    browserify: {
      dist: {
        options: {
           transform: [['babelify', {presets: ['es2015', 'react']}]]
        },        
        src: ['src/index.js'],
        dest: 'public/js/index.js',
      }
    }

  });

  grunt.loadNpmTasks('grunt-contrib-watch');  
  grunt.loadNpmTasks('grunt-browserify');

  grunt.registerTask('default', ['browserify']);

};