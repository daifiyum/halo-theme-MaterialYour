const {series, parallel, src, dest, watch} = require('gulp');
const header = require('gulp-header');
const autoprefix = require("gulp-autoprefixer");
const minifyCSS = require("gulp-csso");
const purgecss = require("gulp-purgecss");
const less = require('gulp-less');
const rename = require("gulp-rename");
const babel = require("gulp-babel");
const uglify = require("gulp-uglify");
const livereload = require('gulp-livereload');

//为文件添加头部信息
const pkg = require('./package.json');
const template = ['/**',
    ' * <%= pkg.name %> - <%= pkg.description %>',
    ' * @authors <%= pkg.author %>',
    ' * @version v<%= pkg.version %>',
    ' * @link <%= pkg.homepage %>',
    ' * @license <%= pkg.license %>',
    ' */',
    ''
].join('\n');

function css() {
  return src(['./templates/assets/css/less/main.less'])
  .pipe(less())
  .pipe(
    purgecss({//删除无用css样式
      content: ["./templates/**/*.html", "./templates/assets/libs/**/*.css", "./templates/assets/**/*.js"],
    })
  )
  .pipe(
    autoprefix({
      overrideBrowserslist: ["> 2%", "last 2 versions", "not ie 6-9"],
      cascade: false,
    })
  )
  .pipe(minifyCSS())
  .pipe(header(template, { pkg : pkg } ))
  .pipe(
    rename({
      basename: "style.min",
    })
  )
  .pipe(dest("./templates/assets/css/min"));
}

//由于可能对mdui框架内的mdui.css进行更改，所以加入mdui.css的压缩
function mduiCss() {
  return src(["./templates/assets/libs/mdui/mdui.css"])
    .pipe(minifyCSS())
    .pipe(
      rename({
        suffix: ".min",
      })
    )
    .pipe(dest("./templates/assets/libs/mdui/"));
}

//./source/js/*.js内的js压缩
function js() {
  return src(["./templates/assets/js/*.js"])
    .pipe(
      babel({
        presets: [
          [
            "@babel/preset-env",
            {
              targets: "> 2%, last 2 versions, not ie 6-9"
            },
          ],
        ],
      })
    )
    .pipe(uglify())
    .pipe(header(template, { pkg : pkg } ))
    .pipe(
      rename({
        suffix: ".min",
      })
    )
    .pipe(dest("./templates/assets/js/min"));
}

function serve() {
  livereload.listen();
  watch('./templates/assets/css/less/*.less', css);
  watch('./templates/assets/js/*.js', js);
}

exports.mduiCss = mduiCss;
exports.css = css;
exports.js = js;
exports.serve = serve;
//series顺序执行，从左往右，parallel同步执行，所有一起执行
exports.default = series(css, js, serve);
exports.build = series(css, js);