const gulp = require("gulp");
const { src, dest } = require("gulp");
const autoprefix = require("gulp-autoprefixer");
const minifyCSS = require("gulp-csso");
const purgecss = require("gulp-purgecss");
const rename = require("gulp-rename");
const babel = require("gulp-babel");
const uglify = require("gulp-uglify");


gulp.task("css", function () {
  return src(["./source/css/style.css", "./source/css/darkMode.css"])
    .pipe(
      purgecss({
        content: ["./**/*.ftl", "./source/libs/**/*.css", "./source/**/*.js"],
      })
    )
    .pipe(
      autoprefix({
        overrideBrowserslist: ["> 2%", "last 2 versions", "not ie 6-9"],
        cascade: false,
      })
    )
    .pipe(minifyCSS())
    .pipe(
      rename({
        suffix: ".min",
      })
    )
    .pipe(dest("./source/css/min"));
});
gulp.task("mduiCSS",function(){
    return src(["./source/libs/mdui/mdui.css"])
    .pipe(minifyCSS())
    .pipe(
      rename({
        suffix: ".min",
      })
    )
    .pipe(dest("./source/libs/mdui/"));
})
gulp.task("js", function () {
  return src(["./source/js/*.js"])
    .pipe(
      babel({
        presets: ["@babel/env"],
      })
    )
    .pipe(uglify())
    .pipe(
      rename({
        extname: ".min.js",
      })
    )
    .pipe(dest("./source/js/min"));
});

gulp.task(
    "default",
    gulp.series(
        gulp.parallel( "css", "js" )
    )
);