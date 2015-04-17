gulp = require 'gulp'
plugins = (require 'gulp-load-plugins')()

gulp.task 'scripts', ->
  gulp.src 'src/scripts/*.coffee'
    .pipe plugins.coffee({bare: true})
    .pipe gulp.dest 'dist'

gulp.task 'templates', ->
  gulp.src 'src/templates/*.jade'
    .pipe plugins.jade({})
    .pipe gulp.dest 'dist'

gulp.task 'icons', ->
  gulp.src 'assets/icons/**/*.png'
    .pipe gulp.dest 'dist'

gulp.task 'watch', ->
  gulp.watch 'src/scripts/*.coffee', ['scripts']
  gulp.watch 'src/templates/*.jade', ['templates']

gulp.task 'build', ['scripts','templates','icons']

gulp.task 'default', ['build','watch']
